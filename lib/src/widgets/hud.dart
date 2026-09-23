import 'package:flutter/material.dart';

import '../game_controller.dart';
import '../theme.dart';

String _commas(int n) {
  final s = n.toString();
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write(',');
    b.write(s[i]);
  }
  return b.toString();
}

class Hud extends StatelessWidget {
  final GameController g;
  const Hud(this.g, {super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        // Extra left inset leaves room for the pinned Back button.
        padding: const EdgeInsets.fromLTRB(120, 14, 16, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _logo(),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: _commas(g.rep),
                          style: const TextStyle(
                              fontFamily: kDisplayFont, fontSize: 26, color: C.brass)),
                      TextSpan(
                          text: '  ${g.s.repLabel}',
                          style: const TextStyle(
                              fontSize: 11,
                              letterSpacing: 2,
                              color: C.txtDim,
                              fontWeight: FontWeight.w700)),
                    ])),
                    const SizedBox(height: 8),
                    _bottle(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() => RichText(
        text: TextSpan(
          style: T.logo(30, color: g.game.accent),
          children: [
            TextSpan(text: '${g.game.titleLine1}\n'),
            TextSpan(text: g.game.titleLine2),
          ],
        ),
      );

  Widget _bottle() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(g.s.meterLabel,
              style: const TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: C.cream,
                  fontWeight: FontWeight.w800)),
          const SizedBox(width: 7),
          for (var i = 0; i < GameController.maxBottle; i++)
            Container(
              width: 16,
              height: 11,
              margin: const EdgeInsets.only(left: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: C.ink, width: 1),
                gradient: i < g.bottle
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFC9583A), C.postbox])
                    : null,
                color: i < g.bottle ? null : const Color(0xFF4A3A24),
              ),
            ),
        ],
      );
}

/// The small location chip that names the current zone + encounter.
class LocationChip extends StatelessWidget {
  final String text;
  const LocationChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0x800A080E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Text(text,
          style: const TextStyle(
              fontSize: 10,
              letterSpacing: 2.5,
              color: C.cream,
              fontWeight: FontWeight.w800)),
    );
  }
}
