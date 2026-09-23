import 'package:flutter/material.dart';

import '../content/models.dart';
import '../game_controller.dart';
import '../theme.dart';
import 'bits.dart';
import 'markup.dart';

class _Scrim extends StatelessWidget {
  final Widget child;
  final double opacity;
  const _Scrim({required this.child, this.opacity = 0.82});
  @override
  Widget build(BuildContext context) => Positioned.fill(
        child: Container(
          color: C.panel.withValues(alpha: opacity),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(child: child),
        ),
      );
}

Widget _big(String text, Color color, {double size = 52}) => Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: kDisplayFont,
        fontSize: size,
        height: 1.02,
        color: color,
        letterSpacing: 1.5,
        shadows: const [Shadow(color: Color(0x66000000), offset: Offset(2, 3))],
      ),
    );

class _Chip extends StatelessWidget {
  final String text;
  final Color color;
  const _Chip(this.text, this.color);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.6), width: 1.5),
        ),
        child: Text(text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w800, fontSize: 13, letterSpacing: .5)),
      );
}

// --------------------------------------------------------------------------
// Game Select (root)
// --------------------------------------------------------------------------
class GameSelectOverlay extends StatelessWidget {
  final GameController g;
  final void Function(Game) onSelect;
  const GameSelectOverlay(this.g, {super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return _Scrim(
      opacity: 0.94,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('MIND YOUR LANGUAGE',
              textAlign: TextAlign.center,
              style: T.logo(42, color: C.cream)),
          const SizedBox(height: 12),
          const Text('SELECT A GAME',
              style: TextStyle(
                  color: C.txtDim, letterSpacing: 6, fontWeight: FontWeight.w800, fontSize: 13)),
          const SizedBox(height: 22),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              for (final game in g.games)
                _GameCard(game: game, best: g.bestForGame(game), onTap: () => onSelect(game)),
            ],
          ),
        ],
      ),
    );
  }
}

class _GameCard extends StatefulWidget {
  final Game game;
  final int best;
  final VoidCallback onTap;
  const _GameCard({required this.game, required this.best, required this.onTap});
  @override
  State<_GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<_GameCard> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final game = widget.game;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: 278,
          transform: Matrix4.translationValues(0, _hover ? -3 : 0, 0),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
          decoration: BoxDecoration(
            color: C.panel2,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: _hover ? game.accent : C.panelEdge, width: 2),
            boxShadow: _hover
                ? [BoxShadow(color: game.accent.withValues(alpha: 0.3), blurRadius: 18)]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                child: Center(child: CharacterView(spec: game.avatar, height: 130)),
              ),
              const SizedBox(height: 10),
              Text(game.tileLabel, style: T.logo(34, color: game.accent)),
              const SizedBox(height: 8),
              Text(game.subtitle,
                  style: const TextStyle(
                      color: C.cream, fontSize: 10.5, letterSpacing: 1.5, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Text(game.selectBlurb,
                  style: const TextStyle(color: C.txtDim, fontSize: 13, height: 1.4)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _Chip('PLAY', game.accent),
                  const Spacer(),
                  if (widget.best > 0)
                    Text('BEST ${widget.best}',
                        style: const TextStyle(
                            color: C.brass, fontFamily: kDisplayFont, fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------
// Feedback
// --------------------------------------------------------------------------
class FeedbackOverlay extends StatelessWidget {
  final GameController g;
  final VoidCallback onNext;
  const FeedbackOverlay(this.g, {super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final c = g.lastPick!;
    final s = g.s;
    final verdictColor = c.good ? C.good : C.bad;
    final lastOfEnc = g.lastRoundOfEncounter;
    final nextLabel = g.bottle <= 0
        ? s.seeDamage
        : (g.onBoss && lastOfEnc)
            ? s.claimZone
            : lastOfEnc
                ? s.walkOn
                : s.next;

    return _Scrim(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _big(c.verdict, verdictColor, size: 48),
          const SizedBox(height: 14),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: [
              _Chip('+${c.rep} ${s.repLabel}', C.brass),
              if (c.bottle > 0) _Chip('▲ ${s.meterLabel} +${c.bottle}', C.good),
              if (c.bottle < 0) _Chip('▼ ${s.meterLabel} ${c.bottle}', C.bad),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            constraints: const BoxConstraints(maxWidth: 540),
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            decoration: BoxDecoration(
              color: C.cream,
              borderRadius: BorderRadius.circular(12),
              border: const Border(left: BorderSide(color: C.brass, width: 6)),
            ),
            child: RichNote(c.note,
                base: const TextStyle(color: C.ink, fontSize: 14.5, height: 1.45),
                boldColor: C.postboxDark),
          ),
          const SizedBox(height: 20),
          ChunkyButton(label: nextLabel, onTap: onNext),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------------
// Title
// --------------------------------------------------------------------------
class TitleOverlay extends StatelessWidget {
  final GameController g;
  final void Function(int zone) onPlay;
  final VoidCallback onBack;
  const TitleOverlay(this.g, {super.key, required this.onPlay, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final game = g.game;
    final s = g.s;
    return _Scrim(
      opacity: 0.92,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BackChip(label: s.backLabel, onBack: onBack),
          const SizedBox(height: 12),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: T.logo(60, color: game.accent), children: [
              TextSpan(text: '${game.titleLine1}\n'),
              TextSpan(text: game.titleLine2),
            ]),
          ),
          const SizedBox(height: 10),
          Text(game.subtitle,
              style: const TextStyle(
                  color: C.cream, letterSpacing: 4, fontWeight: FontWeight.w700, fontSize: 13)),
          const SizedBox(height: 22),
          Container(
            constraints: const BoxConstraints(maxWidth: 470),
            child: Text(s.titleBody,
                textAlign: TextAlign.center,
                style: const TextStyle(color: C.txt, fontSize: 15, height: 1.5)),
          ),
          const SizedBox(height: 24),
          ChunkyButton(label: s.startRun, onTap: () => onPlay(0), fontSize: 24, color: game.accent, textColor: C.cream),
          if (g.zonesUnlocked > 1) ...[
            const SizedBox(height: 20),
            Text(s.jumpZone,
                style: const TextStyle(
                    color: C.txtDim, letterSpacing: 2, fontSize: 10, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 1; i < g.zonesUnlocked && i < g.zones.length; i++)
                  ChunkyButton(
                    label: g.zones[i].name,
                    onTap: () => onPlay(i),
                    color: C.panel,
                    textColor: C.cream,
                    fontSize: 14,
                  ),
              ],
            ),
          ],
          if (g.bestRep > 0) ...[
            const SizedBox(height: 20),
            Text('${s.bestLabel}: ${g.bestRep} ${s.repLabel}',
                style: const TextStyle(color: C.brass, fontFamily: kDisplayFont, fontSize: 18)),
          ],
        ],
      ),
    );
  }
}

/// A small "‹ GAMES" pill that returns to the Game Select screen. Used on the
/// title screen and pinned to the top-left during play.
class BackChip extends StatelessWidget {
  final String label;
  final VoidCallback onBack;
  const BackChip({super.key, required this.label, required this.onBack});
  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onBack,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0x800A080E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
            ),
            child: Text('‹  $label',
                style: const TextStyle(
                    color: C.cream, fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.w800)),
          ),
        ),
      );
}

// --------------------------------------------------------------------------
// Zone card
// --------------------------------------------------------------------------
class ZoneCardOverlay extends StatelessWidget {
  final GameController g;
  final VoidCallback onGo;
  const ZoneCardOverlay(this.g, {super.key, required this.onGo});

  @override
  Widget build(BuildContext context) {
    final z = g.zone;
    final s = g.s;
    return _Scrim(
      opacity: 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${s.zoneWord} ${g.zoneIndex + 1} ${s.ofWord} ${g.zones.length}',
              style: const TextStyle(
                  color: C.brass, letterSpacing: 4, fontWeight: FontWeight.w800, fontSize: 13)),
          const SizedBox(height: 12),
          _big(z.name, C.cream, size: 46),
          const SizedBox(height: 14),
          Container(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Text(z.tagline,
                textAlign: TextAlign.center,
                style: const TextStyle(color: C.txt, fontSize: 15, height: 1.5)),
          ),
          const SizedBox(height: 24),
          ChunkyButton(label: s.goOnThen, onTap: onGo, fontSize: 22, color: g.game.accent, textColor: C.cream),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------------
// Zone cleared
// --------------------------------------------------------------------------
class ZoneClearOverlay extends StatelessWidget {
  final GameController g;
  final VoidCallback onContinue;
  const ZoneClearOverlay(this.g, {super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final s = g.s;
    final last = g.zoneIndex >= g.zones.length - 1;
    return _Scrim(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _big(s.zoneCleared, C.good, size: 46),
          const SizedBox(height: 8),
          Text(g.zone.name,
              style: const TextStyle(
                  color: C.cream, fontFamily: kDisplayFont, fontSize: 22, letterSpacing: 1)),
          const SizedBox(height: 18),
          Wrap(alignment: WrapAlignment.center, spacing: 10, runSpacing: 10, children: [
            _Chip(s.zoneBonusChip, C.brass),
            _Chip(s.meterRefilledChip, C.good),
            _Chip(s.checkpointChip, C.cream),
          ]),
          const SizedBox(height: 22),
          ChunkyButton(
              label: last ? s.finalWord : s.onwards, onTap: onContinue, fontSize: 22),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------------
// Game over
// --------------------------------------------------------------------------
class GameOverOverlay extends StatelessWidget {
  final GameController g;
  final VoidCallback onRetry;
  final VoidCallback onQuit;
  const GameOverOverlay(this.g, {super.key, required this.onRetry, required this.onQuit});

  @override
  Widget build(BuildContext context) {
    final s = g.s;
    return _Scrim(
      opacity: 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _big(s.gameOverTitle, C.bad, size: 44),
          const SizedBox(height: 16),
          Text('${g.rep} ${s.repLabel}',
              style: const TextStyle(color: C.brass, fontFamily: kDisplayFont, fontSize: 30)),
          const SizedBox(height: 4),
          Text('${s.bestLabel}: ${g.bestRep}',
              style: const TextStyle(color: C.txtDim, fontSize: 12, letterSpacing: 2)),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              ChunkyButton(label: '${s.retakePrefix}${g.zone.name}', onTap: onRetry, fontSize: 16),
              ChunkyButton(
                  label: s.slinkOff, onTap: onQuit, color: C.panel2, textColor: C.cream, fontSize: 16),
            ],
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------------
// Win
// --------------------------------------------------------------------------
class WinOverlay extends StatelessWidget {
  final GameController g;
  final VoidCallback onDone;
  const WinOverlay(this.g, {super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    final s = g.s;
    return _Scrim(
      opacity: 0.92,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _big(s.winTitle, C.brass, size: 56),
          const SizedBox(height: 14),
          Container(
            constraints: const BoxConstraints(maxWidth: 470),
            child: Text(s.winBody,
                textAlign: TextAlign.center,
                style: const TextStyle(color: C.txt, fontSize: 15.5, height: 1.55)),
          ),
          const SizedBox(height: 20),
          Text('${g.rep} ${s.repLabel}',
              style: const TextStyle(color: C.brass, fontFamily: kDisplayFont, fontSize: 34)),
          const SizedBox(height: 24),
          ChunkyButton(label: s.winDone, onTap: onDone, fontSize: 20),
        ],
      ),
    );
  }
}
