import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'content/games.dart';
import 'content/models.dart';

enum Phase {
  gameSelect, // choose which game to play
  title, // the selected game's title screen
  zoneCard, // "Entering …" splash
  walking, // side-scroll transition to the next character
  dialogue, // stepping through lead-in lines
  choosing, // insult shown, comebacks live
  feedback, // verdict + teaching note
  zoneClear, // boss beaten, checkpoint
  gameOver,
  win,
}

class GameController extends ChangeNotifier {
  static const int maxBottle = 7;
  static const int _startBottle = 6;
  static const int _zoneBonus = 250;

  Phase phase = Phase.gameSelect;

  Game game = allGames.first; // current game (kept valid for backdrops)
  int zoneIndex = 0;
  int encIndex = 0; // 0..encounters.length ; == length means the boss
  int roundIndex = 0;
  int lineIndex = 0;

  int bottle = _startBottle;
  int rep = 0;
  Comeback? lastPick;

  final _rng = Random();
  /// The current round's comebacks in randomised display order, so the best
  /// answer isn't always in slot A.
  List<Comeback> choices = const [];

  final Map<String, int> _best = {};
  final Map<String, int> _unlocked = {};

  // ---- persistence (per game id) ----
  Future<void> load() async {
    try {
      final p = await SharedPreferences.getInstance();
      for (final g in allGames) {
        _best[g.id] = p.getInt('myl.${g.id}.best') ?? 0;
        _unlocked[g.id] = p.getInt('myl.${g.id}.unlocked') ?? 1;
      }
      notifyListeners();
    } catch (_) {/* private mode: defaults */}
  }

  Future<void> _save() async {
    try {
      final p = await SharedPreferences.getInstance();
      await p.setInt('myl.${game.id}.best', bestRep);
      await p.setInt('myl.${game.id}.unlocked', zonesUnlocked);
    } catch (_) {}
  }

  // ---- derived ----
  Strings get s => game.strings;
  List<Zone> get zones => game.zones;
  List<Game> get games => allGames;
  int get bestRep => _best[game.id] ?? 0;
  set bestRep(int v) => _best[game.id] = v;
  int get zonesUnlocked => _unlocked[game.id] ?? 1;
  set zonesUnlocked(int v) => _unlocked[game.id] = v;

  int bestForGame(Game g) => _best[g.id] ?? 0;

  Zone get zone => zones[zoneIndex];
  bool get onBoss => encIndex >= zone.encounters.length;
  Encounter get encounter => onBoss ? zone.boss : zone.encounters[encIndex];
  Round get round => encounter.rounds[roundIndex];
  bool get lastRoundOfEncounter => roundIndex >= encounter.rounds.length - 1;

  Line get currentLine => round.lead[lineIndex];

  String get encounterLabel => onBoss ? s.bossWord : '${s.encounterWord} ${encIndex + 1}';

  // ---- flow ----
  void selectGame(Game g) {
    game = g;
    phase = Phase.title;
    notifyListeners();
  }

  void toGameSelect() {
    phase = Phase.gameSelect;
    notifyListeners();
  }

  void startRun({int fromZone = 0}) => _startZone(fromZone);

  void _startZone(int i) {
    zoneIndex = i;
    encIndex = 0;
    roundIndex = 0;
    lineIndex = 0;
    bottle = _startBottle;
    phase = Phase.zoneCard;
    notifyListeners();
  }

  void beginZone() {
    phase = Phase.walking;
    notifyListeners();
  }

  void finishWalk() => _enterRound();

  void _enterRound() {
    lineIndex = 0;
    choices = List<Comeback>.of(round.comebacks)..shuffle(_rng);
    phase = round.lead.isEmpty ? Phase.choosing : Phase.dialogue;
    notifyListeners();
  }

  void nextLine() {
    if (phase != Phase.dialogue) return;
    if (lineIndex < round.lead.length - 1) {
      lineIndex++;
    } else {
      phase = Phase.choosing;
    }
    notifyListeners();
  }

  void choose(Comeback c) {
    if (phase != Phase.choosing) return;
    lastPick = c;
    rep = (rep + c.rep).clamp(0, 1 << 30);
    bottle = (bottle + c.bottle).clamp(0, maxBottle);
    if (rep > bestRep) {
      bestRep = rep;
      _save();
    }
    phase = Phase.feedback;
    notifyListeners();
  }

  void advance() {
    if (phase != Phase.feedback) return;

    if (bottle <= 0) {
      phase = Phase.gameOver;
      notifyListeners();
      return;
    }

    if (!lastRoundOfEncounter) {
      roundIndex++;
      _enterRound();
      return;
    }

    if (onBoss) {
      bottle = maxBottle;
      rep += _zoneBonus;
      if (rep > bestRep) bestRep = rep;
      if (zoneIndex + 2 > zonesUnlocked) {
        zonesUnlocked = (zoneIndex + 2).clamp(1, zones.length);
      }
      _save();
      phase = Phase.zoneClear;
      notifyListeners();
      return;
    }

    encIndex++;
    roundIndex = 0;
    lineIndex = 0;
    phase = Phase.walking;
    notifyListeners();
  }

  void afterZoneClear() {
    if (zoneIndex < zones.length - 1) {
      _startZone(zoneIndex + 1);
    } else {
      phase = Phase.win;
      notifyListeners();
    }
  }

  void retryFromCheckpoint() => _startZone(zoneIndex);
}
