import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'src/art/backdrop.dart';
import 'src/art/character.dart';
import 'src/content/models.dart';
import 'src/game_controller.dart';
import 'src/theme.dart';
import 'src/widgets/bits.dart';
import 'src/widgets/hud.dart';
import 'src/widgets/overlays.dart';

void main() => runApp(const MylApp());

class MylApp extends StatelessWidget {
  const MylApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Your Language',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1206),
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  final g = GameController();
  late final AnimationController _walk;
  late final AnimationController _idle;
  bool _walking = false;

  @override
  void initState() {
    super.initState();
    _idle = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2600))
      ..repeat(reverse: true);
    _walk = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100));
    _walk.addStatusListener((s) {
      if (s == AnimationStatus.completed && _walking) {
        _walking = false;
        g.finishWalk();
      }
    });
    g.addListener(_onGame);
    g.load();
  }

  void _onGame() {
    if (g.phase == Phase.walking && !_walking) {
      _walking = true;
      _walk.forward(from: 0);
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    g.removeListener(_onGame);
    _walk.dispose();
    _idle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, box) {
            // Fit the whole console (scene + controls) into the viewport where
            // possible, so all four comebacks stay on screen without scrolling.
            const controlsH = 232.0;
            final availH = box.maxHeight - 28;
            var w = box.maxWidth.clamp(320.0, 1120.0);
            if (w * 9 / 16 + controlsH > availH) {
              w = ((availH - controlsH) * 16 / 9).clamp(320.0, w);
            }
            final sceneH = w * 9 / 16;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Center(
                  child: SizedBox(
                    width: w,
                    child: _frame(w, sceneH),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _frame(double w, double sceneH) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.panelEdge, width: 2),
        boxShadow: const [BoxShadow(color: Color(0x8C000000), blurRadius: 50, offset: Offset(0, 20))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: w, height: sceneH, child: _scene(w, sceneH)),
          _controls(w),
        ],
      ),
    );
  }

  // ---- the play scene ----
  Widget _scene(double w, double h) {
    final showChars = _phaseShowsScene;
    return GestureDetector(
      onTap: g.phase == Phase.dialogue ? g.nextLine : null,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.string(
              backdropSvg(_activeZone.scene),
              fit: BoxFit.cover,
            ),
          ),
          if (showChars) ..._players(w, h),
          if (_phaseShowsHud) Positioned(top: 0, left: 0, right: 0, child: Hud(g)),
          if (_phaseShowsHud)
            Positioned(
              top: 14,
              left: 14,
              child: BackChip(label: g.s.backLabel, onBack: g.toGameSelect),
            ),
          if (_phaseShowsHud)
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(child: LocationChip('${_activeZone.name} · ${g.encounterLabel}')),
            ),
          if (_phaseShowsBubble) _bubble(w, h),
          if (g.phase == Phase.feedback)
            FeedbackOverlay(g, onNext: g.advance),
          ..._modalOverlays(),
        ],
      ),
    );
  }

  List<Widget> _players(double w, double h) {
    final charH = h * 0.5;
    return [
      // player
      Positioned(
        left: w * 0.10,
        bottom: -h * 0.02,
        child: _bob(CharacterView(spec: g.game.player, height: charH), phase: 0),
      ),
      // npc — slides in from the right during a walk transition
      AnimatedBuilder(
        animation: _walk,
        builder: (context, child) {
          final t = _walking ? Curves.easeOut.transform(_walk.value) : 1.0;
          return Positioned(
            right: w * 0.10 - (1 - t) * w * 0.7,
            bottom: -h * 0.02,
            child: Opacity(opacity: t.clamp(0.0, 1.0), child: child!),
          );
        },
        child: _bob(CharacterView(spec: _npcSpec, height: charH), phase: 1),
      ),
    ];
  }

  Widget _bob(Widget child, {required int phase}) {
    return AnimatedBuilder(
      animation: _idle,
      builder: (_, c) {
        final v = _idle.value;
        final dy = (phase == 0 ? v : 1 - v) * 6 - 3;
        return Transform.translate(offset: Offset(0, dy), child: c);
      },
      child: child,
    );
  }

  Widget _bubble(double w, double h) {
    final isPlayerLine =
        g.phase == Phase.dialogue && g.currentLine.who == Speaker.player;
    final who = isPlayerLine ? 'YOU' : g.encounter.npcName;
    final text =
        g.phase == Phase.choosing ? g.round.insult : g.currentLine.text;
    final bubble = SpeechBubble(who: who, text: text, fromNpc: !isPlayerLine);
    final s = g.s;
    return Positioned(
      top: h * 0.14,
      left: isPlayerLine ? w * 0.04 : null,
      right: isPlayerLine ? null : w * 0.04,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: w * 0.5),
        child: Column(
          crossAxisAlignment:
              isPlayerLine ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            bubble,
            if (g.phase == Phase.dialogue)
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 6, left: 6),
                child: Text(s.tapContinue,
                    style: const TextStyle(color: C.cream, fontSize: 11, letterSpacing: 1)),
              ),
          ],
        ),
      ),
    );
  }

  // ---- controls area ----
  Widget _controls(double w) {
    Widget body;
    if (g.phase == Phase.choosing || g.phase == Phase.feedback) {
      body = _choices();
    } else if (g.phase == Phase.dialogue) {
      body = _ControlsHint(g.s.notFinished);
    } else {
      body = const _ControlsHint('...');
    }
    return Container(
      width: w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [C.panel2, C.panel]),
        border: Border(top: BorderSide(color: C.panelEdge, width: 2)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: body,
    );
  }

  Widget _choices() {
    final choices = g.choices;
    final disabled = g.phase != Phase.choosing;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(g.s.howRespond,
                style: const TextStyle(
                    fontFamily: kDisplayFont, fontFamilyFallback: kSerif, fontSize: 20, color: C.cream, letterSpacing: 1.2)),
            const SizedBox(width: 10),
            Flexible(
              child: Text(g.s.respondSub,
                  style: const TextStyle(color: C.txtDim, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LayoutBuilder(builder: (context, c) {
          final twoCol = c.maxWidth > 620;
          final tileW = twoCol ? (c.maxWidth - 10) / 2 : c.maxWidth;
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < choices.length; i++)
                SizedBox(
                  width: tileW,
                  child: _ChoiceCard(
                    letter: String.fromCharCode(65 + i),
                    text: choices[i].text,
                    onTap: disabled ? null : () => g.choose(choices[i]),
                  ),
                ),
            ],
          );
        }),
      ],
    );
  }

  // ---- modal (full-scene) overlays ----
  List<Widget> _modalOverlays() {
    switch (g.phase) {
      case Phase.gameSelect:
        return [GameSelectOverlay(g, onSelect: g.selectGame)];
      case Phase.title:
        return [
          TitleOverlay(g,
              onPlay: (z) => g.startRun(fromZone: z), onBack: g.toGameSelect)
        ];
      case Phase.zoneCard:
        return [ZoneCardOverlay(g, onGo: g.beginZone)];
      case Phase.zoneClear:
        return [ZoneClearOverlay(g, onContinue: g.afterZoneClear)];
      case Phase.gameOver:
        return [GameOverOverlay(g, onRetry: g.retryFromCheckpoint, onQuit: g.toGameSelect)];
      case Phase.win:
        return [WinOverlay(g, onDone: g.toGameSelect)];
      default:
        return const [];
    }
  }

  // ---- phase helpers ----
  bool get _phaseShowsScene => const {
        Phase.title,
        Phase.walking,
        Phase.dialogue,
        Phase.choosing,
        Phase.feedback,
      }.contains(g.phase);

  bool get _phaseShowsHud => const {
        Phase.walking,
        Phase.dialogue,
        Phase.choosing,
        Phase.feedback,
      }.contains(g.phase);

  bool get _phaseShowsBubble =>
      g.phase == Phase.dialogue || g.phase == Phase.choosing;

  /// The zone whose backdrop should be showing (valid in every phase since a
  /// game is always selected).
  Zone get _activeZone => g.zone;

  CharacterSpec get _npcSpec =>
      (g.phase == Phase.title || g.phase == Phase.gameSelect)
          ? g.game.avatar
          : g.encounter.npc;
}

class _ControlsHint extends StatelessWidget {
  final String text;
  const _ControlsHint(this.text);
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 96,
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: C.txtDim, fontSize: 13, height: 1.4)),
        ),
      );
}

class _ChoiceCard extends StatefulWidget {
  final String letter;
  final String text;
  final VoidCallback? onTap;
  const _ChoiceCard({required this.letter, required this.text, required this.onTap});
  @override
  State<_ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<_ChoiceCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          transform: Matrix4.translationValues(0, enabled && _hover ? -2 : 0, 0),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: enabled && _hover ? C.choiceHover : C.choiceBg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: enabled && _hover ? C.postbox : C.ink, width: 2),
            boxShadow: const [C.cutShadow],
          ),
          child: Opacity(
            opacity: enabled ? 1 : 0.55,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: C.panel,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: C.ink, width: 1.5),
                  ),
                  child: Text(widget.letter,
                      style: const TextStyle(
                          fontFamily: kDisplayFont, fontFamilyFallback: kSerif, fontSize: 16, color: C.brass)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(widget.text,
                      style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontFamilyFallback: kSerif,
                          color: C.ink,
                          fontSize: 14.5,
                          height: 1.3)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
