import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../art/character.dart';
import '../theme.dart';

/// A cut-out collage character rendered from its spec.
class CharacterView extends StatelessWidget {
  final CharacterSpec spec;
  final double height;
  const CharacterView({super.key, required this.spec, required this.height});

  @override
  Widget build(BuildContext context) => SvgPicture.string(
        characterSvg(spec),
        height: height,
        fit: BoxFit.contain,
      );
}

/// A cut-out paper speech card: aged paper, ink border, hard offset shadow and
/// a slight wonk. [fromNpc] tints the speaker label + tilts the other way.
class SpeechBubble extends StatelessWidget {
  final String who;
  final String text;
  final bool fromNpc;
  const SpeechBubble({
    super.key,
    required this.who,
    required this.text,
    required this.fromNpc,
  });

  @override
  Widget build(BuildContext context) {
    final accent = fromNpc ? C.postbox : C.brassDark;
    return Transform.rotate(
      angle: fromNpc ? -0.012 : 0.012,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 470),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
        decoration: BoxDecoration(
          color: C.cream,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: C.ink, width: 2),
          boxShadow: const [C.cutShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(who,
                style: TextStyle(
                    fontFamily: kDisplayFont, fontFamilyFallback: kSerif,
                    fontSize: 15,
                    letterSpacing: 0.5,
                    color: accent)),
            const SizedBox(height: 3),
            Text(text, style: T.bubble),
          ],
        ),
      ),
    );
  }
}

/// A cut-out paper button with an ink edge and a hard drop-shadow that
/// "presses" down when tapped.
class ChunkyButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;
  final double fontSize;
  const ChunkyButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color = C.brass,
    this.textColor = C.ink,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return _Pressable(
      onTap: onTap,
      shadowColor: C.ink,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: C.ink, width: 2),
        ),
        child: Text(label,
            style: TextStyle(
                fontFamily: kDisplayFont, fontFamilyFallback: kSerif,
                fontSize: fontSize,
                letterSpacing: 0.5,
                color: textColor)),
      ),
    );
  }
}

class _Pressable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color shadowColor;
  const _Pressable({required this.child, required this.onTap, required this.shadowColor});

  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> {
  bool _down = false;
  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTapDown: enabled ? (_) => setState(() => _down = true) : null,
        onTapUp: enabled ? (_) => setState(() => _down = false) : null,
        onTapCancel: enabled ? () => setState(() => _down = false) : null,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 70),
          transform: Matrix4.translationValues(0, _down ? 4 : 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: widget.shadowColor.withValues(alpha: 0.35),
                  offset: Offset(3, _down ? 2 : 6),
                  blurRadius: 0),
            ],
          ),
          child: Opacity(opacity: enabled ? 1 : 0.5, child: widget.child),
        ),
      ),
    );
  }
}
