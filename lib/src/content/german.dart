import 'package:flutter/painting.dart';

import '../art/character.dart';
import 'models.dart';

// ---------------------------------------------------------------------------
// The German game: one German region per zone. Teaching notes stay in German,
// glossing the key slang term in English. Display-font strings (verdicts, NPC
// names, zone names, buttons, logo) are kept umlaut-free; body text renders in
// Georgia, which carries ä ö ü ß fine.
// ---------------------------------------------------------------------------

const germanStrings = Strings(
  howRespond: 'WIE KONTERST DU?',
  respondSub: 'Bring den besten Spruch. Wer kuscht, verliert Mumm.',
  tapContinue: '» weiter tippen',
  notFinished: 'Noch nicht fertig. Tipp auf die Szene, um zuzuhören.',
  startRun: 'LOSLEGEN',
  bestLabel: 'BESTE',
  repLabel: 'RUF',
  meterLabel: 'MUMM',
  jumpZone: 'ZUR GESCHAFFTEN ZONE',
  zoneWord: 'ZONE',
  ofWord: 'VON',
  bossWord: 'BOSS',
  encounterWord: 'RUNDE',
  goOnThen: 'NA KOMM!',
  next: 'WEITER',
  walkOn: 'WEITERGEHEN',
  claimZone: 'ZONE HOLEN',
  seeDamage: 'DEN SCHADEN ANSEHEN',
  zoneCleared: 'ZONE GESCHAFFT',
  zoneBonusChip: '+250 RUF',
  meterRefilledChip: '▲ MUMM VOLL',
  checkpointChip: 'GESPEICHERT',
  onwards: 'WEITER SO',
  finalWord: 'DAS LETZTE WORT',
  gameOverTitle: 'DU HAST\nGEKUSCHT',
  retakePrefix: 'NOCHMAL: ',
  slinkOff: 'ABHAUEN',
  winTitle: 'SCHLAG-\nFERTIG',
  winBody:
      'Von Berlin bis Hamburg hast du keinen einzigen Spruch geschluckt. Keine '
      'Schnauze im Land bringt dich mehr aus der Ruhe. Geh raus und zeig der Welt, '
      'wo der Hammer hängt.',
  winDone: 'ZU DEN SPIELEN',
  titleBody:
      'Irgendeiner will immer Stress. Lies den Spruch, wähl den besten Konter '
      'und lass dir nicht den Mumm nehmen. Wer kuscht, verliert ihn.',
  backLabel: 'SPIELE',
);

// ---------------------------------------------------------------------------
// Characters
// ---------------------------------------------------------------------------

const germanPlayer = CharacterSpec(
  shirt: Color(0xFF4A4A52),
  shirtTrim: Color(0xFF3A3A42),
  trousers: Color(0xFF2C3550),
  hair: Color(0xFF2E2A27),
  accessory: Accessory.backpack,
  accentA: Color(0xFFC99A2E),
  expr: Expr.smug,
  facing: Facing.right,
);

// -- Berlin --
const _rausschmeisser = CharacterSpec(
  skin: Color(0xFFE0AF82),
  shirt: Color(0xFF1E1E22),
  shirtTrim: Color(0xFF141418),
  trousers: Color(0xFF1A1A1E),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);
const _radfahrer = CharacterSpec(
  skin: Color(0xFFEAB489),
  shirt: Color(0xFFC8E040),
  shirtTrim: Color(0xFFA6C230),
  trousers: Color(0xFF2A2A32),
  hat: Hat.beanie,
  hatColor: Color(0xFF2A2A2A),
  accentA: Color(0xFFC8E040),
  expr: Expr.shout,
  facing: Facing.left,
);
const _schnauze = CharacterSpec(
  skin: Color(0xFFE0AF82),
  shirt: Color(0xFF5A6470),
  shirtTrim: Color(0xFF454E58),
  trousers: Color(0xFF2E323A),
  hair: Color(0xFF6A6A6A),
  hat: Hat.flatCap,
  hatColor: Color(0xFF4A4A4A),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

// -- Bayern --
const _opa = CharacterSpec(
  skin: Color(0xFFE8B48A),
  shirt: Color(0xFF8A5A3A),
  shirtTrim: Color(0xFF6E482C),
  trousers: Color(0xFF3A3A42),
  hair: Color(0xFFC9C0B0),
  hat: Hat.flatCap,
  hatColor: Color(0xFF3E5A34),
  expr: Expr.smug,
  facing: Facing.left,
  stocky: true,
);
const _kellnerin = CharacterSpec(
  skin: Color(0xFFF0C6A0),
  shirt: Color(0xFFF2F2F2),
  shirtTrim: Color(0xFF4A2A2A),
  trousers: Color(0xFF5A2E38),
  hair: Color(0xFFE8CE7A),
  expr: Expr.smug,
  facing: Facing.left,
);
const _bayer = CharacterSpec(
  skin: Color(0xFFE8A57C),
  shirt: Color(0xFFF2F2F2),
  shirtTrim: Color(0xFF3E5A34),
  trousers: Color(0xFF3A2A1A),
  hat: Hat.flatCap,
  hatColor: Color(0xFF3E5A34),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

// -- Ruhrpott --
const _bude = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFF7A4A2A),
  shirtTrim: Color(0xFF5E3820),
  trousers: Color(0xFF3A3A42),
  hair: Color(0xFF241F1C),
  expr: Expr.smug,
  facing: Facing.left,
);
const _fan = CharacterSpec(
  skin: Color(0xFFEAB489),
  shirt: Color(0xFFF2C14E),
  shirtTrim: Color(0xFFD6A32E),
  trousers: Color(0xFF1A1A1A),
  hat: Hat.beanie,
  hatColor: Color(0xFF1A1A1A),
  accessory: Accessory.scarf,
  accentA: Color(0xFFF2C14E),
  accentB: Color(0xFF1A1A1A),
  expr: Expr.shout,
  facing: Facing.left,
);
const _kumpel = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFF5A5A55),
  shirtTrim: Color(0xFF464642),
  trousers: Color(0xFF2E2E30),
  hat: Hat.beanie,
  hatColor: Color(0xFF3A3A3A),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

// -- Hamburg --
const _fischkopp = CharacterSpec(
  skin: Color(0xFFE8A57C),
  shirt: Color(0xFF2E6E9B),
  shirtTrim: Color(0xFF215479),
  trousers: Color(0xFF2A2A32),
  hat: Hat.flatCap,
  hatColor: Color(0xFF1E3A4A),
  expr: Expr.shout,
  facing: Facing.left,
);
const _hanseatin = CharacterSpec(
  skin: Color(0xFFF0C6A0),
  shirt: Color(0xFF2A3A5A),
  shirtTrim: Color(0xFF1E2C46),
  trousers: Color(0xFF20202A),
  hair: Color(0xFFCFC8B8),
  accessory: Accessory.pearls,
  accentA: Color(0xFFF2E6C8),
  expr: Expr.snooty,
  facing: Facing.left,
);
const _hafenarbeiter = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFF3A4A3A),
  shirtTrim: Color(0xFF2C382C),
  trousers: Color(0xFF262A26),
  hat: Hat.beanie,
  hatColor: Color(0xFF2A3A2A),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

// ---------------------------------------------------------------------------
// Comeback shorthands (verdicts kept umlaut-free — they render in Fredericka)
// ---------------------------------------------------------------------------

Comeback _gbest(String text, String verdict, String note, {int rep = 120, int bottle = 1}) =>
    Comeback(text: text, quality: Quality.best, rep: rep, bottle: bottle, verdict: verdict, good: true, note: note);
Comeback _gdec(String text, String note, {int rep = 25, int bottle = 0}) =>
    Comeback(text: text, quality: Quality.decent, rep: rep, bottle: bottle, verdict: 'NAJA.', good: false, note: note);
Comeback _gweak(String text, String note, {int rep = 10, int bottle = -1}) =>
    Comeback(text: text, quality: Quality.weak, rep: rep, bottle: bottle, verdict: 'SCHWACH.', good: false, note: note);
Comeback _ggro(String text, String note, {int bottle = -2}) =>
    Comeback(text: text, quality: Quality.grovel, rep: 0, bottle: bottle, verdict: 'GEKUSCHT.', good: false, note: note);

// ---------------------------------------------------------------------------
// Zones
// ---------------------------------------------------------------------------

final List<Zone> _germanZones = [
  // ============================ BERLIN ============================
  Zone(
    id: 'berlin',
    name: 'BERLIN',
    tagline: 'U-Bahnhof, Späti, Türsteher. Hier hat jeder eine große Klappe.',
    scene: SceneKey.berlin,
    encounters: [
      Encounter(
        npcName: 'DER RAUSSCHMEISSER',
        npc: _rausschmeisser,
        rounds: [
          Round(
            lead: [
              Line.npc('Ey. Wo willst du hin?'),
              Line.you('Rein, wie alle anderen.'),
            ],
            insult: 'Nee. Nicht mit den Schuhen und nicht mit der Visage. Kommst hier nich rein, Alter. Zu hässlich für die Gästeliste.',
            comebacks: [
              _gbest(
                'Deine Gästeliste? Digga, hier steht seit einer Stunde keiner an. Du bewachst eine leere Bude und tust wichtig. Viel Spaß dabei.',
                'SITZT!',
                'Du entlarvst seine Machtpose: Er bewacht nichts. (Alter/Digga = mate/dude; Bude = joint/place.) Nie über dein Aussehen diskutieren — dreh es um.',
              ),
              _gdec('Ist eh nicht mein Laden.',
                  'Okay, aber du weichst nur aus. Ein guter Konter geht gegen IHN. (Konter = comeback.)'),
              _gweak('Selber hässlich.',
                  'Das Selber-Ding vom Schulhof. Er hat vorgelegt, du hast kopiert. Leg du vor.'),
              _ggro('Sorry, ich geh ja schon.',
                  'Beim ersten Spruch abhauen? Genau darauf steht so einer. Mumm futsch. (Mumm = nerve/guts.)'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'DER RADFAHRER',
        npc: _radfahrer,
        rounds: [
          Round(
            lead: [
              Line.npc('*klingelt wie irre* BÜRGERSTEIG! Bist du bescheuert?!'),
              Line.you('Das ist ein Gehweg, Kumpel.'),
            ],
            insult: 'Gehweg, Gehweg. Vollpfosten. Geh doch aufs Feld, wenn du nicht laufen kannst!',
            comebacks: [
              _gbest(
                'Du fährst 40 auf dem Gehweg und ICH bin das Problem? Setz den Helm mal richtig auf, da ist wohl Luft rausgekommen.',
                'STARK!',
                'Du drehst die Schuld um und triffst sein Ego (den Helm). (bescheuert = daft/nuts; Vollpfosten = complete idiot.)',
              ),
              _gdec('Fahr einfach weiter, Mann.',
                  'Deeskalation ist okay, aber lasch. Die Straße gehört auch dir — kontere mit Biss.'),
              _gweak('Vollpfosten bist du!',
                  'Selber-Konter, wieder. Kein Biss dahinter.'),
              _ggro('Oh, tut mir leid, ich pass auf!',
                  'Sich beim wildesten Klingler entschuldigen. Mumm futsch.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'DIE BERLINER SCHNAUZE',
      npc: _schnauze,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*mustert dich* Na, wat willste?')],
          insult: 'Kiekste so? Haste noch nie einen echten Berliner gesehn, wa? Touri.',
          comebacks: [
            _gbest(
              'Echter Berliner? Alter, dein Späti gehört einem Schwaben, deine Miete zahlt einer aus München, und Berliner nennt ihr hier nicht mal die Pfannkuchen. Setz dich.',
              'PENG!',
              'Du kennst die Stadt besser als der Angeber, samt Pfannkuchen-Gag. (wa/kieken = Berlin: right?/to look.) Nie die Provokation schlucken — beschreib sie.',
              rep: 150, bottle: 1,
            ),
            _gdec('Ja, seh ich gerade. Beeindruckend.',
                'Der Ironie-Ton geht, aber allgemein. Häng es an IHN, dann sitzt es doppelt.', rep: 35),
            _gweak('Ich bin doch gar kein Tourist.',
                'Sich rechtfertigen zeigt, dass es gesessen hat. Nie zeigen.', bottle: -2),
            _ggro('Sorry, wollte nicht stören.',
                'Vor der Berliner Schnauze einknicken ist genau die Vorlage. Mumm weg.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('Oho, der hat eine Klappe!')],
          insult: 'Und nu? Wat willste jetzt machen, wa?',
          comebacks: [
            _gbest(
              'Nüscht, Alter. Ich trink meine Club-Mate und genieß die Sonne. Du brauchst Stress, um dich lebendig zu fühlen — ich nicht. Dit is der Unterschied.',
              'DAS LETZTE WORT!',
              'Du koppelst deine Laune von seinem Zoff ab — das kann ein Krawallo nicht kontern. Ruhe ist der beste Spruch. (dit/nüscht = Berlin: that/nothing.)',
              rep: 200, bottle: 2,
            ),
            _gdec('Nix. Weitermachen, wie es aussieht.',
                'Die Ruhe stimmt, aber flach. Zeig ihm, dass ER den Stress braucht.', rep: 40),
            _gweak('Oh, wie gruselig.',
                'Billiger Sarkasmus kauft ihm die Drohung noch ab. Nimm ihm den Zoff ganz weg.', bottle: -1),
            _ggro('Schon gut, du gewinnst.',
                'Du gewinnst ist Blut im Wasser. Mumm weg.', bottle: -2),
          ],
        ),
      ],
    ),
  ),

  // ============================ BAYERN ============================
  Zone(
    id: 'bayern',
    name: 'BAYERN',
    tagline: 'Biergarten am Nachmittag. Ohne Tracht und Grüß Gott bist du verdächtig.',
    scene: SceneKey.biergarten,
    encounters: [
      Encounter(
        npcName: 'DER STAMMTISCH-OPA',
        npc: _opa,
        rounds: [
          Round(
            lead: [
              Line.npc('*dreht sich um* Ja mei, wer bist denn du?'),
              Line.you('Ich wollt mich nur kurz setzen.'),
            ],
            insult: 'An MEIN Stammtisch? Des is DER Stammtisch, Bua. Du bist a Zugroaster, des sieht a Blinder. Such da wo anders an Platz.',
            comebacks: [
              _gbest(
                'Zugroaster, freilich. Und trotzdem zahl ich fürs Bier genauso viel wie Sie, nur ohne den Stammplatz-Zirkus. Prost, der Herr.',
                'PASST!',
                'Du nimmst Zugroaster an und stichst den Platzhirsch-Zirkus. (Zugroaster = non-Bavarian outsider; Bua = boy.) Nie den Vorwurf abstreiten — dreh ihn.',
              ),
              _gdec('Ist ja gut, ich setz mich woanders hin.',
                  'Nachgeben ist okay, aber du lässt ihm das letzte Wort. Kontere mit Charme.'),
              _gweak('Selber Zugroaster.',
                  'Er ist offensichtlich keiner. Der Konter geht ins Leere.'),
              _ggro('Oh, Entschuldigung, natürlich, sofort!',
                  'Vorm Stammtisch-Opa strammstehen — der erzählt das wochenlang. Mumm futsch.'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'DIE KELLNERIN',
        npc: _kellnerin,
        rounds: [
          Round(
            lead: [
              Line.npc('A Mass? Oder magst nix Gscheids?'),
              Line.you('Ein kleines Bier, bitte.'),
            ],
            insult: 'A Kleines. Im Biergarten. Bua, bist du a Depp oder tust nur so? Da lacht ja der Krug.',
            comebacks: [
              _gbest(
                'Bei den Preisen trink ich lieber zwei Kleine und schau zu, wie Sie mir es dreimal falsch ausrechnen. Also, a Kleines, bitte.',
                'GSCHMEIDIG!',
                'Du kombinierst Sparsamkeit mit einem Seitenhieb. (Depp = twit/idiot; gscheid = proper/decent.) Der Kellnerin gewinnt man mit Schmäh, nicht mit Trotz.',
              ),
              _gdec('Ich mag halt kleine Biere.',
                  'Ehrlich, aber du verteidigst dich nur. Nie den Vorwurf annehmen — spiel zurück.'),
              _gweak('Ich bin kein Depp.',
                  'Das Wort zurückwerfen zeigt, dass es getroffen hat.'),
              _ggro('Oh, dann halt a Mass, passt scho.',
                  'Sich das Getränk aufschwatzen lassen aus Feigheit. Mumm futsch.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'DER BAYER',
      npc: _bayer,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*baut sich auf* Was schaugst?')],
          insult: 'Kimmst in MEIN Wirtshaus und grüßt net amoi. Bist du deppert, oder was, du Hornochse?',
          comebacks: [
            _gbest(
              'Dein Wirtshaus? Dem Wirt sein Wirtshaus, mein Lieber. Du wärmst bloß die Bank und tust, als gehört dir der Biergarten. Griaß di.',
              'SITZT, PASST!',
              'Du zerlegst das "mein Wirtshaus" mit einem Fakt und grüßt betont freundlich. (Hornochse = blockhead; deppert = daft.) Nie den Köder schlucken.',
              rep: 150, bottle: 1,
            ),
            _gdec('Ganz ruhig, ich bin grad erst reikommen.',
                'Ton passt, aber allgemein. Häng es an IHN und es sitzt doppelt.', rep: 35),
            _gweak('Hornochse bist selber.',
                'Selber — er hat vorgelegt, du kopierst.', bottle: -2),
            _ggro('Tschuldigung, ich wollt kei Ärger, ich geh.',
                'Dem Grantler Angst zeigen ist die Einladung. Mumm weg.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('Ah, der Bua hat a Goschn!')],
          insult: 'Und jetzt? Was machst jetzt, ha?',
          comebacks: [
            _gbest(
              'Nix. I trink mei Bier und genieß die Sonn. Du brauchst an Streit, damit da fad wird — i hab es a so schee. Des is der Unterschied zwischen uns zwoa.',
              'DAS LETZTE WORT!',
              'Du koppelst deine Laune vom Streit ab — unkonterbar für an Grantler. Ruhe schlägt Radau. (Goschn = gob/mouth; schee = schön.)',
              rep: 200, bottle: 2,
            ),
            _gdec('Nix. Weitertrinken, schätz i.',
                'Die Ruhe is da, aber flach. Zeig eahm, dass ER den Streit braucht.', rep: 40),
            _gweak('Oh, i hab so a Angst.',
                'Billiger Sarkasmus kauft eahm die Drohung ab.', bottle: -1),
            _ggro('Passt scho, du hast recht.',
                'Du hast recht is Blut im Wasser. Mumm weg.', bottle: -2),
          ],
        ),
      ],
    ),
  ),

  // ============================ RUHRPOTT ============================
  Zone(
    id: 'ruhrpott',
    name: 'RUHRPOTT',
    tagline: 'Bude, Förderturm, Feierabendbier. Hier is jeder dein Kollege — bis er es nich mehr is.',
    scene: SceneKey.ruhrpott,
    encounters: [
      Encounter(
        npcName: 'DER BUDENBESITZER',
        npc: _bude,
        rounds: [
          Round(
            lead: [
              Line.npc('Wat willze, Kollege?'),
              Line.you('Nur mal gucken, was ihr habt.'),
            ],
            insult: 'Nur gucken. Wat is dat denn für eine Nummer. Bisse zu knickerig für eine Currywurst, oder wat, Pappnase?',
            comebacks: [
              _gbest(
                'Knickerig? Ich zahl gern — nur nich fünf Euro für eine Wurst, die seit gestern im Fett schwimmt. Wenn frisch is, red ma nochma, Kollege.',
                'SITZT!',
                'Du folgst dem Ton und triffst Preis und Ware. (Pappnase = clown/idiot; knickerig = stingy; Kollege = mate.) Im Pott feilscht man mit Humor.',
              ),
              _gdec('Ich kauf grad nix, danke.',
                  'Okay, aber du gibst ihm das "knickerig". Nie den Vorwurf annehmen.'),
              _gweak('Bin nich knickerig.',
                  'Abstreiten bringt dich in die Defensive. Er hat die Lautstärke.'),
              _ggro('Na gut, dann eine Currywurst.',
                  'Aus Mitleid kaufen, und teuer. Tschüss Geld und Mumm.'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'DER FUSSBALLFAN',
        npc: _fan,
        rounds: [
          Round(
            lead: [
              Line.npc('*mustert dein Shirt* Ey, für wen bisse?'),
              Line.you('Ich guck nur zu, ehrlich.'),
            ],
            insult: 'Guckt nur zu. So einer. Kein Verein, kein Herz, nix. Du bist doch ein Eventgänger, du Dösbaddel.',
            comebacks: [
              _gbest(
                'Ich stand bei minus fünf Grad in der Nordkurve, als eure Elf 0 zu 4 verloren hat. Du singst dasselbe Lied seit 2012. Setz dich.',
                'TOOOR!',
                'Du übertrumpfst den Echtheits-Cop mit einem echten, miesen Auswärtsspiel. (Dösbaddel = numbskull; Eventgänger = glory-hunter.) Zeigen, nicht behaupten.',
                rep: 150, bottle: 1,
              ),
              _gdec('Ich hab eine Dauerkarte, länger als du denkst.',
                  'Behauptung ist kein Beweis. Ein mieses Spiel schlägt jedes "glaub mir".', rep: 35),
              _gweak('Ich bin echt Fan!',
                  '"Ich bin echt" sagt genau der Eventgänger. Zeigen statt beteuern.'),
              _ggro('Stimmt, ich guck erst seit letzter Saison.',
                  'Das einzige, was die Kurve nie verzeiht, zugeben. Mumm futsch.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'DER KUMPEL',
      npc: _kumpel,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*breite Schultern, Blick* Und? Wat guckste so?')],
          insult: 'Kommste in meine Kneipe und sachst nich ma Tach. Bisse bekloppt, oder wat, du Spinner?',
          comebacks: [
            _gbest(
              'Deine Kneipe? Die gehört dem Wirt anne Theke, Kollege. Du wärmst seit zwanzig Jahren den Hocker und nennst dat "meine". Glück auf.',
              'VOLLE KANNE!',
              'Du zerlegst das "meine Kneipe" mit einem Fakt und grüßt mit "Glück auf". (bekloppt = nuts; Spinner = weirdo/nutter.) Nie den Köder nehmen.',
              rep: 150, bottle: 1,
            ),
            _gdec('Ganz ruhig, bin grad erst rein.',
                'Ton stimmt, aber allgemein. Häng es an IHN.', rep: 35),
            _gweak('Spinner bisse selber.',
                'Selber — er legt vor, du kopierst.', bottle: -2),
            _ggro('Sorry, wollt kein Stress, ich geh.',
                'Dem Schrank Angst zeigen is die Einladung. Mumm weg.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('Kuck ma an, der hat eine Klappe!')],
          insult: 'Un nu? Wat machste jetz, häh?',
          comebacks: [
            _gbest(
              'Nix, Kollege. Ich trink mein Pils und mach es mir schön. Du brauchst Zoff, damit wat los is — ich hab es so schon gut. Dat is der Unterschied.',
              'DAS LETZTE WORT!',
              'Du koppelst die Laune vom Zoff ab — unkonterbar. Ruhe schlägt Radau.',
              rep: 200, bottle: 2,
            ),
            _gdec('Nix. Weitertrinken, schätz ich.',
                'Ruhe is da, aber flach. Zeig, dass ER den Zoff braucht.', rep: 40),
            _gweak('Oh, wat ein Schreck.',
                'Billiger Sarkasmus kauft die Drohung ab.', bottle: -1),
            _ggro('Is ja gut, du hast recht.',
                'Du hast recht is Blut im Wasser. Mumm weg.', bottle: -2),
          ],
        ),
      ],
    ),
  ),

  // ============================ HAMBURG ============================
  Zone(
    id: 'hamburg',
    name: 'HAMBURG',
    tagline: 'Hafen und Fischmarkt. Moin. Mehr Begrüßung kriegst du nicht.',
    scene: SceneKey.hafen,
    encounters: [
      Encounter(
        npcName: 'DER FISCHKOPP',
        npc: _fischkopp,
        rounds: [
          Round(
            lead: [
              Line.npc('Moin! Na, min Jung, watt schall dat sein?'),
              Line.you('Ich schau nur, danke.'),
            ],
            insult: 'Nur kieken. Jaja. Zu fein für ehrlichen Fisch, wa? So ein bleicher Dösbaddel aus dem Süden, wette ich.',
            comebacks: [
              _gbest(
                'Ehrlicher Fisch? Der guckt mich seit Dienstag an, min Jung. Wenn der frisch is, bin ich der Bürgermeister. Aber schön laut biste, dat lass ich dir.',
                'DAT SITZT!',
                'Du kappst die "ehrlicher Fisch"-Masche mit Humor. (Dösbaddel = numbskull; moin = hello; min Jung = my boy.) Am Fischmarkt gewinnt der Lautere mit Witz.',
              ),
              _gdec('Ich kauf grad nix, danke.',
                  'Okay, aber du lässt "Dösbaddel" stehen. Dreh es um.'),
              _gweak('Ich bin kein Dösbaddel.',
                  'Zurückwerfen zeigt, dass es saß.'),
              _ggro('Na gut, geben Sie mir ein Fischbrötchen.',
                  'Aus Mitleid kaufen. Tschüss Geld und Mumm.'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'DIE HANSEATIN',
        npc: _hanseatin,
        rounds: [
          Round(
            lead: [
              Line.npc('*mustert dich kühl von oben bis unten*'),
              Line.you('Guten Tag?'),
            ],
            insult: 'Guten Tag. Wie... erfrischend direkt. Man merkt, Sie sind nicht von hier. Bei uns hat man etwas mehr... Contenance.',
            comebacks: [
              _gbest(
                'Contenance, gewiss. Fast so viel, wie man braucht, um eine Fremde auf der Straße von oben herab zu mustern und es "Kinderstube" zu nennen. Schönen Tag.',
                'EISKALT SERVIERT!',
                'Register-Wechsel: kein Schimpfwort, nur ein Lächeln. Du spiegelst die feine Herablassung zurück. (Contenance = composure; hanseatische Kühle = the cold northern politeness.)',
              ),
              _gdec('Danke, ich mag es direkt.',
                  'Würdevoll, aber du lässt die Spitze stehen. Sie respektiert einen Konter.'),
              _gweak('Wollen Sie mich beleidigen?',
                  'Das Stille laut aussprechen macht DICH zum Störer. Hier verliert, wer den Ton bricht.'),
              _ggro('Oh, Verzeihung, ich wollte nicht unhöflich sein.',
                  'Sich entschuldigen bestätigt, dass es saß. Mumm futsch.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'DER HAFENARBEITER',
      npc: _hafenarbeiter,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*stellt sich breit hin* Moin. Un du büst wer?')],
          insult: 'Kummst hier anne Kaje und kiekst rum, as wenn di dat hier hört. Büst du bekloppt, oder wat, du Sabbelschnute?',
          comebacks: [
            _gbest(
              'Deine Kaje? De gehört dem Hafen, min Fründ. Du malochst hier, klar — aber besitzen tust du hier gar nix. Also, Moin auch.',
              'FESTGEMACHT!',
              'Du zerlegst das "meine Kaje" mit einem Fakt. (Sabbelschnute = chatterbox/gob; malochen = to graft; Kaje = quay.) Nie den Köder nehmen.',
              rep: 150, bottle: 1,
            ),
            _gdec('Ganz ruhig, ich guck doch nur.',
                'Ton stimmt, aber allgemein. Häng es an IHN.', rep: 35),
            _gweak('Sabbelschnute bist du selber.',
                'Selber — er legt vor, du kopierst.', bottle: -2),
            _ggro('Tschuldigung, ich wollt kein Ärger.',
                'Dem Hafenriesen Angst zeigen is die Einladung. Mumm weg.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('Kiek an, de Lütte hett een groot Muul!')],
          insult: 'Un nu? Wat wullt du nu maken, häh?',
          comebacks: [
            _gbest(
              'Nix, min Fründ. Ich trink mein Astra und kiek aufs Wasser. Du brauchst Zoff, damit di wat fehlt — mir fehlt nix. Dat is de Unnerscheed twüschen uns.',
              'DAT LETZTE WORT!',
              'Du koppelst die Laune vom Zoff ab — unkonterbar. Ruhe schlägt Radau. (groot Muul = big mouth; Unnerscheed = difference.)',
              rep: 200, bottle: 2,
            ),
            _gdec('Nix. Weiter aufs Wasser kieken, schätz ich.',
                'Ruhe is da, aber flach. Zeig, dass ER den Zoff braucht.', rep: 40),
            _gweak('Oh, wat ein Schreck.',
                'Billiger Sarkasmus kauft die Drohung ab.', bottle: -1),
            _ggro('Is ja gut, du hast recht.',
                'Du hast recht is Blut im Wasser. Mumm weg.', bottle: -2),
          ],
        ),
      ],
    ),
  ),
];

final Game germanGame = Game(
  id: 'german',
  taunt: 'Na?',
  titleLine1: 'GROSSE',
  titleLine2: 'KLAPPE',
  tileLabel: 'Deutsch',
  subtitle: 'EIN MAULHELDEN-SIMULATOR',
  selectBlurb: 'Stell dich Berlin, Bayern, dem Ruhrpott und Hamburg.',
  accent: Color(0xFFC99A2E),
  avatar: _schnauze,
  player: germanPlayer,
  zones: _germanZones,
  strings: germanStrings,
);
