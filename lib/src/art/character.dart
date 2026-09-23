import 'package:flutter/painting.dart';

/// Characters rendered as Terry Gilliam-style cut-out paper collage: flat
/// shapes with hard ink edges, visible hinge-joint rivets and an offset paper
/// drop-shadow. Generated as SVG strings for flutter_svg. The [CharacterSpec]
/// knobs are unchanged, so every existing character just re-renders in collage.

enum Facing { left, right }

enum Expr { angry, shout, smug, neutral, snooty }

enum Hat { none, flatCap, beanie, bowler, sunhat }

enum Accessory { none, scarf, badge, pearls, backpack }

class CharacterSpec {
  final Color skin;
  final Color shirt;
  final Color shirtTrim;
  final Color trousers;
  final Color shoes;
  final Color? hair;
  final Hat hat;
  final Color hatColor;
  final Accessory accessory;
  final Color accentA;
  final Color accentB;
  final Expr expr;
  final Facing facing;
  final bool stocky;
  final bool foldedArms;

  const CharacterSpec({
    this.skin = const Color(0xFFEAB489),
    this.shirt = const Color(0xFF3C5A57),
    this.shirtTrim = const Color(0xFF34504D),
    this.trousers = const Color(0xFF2C3550),
    this.shoes = const Color(0xFFEDEDED),
    this.hair,
    this.hat = Hat.none,
    this.hatColor = const Color(0xFF333333),
    this.accessory = Accessory.none,
    this.accentA = const Color(0xFFB23A2A),
    this.accentB = const Color(0xFFF2E6C8),
    this.expr = Expr.neutral,
    this.facing = Facing.right,
    this.stocky = false,
    this.foldedArms = false,
  });

  CharacterSpec copyWith({Facing? facing, Expr? expr}) => CharacterSpec(
        skin: skin,
        shirt: shirt,
        shirtTrim: shirtTrim,
        trousers: trousers,
        shoes: shoes,
        hair: hair,
        hat: hat,
        hatColor: hatColor,
        accessory: accessory,
        accentA: accentA,
        accentB: accentB,
        expr: expr ?? this.expr,
        facing: facing ?? this.facing,
        stocky: stocky,
        foldedArms: foldedArms,
      );
}

String _hex(Color c) =>
    '#${(c.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';

const _inkEdge = ' stroke="#2A1E10" stroke-width="1.6" stroke-linejoin="round"';

/// Cut-out collage character in a 260x460 viewBox (feet near y=430). Oversized
/// head for that absurd Gilliam proportion.
String characterSvg(CharacterSpec s) {
  final b = StringBuffer();
  b.write('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 460">');

  // ground shadow (soft-ish, but flat like paper laid on paper)
  b.write('<ellipse cx="130" cy="436" rx="${s.stocky ? 96 : 82}" ry="14" '
      'fill="#241a0e" opacity="0.22"/>');

  // paper drop-shadow of the whole figure, offset like a cut-out lifted off the page
  b.write('<g transform="translate(5,6)" opacity="0.26">');
  b.write(_body(s, shadow: true));
  b.write('</g>');

  // the figure itself
  b.write(_body(s, shadow: false));
  b.write(_face(s));
  b.write(_rivets(s));

  b.write('</svg>');
  return b.toString();
}

String _body(CharacterSpec s, {required bool shadow}) {
  final f = s.facing == Facing.right ? 1 : -1;
  const cx = 130.0;
  final b = StringBuffer();

  String fill(Color c) => shadow ? 'fill="#1e1409"' : 'fill="${_hex(c)}"';
  final edge = shadow ? '' : _inkEdge;

  // legs
  b.write('<rect x="100" y="300" width="28" height="118" rx="6" ${fill(s.trousers)}$edge/>');
  b.write('<rect x="132" y="300" width="28" height="118" rx="6" ${fill(_dark(s.trousers, .08))}$edge/>');
  // shoes — clumpy cut-out boots, forward foot leads
  final leadX = cx + f * 22 - 27;
  final backX = cx - f * 6 - 27;
  b.write('<rect x="$backX" y="416" width="48" height="18" rx="6" ${fill(_dark(s.shoes, .06))}$edge/>');
  b.write('<rect x="$leadX" y="416" width="54" height="18" rx="6" ${fill(s.shoes)}$edge/>');

  // torso (cut rectangle-ish, slight taper)
  if (s.stocky) {
    b.write('<path d="M74 210 q0 -30 56 -30 q56 0 56 30 l4 86 q0 20 -20 20 '
        'l-80 0 q-20 0 -20 -20 z" ${fill(s.shirt)}$edge/>');
  } else {
    b.write('<path d="M88 214 q0 -28 42 -28 q42 0 42 28 l3 82 q0 18 -18 18 '
        'l-54 0 q-18 0 -18 -18 z" ${fill(s.shirt)}$edge/>');
  }
  // collar
  b.write('<path d="M${cx - (s.stocky ? 34 : 28)} 206 q${s.stocky ? 34 : 28} 22 ${s.stocky ? 68 : 56} 0 '
      'l-6 12 q${-(s.stocky ? 28 : 22)} 14 ${-(s.stocky ? 56 : 44)} 0 z" ${fill(s.shirtTrim)}$edge/>');

  // arms
  if (s.foldedArms) {
    b.write('<rect x="76" y="248" width="108" height="24" rx="10" ${fill(s.shirt)}$edge '
        'transform="rotate(-7 130 260)"/>');
    b.write('<rect x="76" y="266" width="108" height="24" rx="10" ${fill(s.shirtTrim)}$edge '
        'transform="rotate(6 130 278)"/>');
    b.write('<circle cx="172" cy="256" r="12" ${fill(_dark(s.skin, .06))}$edge/>');
    b.write('<circle cx="88" cy="284" r="12" ${fill(_dark(s.skin, .06))}$edge/>');
  } else {
    b.write('<rect x="${s.stocky ? 64 : 78}" y="222" width="22" height="76" rx="10" ${fill(s.shirt)}$edge/>');
    b.write('<rect x="${s.stocky ? 174 : 160}" y="222" width="22" height="76" rx="10" ${fill(s.shirtTrim)}$edge/>');
    // paper hands
    b.write('<circle cx="${s.stocky ? 75 : 89}" cy="300" r="10" ${fill(_dark(s.skin, .05))}$edge/>');
    b.write('<circle cx="${s.stocky ? 185 : 171}" cy="300" r="10" ${fill(_dark(s.skin, .05))}$edge/>');
  }

  // torso accessories
  if (s.accessory == Accessory.badge) {
    b.write('<rect x="98" y="228" width="24" height="24" rx="2" ${fill(const Color(0xFFF2E6C8))}$edge/>');
    if (!shadow) {
      b.write('<rect x="108" y="230" width="4" height="20" fill="${_hex(s.accentA)}"/>');
      b.write('<rect x="100" y="238" width="20" height="4" fill="${_hex(s.accentA)}"/>');
    }
  }
  if (s.accessory == Accessory.backpack) {
    b.write('<rect x="120" y="196" width="12" height="112" rx="4" ${fill(s.accentA)}$edge '
        'transform="rotate(6 126 250)"/>');
  }

  // head (oversized)
  const hy = 148.0;
  b.write('<circle cx="$cx" cy="$hy" r="47" ${fill(s.skin)}$edge/>');
  // ear
  b.write('<circle cx="${cx - f * 44}" cy="${hy + 6}" r="8" ${fill(_dark(s.skin, .06))}$edge/>');

  // hair
  if (s.hair != null) {
    b.write('<path d="M${cx - 46} ${hy - 6} Q${cx - 42} ${hy - 44} $cx ${hy - 48} '
        'Q${cx + 42} ${hy - 44} ${cx + 46} ${hy - 6} '
        'Q${cx + 20} ${hy - 24} $cx ${hy - 24} '
        'Q${cx - 20} ${hy - 24} ${cx - 46} ${hy - 6} Z" ${fill(s.hair!)}$edge/>');
  }

  // neck scarf / pearls sit under the face
  if (s.accessory == Accessory.scarf) {
    b.write('<rect x="${cx - 46}" y="188" width="92" height="16" rx="6" ${fill(s.accentA)}$edge/>');
    b.write('<rect x="${cx + f * 22}" y="196" width="16" height="48" rx="4" ${fill(s.accentA)}$edge/>');
    if (!shadow) {
      b.write('<rect x="${cx - 46}" y="192" width="92" height="4" fill="${_hex(s.accentB)}"/>');
    }
  }
  if (s.accessory == Accessory.pearls && !shadow) {
    for (var i = -3; i <= 3; i++) {
      b.write('<circle cx="${cx + i * 10.0}" cy="${196 + i.abs() * 2}" r="4" '
          'fill="${_hex(s.accentA)}" stroke="#2A1E10" stroke-width="0.8"/>');
    }
  }

  b.write(_hat(s, cx, hy, f, shadow));
  return b.toString();
}

String _hat(CharacterSpec s, double cx, double hy, int f, bool shadow) {
  final b = StringBuffer();
  final edge = shadow ? '' : _inkEdge;
  String fill(Color c) => shadow ? 'fill="#1e1409"' : 'fill="${_hex(c)}"';
  switch (s.hat) {
    case Hat.none:
      break;
    case Hat.flatCap:
      b.write('<ellipse cx="$cx" cy="${hy - 36}" rx="56" ry="20" ${fill(s.hatColor)}$edge/>');
      b.write('<path d="M${cx + f * 46} ${hy - 28} q${f * 32} 0 ${f * 42} 12 '
          'q${-f * 14} 8 ${-f * 42} 4 z" ${fill(_dark(s.hatColor, .12))}$edge/>');
    case Hat.beanie:
      b.write('<path d="M${cx - 48} ${hy - 26} a48 42 0 0 1 96 0 z" ${fill(s.hatColor)}$edge/>');
      b.write('<rect x="${cx - 48}" y="${hy - 32}" width="96" height="13" rx="5" ${fill(_light(s.hatColor, .1))}$edge/>');
    case Hat.bowler:
      b.write('<ellipse cx="$cx" cy="${hy - 28}" rx="54" ry="11" ${fill(s.hatColor)}$edge/>');
      b.write('<path d="M${cx - 36} ${hy - 26} a36 36 0 0 1 72 0 z" ${fill(s.hatColor)}$edge/>');
    case Hat.sunhat:
      b.write('<ellipse cx="$cx" cy="${hy - 24}" rx="66" ry="16" ${fill(s.hatColor)}$edge/>');
      b.write('<path d="M${cx - 38} ${hy - 24} a38 36 0 0 1 76 0 z" ${fill(s.hatColor)}$edge/>');
      if (!shadow) {
        b.write('<ellipse cx="$cx" cy="${hy - 30}" rx="38" ry="8" fill="${_hex(s.accentA)}"/>');
      }
  }
  return b.toString();
}

/// Hinge-joint rivets — the giveaway of a Gilliam cut-out figure.
String _rivets(CharacterSpec s) {
  const cx = 130.0;
  const r = 'r="3.4" fill="#C9A24A" stroke="#2A1E10" stroke-width="1"';
  final b = StringBuffer();
  b.write('<circle cx="${cx - (s.stocky ? 52 : 42)}" cy="218" $r/>');
  b.write('<circle cx="${cx + (s.stocky ? 52 : 42)}" cy="218" $r/>');
  b.write('<circle cx="112" cy="302" $r/>');
  b.write('<circle cx="148" cy="302" $r/>');
  return b.toString();
}

String _face(CharacterSpec s) {
  const cx = 130.0;
  const hy = 148.0;
  final f = s.facing == Facing.right ? 1 : -1;
  final b = StringBuffer();
  final ex = cx + f * 6;
  const ink = '#2A1E10';

  if (s.expr == Expr.snooty) {
    b.write('<path d="M${ex - 15} ${hy - 4} l15 0" stroke="$ink" stroke-width="3" stroke-linecap="round"/>');
    b.write('<path d="M${ex + 4} ${hy - 4} l15 0" stroke="$ink" stroke-width="3" stroke-linecap="round"/>');
  } else {
    b.write('<circle cx="${ex - 10}" cy="${hy - 2}" r="4.8" fill="$ink"/>');
    b.write('<circle cx="${ex + 10}" cy="${hy - 2}" r="4.8" fill="$ink"/>');
  }

  switch (s.expr) {
    case Expr.angry:
    case Expr.shout:
      b.write('<path d="M${ex - 20} ${hy - 17} l19 8" stroke="$ink" stroke-width="5" stroke-linecap="round"/>');
      b.write('<path d="M${ex + 20} ${hy - 17} l-19 8" stroke="$ink" stroke-width="5" stroke-linecap="round"/>');
    case Expr.smug:
      b.write('<path d="M${ex - 20} ${hy - 15} q10 -6 19 -1" stroke="$ink" stroke-width="3.5" fill="none" stroke-linecap="round"/>');
      b.write('<path d="M${ex + 4} ${hy - 17} q10 -4 17 2" stroke="$ink" stroke-width="3.5" fill="none" stroke-linecap="round"/>');
    case Expr.snooty:
      b.write('<path d="M${ex - 20} ${hy - 17} q10 -7 19 -3" stroke="$ink" stroke-width="3" fill="none" stroke-linecap="round"/>');
      b.write('<path d="M${ex + 2} ${hy - 19} q10 -4 19 1" stroke="$ink" stroke-width="3" fill="none" stroke-linecap="round"/>');
    case Expr.neutral:
      b.write('<path d="M${ex - 18} ${hy - 14} l15 -1" stroke="$ink" stroke-width="3.5" stroke-linecap="round"/>');
      b.write('<path d="M${ex + 3} ${hy - 15} l15 1" stroke="$ink" stroke-width="3.5" stroke-linecap="round"/>');
  }

  switch (s.expr) {
    case Expr.shout:
      b.write('<ellipse cx="$ex" cy="${hy + 28}" rx="17" ry="12" fill="#7A2E2E" stroke="$ink" stroke-width="1.5"/>');
      b.write('<path d="M${ex - 13} ${hy + 23} h26" stroke="#F2E6C8" stroke-width="3"/>');
    case Expr.angry:
      b.write('<path d="M${ex - 14} ${hy + 32} q14 -10 28 0" stroke="#7A2E2E" stroke-width="4" fill="none" stroke-linecap="round"/>');
    case Expr.smug:
      b.write('<path d="M${ex - 13} ${hy + 26} q15 11 26 -2" stroke="#7a3a20" stroke-width="3.6" fill="none" stroke-linecap="round"/>');
    case Expr.snooty:
      b.write('<path d="M${ex - 9} ${hy + 28} q9 -4 18 0" stroke="#7a3a20" stroke-width="3.4" fill="none" stroke-linecap="round"/>');
    case Expr.neutral:
      b.write('<path d="M${ex - 11} ${hy + 27} q11 6 22 0" stroke="#7a3a20" stroke-width="3.4" fill="none" stroke-linecap="round"/>');
  }
  return b.toString();
}

Color _dark(Color c, double amt) => Color.lerp(c, const Color(0xFF000000), amt)!;
Color _light(Color c, double amt) => Color.lerp(c, const Color(0xFFFFFFFF), amt)!;
