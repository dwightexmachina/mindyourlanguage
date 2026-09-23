import 'package:flutter/material.dart';

/// The game's committed visual world: a Terry Gilliam / Monty Python cut-out
/// paper collage — aged parchment, sepia ink, burgundy + antique gold, hard
/// offset drop-shadows and a wonky engraved display face.
abstract class C {
  // (sky/pavement kept for API compatibility; backdrops define their own.)
  static const skyTop = Color(0xFFB7CBD6);
  static const skyBot = Color(0xFFE8DCC0);
  static const pavement = Color(0xFF7D5A34);

  static const postbox = Color(0xFFB23A2A); // burgundy accent
  static const postboxDark = Color(0xFF8A2A20);
  static const brass = Color(0xFFC9A24A); // antique gold
  static const brassDark = Color(0xFF9A7A32);

  static const cream = Color(0xFFF2E6C8); // aged paper
  static const creamEdge = Color(0xFFD9C39A);
  static const ink = Color(0xFF2A1E10);

  static const panel = Color(0xFF271B0F); // dark aged-paper chrome
  static const panel2 = Color(0xFF33240F);
  static const panelEdge = Color(0xFF6E5A32);
  static const choiceBg = Color(0xFFEFE2C2); // parchment card
  static const choiceHover = Color(0xFFE6D3A8);

  static const txt = Color(0xFFF2E6C8); // light parchment text on dark chrome
  static const txtDim = Color(0xFFC2AE86);

  static const good = Color(0xFF6E8A3A); // muted olive
  static const goodDark = Color(0xFF4E6528);
  static const bad = Color(0xFFB23A2A);

  /// Hard, offset "cut-out paper" shadow used throughout the collage chrome.
  static const cutShadow = BoxShadow(color: Color(0x40000000), offset: Offset(4, 5), blurRadius: 0);
}

const String kDisplayFont = 'Fredericka';
const List<String> kSerif = ['Georgia', 'Times New Roman', 'serif'];

abstract class T {
  static const display = TextStyle(
    fontFamily: kDisplayFont,
    fontFamilyFallback: kSerif,
    color: C.cream,
    letterSpacing: 0.5,
    height: 1.0,
  );

  static TextStyle logo(double size, {Color color = C.postbox}) => TextStyle(
        fontFamily: kDisplayFont,
        fontFamilyFallback: kSerif,
        fontSize: size,
        height: 1.0,
        color: color,
        letterSpacing: 0.5,
        shadows: [
          Shadow(color: Color.lerp(color, C.ink, 0.5)!, offset: const Offset(3, 4)),
        ],
      );

  static const body = TextStyle(
    fontFamilyFallback: kSerif,
    fontFamily: 'Georgia',
    color: C.txt,
    fontSize: 15,
    height: 1.38,
  );

  static const bubble = TextStyle(
    fontFamily: 'Georgia',
    fontFamilyFallback: kSerif,
    color: C.ink,
    fontSize: 16,
    height: 1.34,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
  );

  static const caption = TextStyle(
    fontFamily: 'Georgia',
    fontFamilyFallback: kSerif,
    color: C.txtDim,
    fontSize: 12,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w700,
  );
}
