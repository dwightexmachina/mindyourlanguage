import 'package:flutter/painting.dart';

import '../art/character.dart';
import 'models.dart';

// ---------------------------------------------------------------------------
// The British game
// ---------------------------------------------------------------------------

const englishStrings = Strings(
  howRespond: 'HOW DO YOU RESPOND?',
  respondSub: 'Land the best comeback. Grovelling loses your bottle.',
  tapContinue: '» tap to continue',
  notFinished: "They're not finished yet. Tap the scene to hear them out.",
  startRun: 'START A RUN',
  bestLabel: 'BEST',
  repLabel: 'REP',
  meterLabel: 'BOTTLE',
  jumpZone: 'JUMP TO A CLEARED ZONE',
  zoneWord: 'ZONE',
  ofWord: 'OF',
  bossWord: 'BOSS',
  encounterWord: 'ENCOUNTER',
  goOnThen: 'GO ON THEN',
  next: 'NEXT',
  walkOn: 'WALK ON',
  claimZone: 'CLAIM THE ZONE',
  seeDamage: 'SEE THE DAMAGE',
  zoneCleared: 'ZONE CLEARED',
  zoneBonusChip: '+250 REP ZONE BONUS',
  meterRefilledChip: '▲ BOTTLE REFILLED',
  checkpointChip: 'CHECKPOINT SAVED',
  onwards: 'ONWARDS',
  finalWord: 'THE FINAL WORD',
  gameOverTitle: "YOU'VE LOST\nYOUR BOTTLE",
  retakePrefix: 'RETAKE ',
  slinkOff: 'SLINK OFF',
  winTitle: 'SILVER\nTONGUE',
  winBody:
      'You held your nerve from the high street to the head of the table. '
      'There is nothing left in Britain that can insult you. Go forth and mind '
      "everyone else's language.",
  winDone: 'BACK TO THE STREET',
  titleBody:
      'Someone always fancies a go. Read the insult, pick the best comeback, '
      'and keep your BOTTLE — your nerve — from running dry. Grovel and you lose it.',
  backLabel: 'GAMES',
);

final Game britishGame = Game(
  id: 'british',
  titleLine1: 'MIND YOUR',
  titleLine2: 'LANGUAGE',
  tileLabel: 'English',
  subtitle: 'A BRITISH BANTER SIMULATOR',
  selectBlurb: 'Take on the high street, the pub, the footy and the dinner party.',
  accent: Color(0xFFE23A3A),
  avatar: _geezer,
  player: player,
  zones: britishZones,
  strings: englishStrings,
);

// ---------------------------------------------------------------------------
// Character specs
// ---------------------------------------------------------------------------

const player = CharacterSpec(
  shirt: Color(0xFF3C5A57),
  shirtTrim: Color(0xFF34504D),
  trousers: Color(0xFF2C3550),
  hair: Color(0xFF2E2A27),
  accessory: Accessory.backpack,
  accentA: Color(0xFFE9B44C),
  expr: Expr.smug,
  facing: Facing.right,
);

const _karen = CharacterSpec(
  skin: Color(0xFFF0C6A0),
  shirt: Color(0xFFC98CA6),
  shirtTrim: Color(0xFFB2748E),
  trousers: Color(0xFF6A5A6A),
  hair: Color(0xFFE8CE7A),
  hat: Hat.sunhat,
  hatColor: Color(0xFFEBD9B0),
  accentA: Color(0xFFD98CA6),
  expr: Expr.snooty,
  facing: Facing.left,
);

const _chugger = CharacterSpec(
  shirt: Color(0xFF8ED04A),
  shirtTrim: Color(0xFF6FB033),
  trousers: Color(0xFF3A3A42),
  hair: Color(0xFF4A3A2A),
  hat: Hat.beanie,
  hatColor: Color(0xFF24303A),
  accentA: Color(0xFFE9B44C),
  accessory: Accessory.badge,
  expr: Expr.neutral,
  facing: Facing.left,
);

const _roadman = CharacterSpec(
  shirt: Color(0xFF3A3A42),
  shirtTrim: Color(0xFF2C2C34),
  trousers: Color(0xFF20202A),
  hat: Hat.beanie,
  hatColor: Color(0xFF1A1A22),
  accentA: Color(0xFFE23A3A),
  expr: Expr.smug,
  facing: Facing.left,
);

const _geezer = CharacterSpec(
  skin: Color(0xFFE8A57C),
  shirt: Color(0xFFF2F2F2),
  shirtTrim: Color(0xFFD33333),
  trousers: Color(0xFF3A3A40),
  shoes: Color(0xFF1E1E22),
  hat: Hat.flatCap,
  hatColor: Color(0xFF333333),
  accessory: Accessory.badge,
  accentA: Color(0xFFD33333),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

const _drunk = CharacterSpec(
  skin: Color(0xFFE8A57C),
  shirt: Color(0xFF9C5B3A),
  shirtTrim: Color(0xFF7E4527),
  trousers: Color(0xFF3A2E28),
  hair: Color(0xFF6A4A2A),
  expr: Expr.smug,
  facing: Facing.left,
  stocky: true,
);

const _landlady = CharacterSpec(
  skin: Color(0xFFF0C6A0),
  shirt: Color(0xFF7A2E4A),
  shirtTrim: Color(0xFF5E2038),
  trousers: Color(0xFF2C2430),
  hair: Color(0xFF3A2A1A),
  expr: Expr.smug,
  facing: Facing.left,
);

const _hardman = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFFEDEDED),
  shirtTrim: Color(0xFFD6D6D6),
  trousers: Color(0xFF2A2A30),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

const _rivalFan = CharacterSpec(
  shirt: Color(0xFF1B4F8A),
  shirtTrim: Color(0xFF143B69),
  trousers: Color(0xFF20202A),
  hat: Hat.beanie,
  hatColor: Color(0xFF1B4F8A),
  accessory: Accessory.scarf,
  accentA: Color(0xFF1B4F8A),
  accentB: Color(0xFFF5ECD9),
  expr: Expr.shout,
  facing: Facing.left,
);

const _homeFan = CharacterSpec(
  skin: Color(0xFFE8A57C),
  shirt: Color(0xFFC1121F),
  shirtTrim: Color(0xFF960E18),
  trousers: Color(0xFF20202A),
  accessory: Accessory.scarf,
  accentA: Color(0xFFC1121F),
  accentB: Color(0xFFF5ECD9),
  hair: Color(0xFF3A2A1A),
  expr: Expr.smug,
  facing: Facing.left,
  stocky: true,
);

const _ultra = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFF1C2A1C),
  shirtTrim: Color(0xFF122012),
  trousers: Color(0xFF14140F),
  hat: Hat.beanie,
  hatColor: Color(0xFF14140F),
  accessory: Accessory.scarf,
  accentA: Color(0xFF3DA35D),
  accentB: Color(0xFF14140F),
  expr: Expr.shout,
  facing: Facing.left,
  stocky: true,
);

const _host = CharacterSpec(
  skin: Color(0xFFF0C6A0),
  shirt: Color(0xFF1C1C28),
  shirtTrim: Color(0xFFF0F0F0),
  trousers: Color(0xFF14141C),
  hair: Color(0xFFBFB8A8),
  hat: Hat.bowler,
  hatColor: Color(0xFF14141C),
  expr: Expr.snooty,
  facing: Facing.left,
);

const _auntie = CharacterSpec(
  skin: Color(0xFFEED2B4),
  shirt: Color(0xFF6A4A6A),
  shirtTrim: Color(0xFF543A54),
  trousers: Color(0xFF3A2E3A),
  hair: Color(0xFFC9C0B0),
  hat: Hat.sunhat,
  hatColor: Color(0xFFB9A6C0),
  accessory: Accessory.pearls,
  accentA: Color(0xFFF5ECD9),
  expr: Expr.snooty,
  facing: Facing.left,
);

const _dowager = CharacterSpec(
  skin: Color(0xFFEED2B4),
  shirt: Color(0xFF4A2E4A),
  shirtTrim: Color(0xFF382038),
  trousers: Color(0xFF2A1E2A),
  hair: Color(0xFFCFC8B8),
  hat: Hat.sunhat,
  hatColor: Color(0xFF6A2E5A),
  accessory: Accessory.pearls,
  accentA: Color(0xFFF5ECD9),
  expr: Expr.snooty,
  facing: Facing.left,
  stocky: true,
);

// ---------------------------------------------------------------------------
// Comeback shorthands (keeps the content below readable)
// ---------------------------------------------------------------------------

Comeback _best(String text, String verdict, String note, {int rep = 120, int bottle = 1}) =>
    Comeback(text: text, quality: Quality.best, rep: rep, bottle: bottle, verdict: verdict, good: true, note: note);

Comeback _decent(String text, String note, {int rep = 25, int bottle = 0}) =>
    Comeback(text: text, quality: Quality.decent, rep: rep, bottle: bottle, verdict: 'MEH.', good: false, note: note);

Comeback _weak(String text, String note, {int rep = 10, int bottle = -1}) =>
    Comeback(text: text, quality: Quality.weak, rep: rep, bottle: bottle, verdict: 'WEAK.', good: false, note: note);

Comeback _grovel(String text, String note, {int bottle = -2}) =>
    Comeback(text: text, quality: Quality.grovel, rep: 0, bottle: bottle, verdict: 'YOU BOTTLED IT.', good: false, note: note);

// ---------------------------------------------------------------------------
// The zones
// ---------------------------------------------------------------------------

final List<Zone> britishZones = [
  // ======================= ZONE 1: THE HIGH STREET =======================
  Zone(
    id: 'high_street',
    name: 'THE HIGH STREET',
    tagline: 'Saturday afternoon. Everyone thinks they can have a go.',
    scene: SceneKey.highStreet,
    encounters: [
      Encounter(
        npcName: 'KAREN',
        npc: _karen,
        rounds: [
          Round(
            lead: [
              Line.npc('Excuse me. EXCUSE me. Do you work here?'),
              Line.you('...No?'),
            ],
            insult: 'Typical. You lot are all the same — a right little oik with no manners. I want to speak to whoever is in charge of YOU.',
            comebacks: [
              _best(
                "There's no one in charge of me, love, that's rather the point of being an adult. Something you'll grasp any decade now.",
                'BELTER!',
                "Turning her own <b>manager</b> obsession back on her is chef's kiss. (<b>oik</b> = a rude, low-class lout — she's the one being rude, so it boomerangs beautifully.)",
              ),
              _decent(
                'Yeah? And I want a word with whoever raised you.',
                "Fair swing, but it's a playground classic she's heard a hundred times. A <b>decent</b> comeback needs to be about <i>her</i>, specifically.",
              ),
              _weak(
                'Whatever, Karen.',
                "Naming the meme is lazy. She feeds on the reaction. <i>Weak sauce.</i>",
              ),
              _grovel(
                "S-sorry! I didn't mean to be rude!",
                "Apologising to a Karen is like chumming the water. Your <b>BOTTLE</b> (your nerve) takes a hit.",
              ),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'THE CHUGGER',
        npc: _chugger,
        rounds: [
          Round(
            lead: [
              Line.npc('Hiya! Big smile! Got a sec for children in need of clean water?'),
              Line.you('I really am in a rush, sorry—'),
            ],
            insult: "Wow. Too busy to save a life. Must be nice being that tight, mate. Bet you squeak when you walk.",
            comebacks: [
              _best(
                "I give directly, not to a bloke on £11 an hour guilt-tripping strangers for a clipboard commission. Nice tabard, though.",
                'GET IN!',
                "You out-morals the moraliser AND exposes the sales tactic. (<b>tight</b> = stingy with money — flipping it into where your money actually goes is a proper mic-drop.)",
              ),
              _decent(
                "Tight? I'm skint, pal, there's a difference.",
                "Honest, but you've accepted his framing. <i>Never</i> defend the charge — flip it.",
              ),
              _weak(
                'Leave me alone.',
                "Silence just lets him perform for the queue behind you. Say something with a bit of <b>bite</b>.",
              ),
              _grovel(
                "Oh gosh, okay, how do I sign up?",
                "Guilt-tripped into a direct debit on the pavement. Your wallet AND your bottle just took a hit.",
              ),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'THE ROADMAN',
        npc: _roadman,
        rounds: [
          Round(
            lead: [
              Line.npc('Oi. OI. You just look at me?'),
              Line.you('Mate, I was looking at the bus times.'),
            ],
            insult: "Nah you're moist, fam. Proper wet. Bare moist energy comin off you, innit.",
            comebacks: [
              _best(
                "Three words for 'damp' in one sentence — your English teacher's the real victim here. Off you pop, the 42's coming.",
                'SCENES!',
                "You clock the limited vocabulary without punching down. (<b>moist</b>/<b>wet</b> = feeble, pathetic — refusing to be rattled is the whole game.)",
              ),
              _decent(
                "Says the lad in a full tracksuit at a bus stop.",
                "Landed a hit, but it's a bit scattergun. Aim at what he actually <i>said</i>, not just what he's wearing.",
              ),
              _weak(
                "You're moist.",
                "Repeating his own insult back is the comeback equivalent of 'no u'. <i>Try harder.</i>",
              ),
              _grovel(
                "Sorry bro, no beef, we're good yeah?",
                "Calling him 'bro' and folding instantly? He can smell it. Bottle down.",
              ),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'THE FLAT-CAP GEEZER',
      npc: _geezer,
      isBoss: true,
      rounds: [
        Round(
          lead: [
            Line.npc("Oi! You've gone an' spilled me pint, you absolute weapon."),
          ],
          insult: "Go on then — what you gonna do about it, eh?",
          comebacks: [
            _best(
              "That warm, watered-down gnat's piss? Mate, I did the floor a favour.",
              'BELTER!',
              "You didn't just insult him, you insulted his <i>taste in pints</i>. Specific + on-topic = a proper comeback. (<b>weapon</b> = an idiot, nothing to do with actual weapons.)",
              rep: 140, bottle: 1,
            ),
            _decent(
              "Piss off, you flat-capped melt.",
              "Calling him a <b>melt</b> (a soft, pathetic bloke) is fair, but it's lazy and he's heard it. Volume isn't wit.",
              rep: 30,
            ),
            _weak(
              "C-come on then, if you think you're hard enough.",
              "Stammering 'come on then' is the sound of a man with no plan. Confidence is half the comeback.",
              bottle: -2,
            ),
            _grovel(
              "So sorry! Let me get you another, yeah?",
              "Grovelling to a bully on the high street? Your <b>BOTTLE</b> just took a proper hit.",
              bottle: -2,
            ),
          ],
        ),
        Round(
          lead: [
            Line.npc("Oh, comedian are we? I'll wipe that smirk off ya."),
          ],
          insult: "You don't know who you're talkin' to, son.",
          comebacks: [
            _best(
              "A bloke in a flat cap crying over a £3.60 lager? I've got a fairly complete picture, yeah.",
              'GET IN!',
              "Deflating the 'do you know who I am' threat by answering it literally is a classic British move. Never take the bait — <b>describe</b> the bait.",
              rep: 150, bottle: 1,
            ),
            _decent(
              "Some bloke in a pub. Riveting.",
              "The bored-tone works, but it's generic. Tie it to <i>him</i> and it'd land twice as hard.",
              rep: 30,
            ),
            _weak(
              "Neither do you, mate!",
              "'No you' energy again. He led, you copied. Lead back.",
              bottle: -1,
            ),
            _grovel(
              "Nobody! You're right, I'll go.",
              "Backing down mid-exchange hands him the win in front of the whole pub. Bottle down.",
              bottle: -2,
            ),
          ],
        ),
        Round(
          lead: [
            Line.npc("...Right. RIGHT. That's it."),
          ],
          insult: "Last chance, clever clogs. Any final words?",
          comebacks: [
            _best(
              "Yeah — your round. Two pints. I'll have what you're NOT having, clearly.",
              'FINISH HIM!',
              "Ending by making HIM buy YOU a drink is total dominance, delivered with a smile. You win the room. That's a comeback that becomes a <i>legend</i>.",
              rep: 200, bottle: 2,
            ),
            _decent(
              "Yeah: mind the wet floor.",
              "Cheeky callback, decent — but it lets him off lightly on the final blow. Go for the throat (politely).",
              rep: 40,
            ),
            _weak(
              "No? Can I go now?",
              "Asking permission to leave undoes all your good work. Own the exit.",
              bottle: -1,
            ),
            _grovel(
              "Please don't hit me.",
              "At the finish line you flinched. Bottle gone.",
              bottle: -3,
            ),
          ],
        ),
      ],
    ),
  ),

  // ============================ ZONE 2: THE PUB ============================
  Zone(
    id: 'pub',
    name: 'THE RED LION',
    tagline: "Last orders looming. The regulars have opinions.",
    scene: SceneKey.pub,
    encounters: [
      Encounter(
        npcName: 'THE DART LOBBER',
        npc: _drunk,
        rounds: [
          Round(
            lead: [
              Line.npc("*hic* You drinkin' a... is that a LIME AND SODA?"),
            ],
            insult: "Bloody hell. You're a proper lightweight, aren't ya. Bet you're tucked up by nine.",
            comebacks: [
              _best(
                "I'll remember 'lightweight' for you tomorrow morning, when you're texting the group chat an apology you don't remember writing.",
                'BELTER!',
                "You accept the label and weaponise the contrast — sober-you wins the long game. (<b>lightweight</b> = someone who can't handle much drink; owning it confidently defuses it.)",
              ),
              _decent(
                "At least I'll remember tonight.",
                "Good bones, but half-formed. Paint the picture of his tomorrow and it's a knockout.",
              ),
              _weak(
                "It's got a lot of lime in it, actually.",
                "Defending your drink concedes the point entirely. Never explain — flip.",
              ),
              _grovel(
                "I'll get a proper one, what should I have?",
                "Letting a swaying stranger pick your drink to prove yourself? Bottle down.",
              ),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'THE LANDLADY',
        npc: _landlady,
        rounds: [
          Round(
            lead: [
              Line.npc("You've been nursing that one drink for an hour, love."),
              Line.you('Just pacing myself.'),
            ],
            insult: "Pacing yourself. In MY pub. You absolute wet wipe — either drink up or do one.",
            comebacks: [
              _best(
                "A wet wipe still does more cleaning up than this carpet's seen since the coronation. Same again, when you've a sec.",
                'GET IN!',
                "Matching a landlady's wit with a warm-but-cutting comeback (about her pub, not her) earns respect. (<b>wet wipe</b> = a feeble, spineless person. The trick: agree, then out-banter.)",
              ),
              _decent(
                "Charming service. Five stars.",
                "Sarcasm's fine but it's the easy road. A landlady respects a proper <i>volley</i>, not a shrug.",
              ),
              _weak(
                "That's a bit rude.",
                "Calling banter 'rude' in a pub marks you as fair game for the whole bar. Play the game.",
                bottle: -1,
              ),
              _grovel(
                "Sorry! I'll get another straight away!",
                "Scrambling for your wallet at the first jab? She's already turned to the next customer. Bottle down.",
              ),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'THE PUB HARDMAN',
      npc: _hardman,
      isBoss: true,
      rounds: [
        Round(
          lead: [
            Line.npc("You're in my seat."),
            Line.you("There's no name on it."),
          ],
          insult: "There's twenty years of my arse on it, son. That's a name. Move.",
          comebacks: [
            _best(
              "Twenty years in the same seat. Mate, that's not a hard man, that's a National Trust exhibit. I'll leave you to the tour.",
              'BELTER!',
              "You reframe his 'tough' backstory as sad and small — then leave on YOUR terms, not his. Winning isn't the seat, it's the exit line.",
              rep: 150, bottle: 1,
            ),
            _decent(
              "Bit tragic, measuring your life in bar stools.",
              "The idea's right but it's blunt. The National-Trust flourish is what turns a jab into a <i>story</i>.",
              rep: 35,
            ),
            _weak(
              "Fine, whatever, I'm moving.",
              "Moving is fine — moving while muttering 'whatever' just looks scared. Move like it was your idea.",
              bottle: -1,
            ),
            _grovel(
              "So sorry, I didn't know, please don't—",
              "You've announced you're frightened to the one man in the room looking for exactly that. Bottle down.",
              bottle: -2,
            ),
          ],
        ),
        Round(
          lead: [
            Line.npc("Think you're funny? I've flattened blokes for less."),
          ],
          insult: "Go on, say one more clever thing. I dare ya.",
          comebacks: [
            _best(
              "Mate, it's all handbags and you know it. You're not going to swing in front of the landlady who bars you and you'd miss your own funeral. Pint?",
              'FINISH HIM!',
              "You name the bluff (<b>handbags</b> = a lot of squaring-up, no actual fighting), remove his audience, and offer peace from a position of strength. Total control.",
              rep: 200, bottle: 2,
            ),
            _decent(
              "You're all mouth, mate.",
              "Correct diagnosis, GCSE delivery. 'All handbags' with a reason lands far harder than 'all mouth'.",
              rep: 40,
            ),
            _weak(
              "I don't want any trouble.",
              "Trouble wants YOU now — sounding meek just confirms you're a safe target. Steady the voice.",
              bottle: -2,
            ),
            _grovel(
              "*bolts for the door*",
              "Legging it from the pub is a story he'll tell for twenty more years. Bottle gone.",
              bottle: -3,
            ),
          ],
        ),
      ],
    ),
  ),

  // =========================== ZONE 3: THE FOOTY ===========================
  Zone(
    id: 'footy',
    name: 'THE FOOTY',
    tagline: "Nil-nil at the half. The stands need a villain.",
    scene: SceneKey.footy,
    encounters: [
      Encounter(
        npcName: 'THE RIVAL FAN',
        npc: _rivalFan,
        rounds: [
          Round(
            lead: [
              Line.npc('OI OI! Look at the state of this one!'),
            ],
            insult: "Your lot are BOTTLEJOBS, mate! Choke every single year! You'll bottle THIS and all!",
            comebacks: [
              _best(
                "Bottlejobs? We're seventh. You've come here on a Tuesday, in the rain, to sing about US. Who's living in whose head, pal?",
                'GET IN!',
                "Facts + the classic 'rent free' flip. (<b>bottlejob</b> = a team/person who chokes under pressure — the very thing YOUR bottle meter tracks. Never look rattled and the charge collapses.)",
              ),
              _decent(
                "Says the fan of a team that hasn't won owt since the war.",
                "Solid terrace stuff, but it's not answering the 'bottle' jibe — you've just started a different argument.",
              ),
              _weak(
                "You're the bottlejobs!",
                "Straight swap-back with no facts behind it. The whole stand can hear how thin that is.",
                bottle: -1,
              ),
              _grovel(
                "Yeah, fair, we're pretty bad this year.",
                "Agreeing with the away end about your own club? They'll sing your name — and not kindly. Bottle down.",
              ),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'THE GLOATER',
        npc: _homeFan,
        rounds: [
          Round(
            lead: [
              Line.npc("Ha! We just scored and you didn't even see it, you were at the pie stand!"),
            ],
            insult: "Typical daytripper. You're not a REAL fan, you're a scarfer. Bet you found us on the telly.",
            comebacks: [
              _best(
                "I've stood in the away end at Hartlepool on a wet Tuesday, mate. You sang 'is this a library' at your own fans last week. Sit down.",
                'SCENES!',
                "Out-authenticate the authenticity-cop with a specific, grim away-day — the ultimate fan flex. (<b>scarfer</b> = a glory-hunter who only owns the merch. Specificity is proof.)",
              ),
              _decent(
                "Mate, I've had a season ticket longer than your striker's been alive.",
                "Good claim, but 'trust me' isn't proof. One vivid, miserable away game beats any number of years.",
              ),
              _weak(
                "I am a real fan though!",
                "Protesting 'I AM' is exactly what a scarfer would say. Show, don't insist.",
              ),
              _grovel(
                "You got me, I only started watching last season.",
                "Confessing to the one crime the terrace never forgives? Bottle down.",
              ),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'THE AWAY-END ULTRA',
      npc: _ultra,
      isBoss: true,
      rounds: [
        Round(
          lead: [
            Line.npc("*leading the whole away end* WHO ARE YA?! WHO ARE YA?!"),
          ],
          insult: "Two thousand of us, one of you. Go on. Sing us a song, if you've got the bottle.",
          comebacks: [
            _best(
              "Two thousand blokes who paid forty quid to watch YOUR team lose, and I'm the one you're all looking at. Best turnout you'll have all season, this.",
              'BELTER!',
              "Turn the mob's size into evidence of THEIR obsession. Outnumbered is only scary if you flinch — the meter's called BOTTLE for a reason.",
              rep: 150, bottle: 1,
            ),
            _decent(
              "Lovely singing. Shame about the football.",
              "Cheeky and safe, but with 2,000 of them you need to flip the numbers, not sidestep them.",
              rep: 35,
            ),
            _weak(
              "There's no need for all that.",
              "Tone-policing an away end is like asking the tide to stop. Meet the energy or get swept.",
              bottle: -2,
            ),
            _grovel(
              "*quietly puts scarf away*",
              "Hiding your colours in front of the ultras is the surrender they came for. Bottle down.",
              bottle: -2,
            ),
          ],
        ),
        Round(
          lead: [
            Line.npc("Ohhh he's got jokes! He thinks he's the main character!"),
          ],
          insult: "You'll be quiet when we score, sunshine. What you gonna do THEN?",
          comebacks: [
            _best(
              "Same as now: enjoy my afternoon. See, you need the score to feel something. I'm having a lovely time and it's still nil-nil. That's the difference between us.",
              'FINISH HIM!',
              "You detach your mood from the scoreboard — the one thing a result-obsessed crowd can't argue with. Serenity is the ultimate wind-up. Unbottleable.",
              rep: 200, bottle: 2,
            ),
            _decent(
              "Then you'll have scored one. Congrats?",
              "The deflation's there, but it still hands them the 'when we score' premise. Take the scoreboard away entirely.",
              rep: 40,
            ),
            _weak(
              "You haven't scored though.",
              "Present tense facts won't hold if they DO score — you've bet your comeback on the match. Bet on yourself instead.",
              bottle: -1,
            ),
            _grovel(
              "Alright, alright, you win, big club.",
              "Calling them a 'big club' to make it stop is blood in the water. Bottle down.",
              bottle: -2,
            ),
          ],
        ),
      ],
    ),
  ),

  // ======================= ZONE 4: THE DINNER PARTY =======================
  Zone(
    id: 'dinner',
    name: 'THE DINNER PARTY',
    tagline: "Everyone's smiling. Nobody means it. Mind the register.",
    scene: SceneKey.dinner,
    encounters: [
      Encounter(
        npcName: 'THE HOST',
        npc: _host,
        rounds: [
          Round(
            lead: [
              Line.npc('Ah, you came! And in... that. How wonderfully relaxed of you.'),
            ],
            insult: "One does so admire people who simply don't worry about these things. It's terribly... brave.",
            comebacks: [
              _best(
                "It is brave, isn't it? Almost as brave as serving supermarket prosecco in a decanter and hoping no one clocks it. We're both being terribly relaxed tonight.",
                'DEVASTATING.',
                "The register flips: no swearing, all smiles. You match his weapon — the <i>polite</i> insult — and out-observe him. (<b>brave</b>, said like this, means 'a disaster'. The counter is a smiling knife, never a shout.)",
              ),
              _decent(
                "Thanks! I do try to be comfortable.",
                "Taking it as a genuine compliment isn't a loss, but it's a missed open goal. He teed you up — swing.",
                rep: 30, bottle: 0,
              ),
              _weak(
                "Are you having a go at my clothes?",
                "Saying the quiet part loud makes YOU the one who broke the polite spell. In this room, that's a defeat.",
                bottle: -1,
              ),
              _grovel(
                "Oh no, should I have dressed up? I'm so sorry.",
                "Apologising out loud confirms his little jab landed. The whole table noted it. Bottle down.",
              ),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'GREAT-AUNT MAUD',
        npc: _auntie,
        rounds: [
          Round(
            lead: [
              Line.npc('And how is the little... job going? The creative thing?'),
              Line.you("It's going really well, actually."),
            ],
            insult: "How lovely. Your cousin's just made partner, of course. But someone has to do the fun little jobs, don't they.",
            comebacks: [
              _best(
                "Someone does! And someone has to be the cousin who bills by the hour to avoid going home. We've all made our choices, Auntie. More wine?",
                'DEVASTATING.',
                "You accept the 'little job' framing then reveal the sad flip-side of the 'success' — and offer wine, so it stays a smile. Backhanded compliments are answered with backhanded compassion.",
              ),
              _decent(
                "I love what I do, so that's the main thing.",
                "Dignified and true — but it lets the jab stand unanswered. Aunt Maud respects a rally, even if she'd never admit it.",
                rep: 30,
              ),
              _weak(
                "It's not a 'little' job, actually.",
                "Air-quoting her word back defensively concedes that it stung. Never let them see it land.",
                bottle: -1,
              ),
              _grovel(
                "I know, I should probably get a proper career...",
                "Agreeing that your life is a disappointment, at dinner, to Aunt Maud? She'll dine out on it for months. Bottle down.",
              ),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'THE DOWAGER',
      npc: _dowager,
      isBoss: true,
      rounds: [
        Round(
          lead: [
            Line.npc('*setting down her glass* So. You are the one everyone has been... talking about.'),
          ],
          insult: "I must say, you're far more confident than your circumstances would suggest. How refreshing.",
          comebacks: [
            _best(
              "I find confidence is like good silver — you either inherit it or you earn it. I earned mine. Yours is looking a touch tarnished this evening.",
              'EXQUISITE.',
              "You meet her class-coded jab with a class-coded jab, using HER world (silver, inheritance) against her. In this arena, the sharpest blade is the one wrapped in velvet.",
              rep: 160, bottle: 1,
            ),
            _decent(
              "Confidence doesn't cost anything, thankfully.",
              "Neat, but a little abstract. Use HER furniture — inheritance, silver, the family name — and it becomes a scalpel.",
              rep: 40,
            ),
            _weak(
              "What's THAT supposed to mean?",
              "Demanding she explain the insult means you missed it — a fatal loss of face at this table.",
              bottle: -2,
            ),
            _grovel(
              "I'm sorry, I know I don't really belong here.",
              "Conceding you don't belong is precisely the sentence she was fishing for. Bottle down.",
              bottle: -2,
            ),
          ],
        ),
        Round(
          lead: [
            Line.npc('*thinnest possible smile* Careful, dear. Cleverness is so tiring in the young.'),
          ],
          insult: "One does hope you'll learn to pick your battles. Before they pick you.",
          comebacks: [
            _best(
              "Oh, I've picked this one. And do you know, I think we both know how it's going — otherwise you'd have changed the subject two courses ago. Lovely pudding, by the way.",
              'CHECKMATE.',
              "You calmly point out that HER continuing the fight proves she's losing it — then serenely compliment the dessert. Unbothered + observant = the final word. You win the whole table.",
              rep: 220, bottle: 2,
            ),
            _decent(
              "I picked this one on purpose.",
              "The right instinct, but stated flatly. The kill here is showing her that her <i>persistence</i> is the tell.",
              rep: 45,
            ),
            _weak(
              "Is that a threat?",
              "Naming it as a threat shatters the porcelain politeness — and in this room, whoever raises their voice first, loses.",
              bottle: -2,
            ),
            _grovel(
              "You're right, I'll keep quiet.",
              "Falling silent on command hands the grande dame total victory in front of everyone. Bottle gone.",
              bottle: -3,
            ),
          ],
        ),
      ],
    ),
  ),
];
