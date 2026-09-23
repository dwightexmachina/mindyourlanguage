import 'package:flutter/painting.dart';

import '../art/character.dart';

/// Which backdrop a zone uses.
enum SceneKey {
  // British game
  highStreet, pub, footy, dinner,
  // Spanish game (one region per zone)
  plaza, cantina, parrilla, feria,
  // German game (one region per zone)
  berlin, biergarten, ruhrpott, hafen,
}

/// All the UI text for one game, so each game can carry its own language.
class Strings {
  final String howRespond;
  final String respondSub;
  final String tapContinue;
  final String notFinished;
  final String startRun;
  final String bestLabel;
  final String repLabel; // score unit, e.g. REP / FAMA
  final String meterLabel; // confidence meter, e.g. BOTTLE / AGALLAS
  final String jumpZone;
  final String zoneWord; // ZONE / ZONA
  final String ofWord; // OF / DE
  final String bossWord; // BOSS / JEFE FINAL
  final String encounterWord; // ENCOUNTER / RONDA
  final String goOnThen; // zone-card button
  final String next;
  final String walkOn;
  final String claimZone;
  final String seeDamage;
  final String zoneCleared;
  final String zoneBonusChip;
  final String meterRefilledChip;
  final String checkpointChip;
  final String onwards;
  final String finalWord;
  final String gameOverTitle;
  final String retakePrefix; // e.g. "RETAKE " / "REPETIR "
  final String slinkOff;
  final String winTitle;
  final String winBody;
  final String winDone;
  final String titleBody;
  final String backLabel; // e.g. GAMES / JUEGOS

  const Strings({
    required this.howRespond,
    required this.respondSub,
    required this.tapContinue,
    required this.notFinished,
    required this.startRun,
    required this.bestLabel,
    required this.repLabel,
    required this.meterLabel,
    required this.jumpZone,
    required this.zoneWord,
    required this.ofWord,
    required this.bossWord,
    required this.encounterWord,
    required this.goOnThen,
    required this.next,
    required this.walkOn,
    required this.claimZone,
    required this.seeDamage,
    required this.zoneCleared,
    required this.zoneBonusChip,
    required this.meterRefilledChip,
    required this.checkpointChip,
    required this.onwards,
    required this.finalWord,
    required this.gameOverTitle,
    required this.retakePrefix,
    required this.slinkOff,
    required this.winTitle,
    required this.winBody,
    required this.winDone,
    required this.titleBody,
    required this.backLabel,
  });
}

/// A whole game: its branding, player avatar, zones, and language bundle.
class Game {
  final String id;
  final String titleLine1;
  final String titleLine2;
  final String tileLabel; // shown on the Game Select card (e.g. "English")
  final String subtitle;
  final String selectBlurb; // one-liner on the game-select card
  final Color accent; // logo / branding colour
  final CharacterSpec avatar; // shown on the game-select card
  final CharacterSpec player; // the character you play
  final List<Zone> zones;
  final Strings strings;

  const Game({
    required this.id,
    required this.titleLine1,
    required this.titleLine2,
    required this.tileLabel,
    required this.subtitle,
    required this.selectBlurb,
    required this.accent,
    required this.avatar,
    required this.player,
    required this.zones,
    required this.strings,
  });
}

/// Who is speaking a line of dialogue.
enum Speaker { player, npc }

/// A single line of "voice" dialogue (text-based for now).
class Line {
  final Speaker who;
  final String text;
  const Line(this.who, this.text);

  const Line.npc(this.text) : who = Speaker.npc;
  const Line.you(this.text) : who = Speaker.player;
}

/// How good a comeback is. Exactly one [best] per round; the rest are foils.
enum Quality { best, decent, weak, grovel }

/// One selectable response to an insult.
class Comeback {
  final String text;
  final Quality quality;
  final int rep;
  final int bottle; // delta applied to the confidence meter
  final String verdict; // e.g. "BELTER!"
  final bool good; // colours the verdict + feedback tone
  final String note; // the teaching line (supports simple <b>/<i> markup)

  const Comeback({
    required this.text,
    required this.quality,
    required this.rep,
    required this.bottle,
    required this.verdict,
    required this.good,
    required this.note,
  });
}

/// One exchange: some lead-in dialogue, the insult you must answer, and the
/// menu of comebacks. Regular encounters have a single round; bosses chain
/// several.
class Round {
  final List<Line> lead; // dialogue shown before the choices
  final String insult; // the line sitting in the NPC speech bubble at choice time
  final List<Comeback> comebacks;

  const Round({
    this.lead = const [],
    required this.insult,
    required this.comebacks,
  });
}

/// A face-off with one character. `boss` rounds are just longer.
class Encounter {
  final String npcName;
  final CharacterSpec npc;
  final List<Round> rounds;
  final bool isBoss;

  const Encounter({
    required this.npcName,
    required this.npc,
    required this.rounds,
    this.isBoss = false,
  });
}

/// A themed area: a handful of encounters ending in a boss.
class Zone {
  final String id;
  final String name; // "THE HIGH STREET"
  final String tagline; // shown on the zone card
  final SceneKey scene;
  final List<Encounter> encounters; // regulars, in order
  final Encounter boss;

  const Zone({
    required this.id,
    required this.name,
    required this.tagline,
    required this.scene,
    required this.encounters,
    required this.boss,
  });
}
