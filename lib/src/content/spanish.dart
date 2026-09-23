import 'package:flutter/painting.dart';

import '../art/character.dart';
import 'models.dart';

// ---------------------------------------------------------------------------
// The Spanish game: one Spanish-speaking region per zone.
// Teaching notes stay in Spanish, glossing the key slang term in English so an
// English speaker still learns it.
// ---------------------------------------------------------------------------

const spanishStrings = Strings(
  howRespond: '¿QUÉ LE CONTESTAS?',
  respondSub: 'Suelta la mejor réplica. Achantarse te cuesta agallas.',
  tapContinue: '» toca para seguir',
  notFinished: 'No ha terminado. Toca la escena para escucharle.',
  startRun: 'EMPEZAR',
  bestLabel: 'MEJOR',
  repLabel: 'FAMA',
  meterLabel: 'AGALLAS',
  jumpZone: 'IR A UNA ZONA SUPERADA',
  zoneWord: 'ZONA',
  ofWord: 'DE',
  bossWord: 'JEFE',
  encounterWord: 'RONDA',
  goOnThen: '¡VAMOS ALLÁ!',
  next: 'SIGUE',
  walkOn: 'SEGUIR',
  claimZone: 'RECLAMA LA ZONA',
  seeDamage: 'MIRA EL DESTROZO',
  zoneCleared: 'ZONA SUPERADA',
  zoneBonusChip: '+250 FAMA',
  meterRefilledChip: '▲ AGALLAS AL TOPE',
  checkpointChip: 'PROGRESO GUARDADO',
  onwards: 'ADELANTE',
  finalWord: 'LA ÚLTIMA PALABRA',
  gameOverTitle: 'TE HAS\nACHANTADO',
  retakePrefix: 'REPETIR ',
  slinkOff: 'LARGARSE',
  winTitle: 'PICO DE\nORO',
  winBody:
      'Has aguantado el tipo desde una plaza de España hasta una feria al pie '
      'de los Andes. No queda insulto en todo el idioma que te haga pestañear. '
      'Ahora ve y enséñale a hablar al mundo.',
  winDone: 'VOLVER',
  titleBody:
      'Siempre hay alguien con ganas de bronca. Lee el insulto, elige la mejor '
      'réplica y no dejes que se te acaben las AGALLAS. Si te achantas, las pierdes.',
  backLabel: 'JUEGOS',
);

// ---------------------------------------------------------------------------
// Characters
// ---------------------------------------------------------------------------

const spanishPlayer = CharacterSpec(
  shirt: Color(0xFFB5462F),
  shirtTrim: Color(0xFF973B28),
  trousers: Color(0xFF2C3550),
  hair: Color(0xFF2E2A27),
  accessory: Accessory.backpack,
  accentA: Color(0xFFE9B44C),
  expr: Expr.smug,
  facing: Facing.right,
);

// -- España --
const _cunao = CharacterSpec(
  skin: Color(0xFFE8B48A),
  shirt: Color(0xFF6FA0C8),
  shirtTrim: Color(0xFF568AB0),
  trousers: Color(0xFF3A3A42),
  hair: Color(0xFF3A2A1A),
  expr: Expr.smug,
  facing: Facing.left,
  stocky: true,
);
const _vecina = CharacterSpec(
  skin: Color(0xFFF0C6A0),
  shirt: Color(0xFF9C6A8A),
  shirtTrim: Color(0xFF80546F),
  trousers: Color(0xFF5A4A5A),
  hair: Color(0xFFCFC8B8),
  hat: Hat.sunhat,
  hatColor: Color(0xFFC8B49A),
  accessory: Accessory.pearls,
  accentA: Color(0xFFF5ECD9),
  expr: Expr.snooty,
  facing: Facing.left,
);
const _camarero = CharacterSpec(
  skin: Color(0xFFE8B48A),
  shirt: Color(0xFFF2F2F2),
  shirtTrim: Color(0xFF2A2A2A),
  trousers: Color(0xFF2A2A2A),
  hair: Color(0xFF241F1C),
  expr: Expr.angry,
  facing: Facing.left,
);

// -- México --
const _puestero = CharacterSpec(
  skin: Color(0xFFC98A5A),
  shirt: Color(0xFF2E9B94),
  shirtTrim: Color(0xFF1C6A64),
  trousers: Color(0xFF3A3A42),
  hair: Color(0xFF241F1C),
  expr: Expr.smug,
  facing: Facing.left,
);
const _dona = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFFC24A6E),
  shirtTrim: Color(0xFF9E3A58),
  trousers: Color(0xFF4A3A4A),
  hair: Color(0xFFCFC8B8),
  hat: Hat.sunhat,
  hatColor: Color(0xFFE0C0A0),
  accessory: Accessory.pearls,
  accentA: Color(0xFFF5ECD9),
  expr: Expr.snooty,
  facing: Facing.left,
);
const _cabron = CharacterSpec(
  skin: Color(0xFFC98A5A),
  shirt: Color(0xFF8A3A2A),
  shirtTrim: Color(0xFF6E2C20),
  trousers: Color(0xFF2A2A30),
  hair: Color(0xFF241F1C),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
  foldedArms: true,
);

// -- Argentina --
const _asador = CharacterSpec(
  skin: Color(0xFFE8B48A),
  shirt: Color(0xFFF2F2F2),
  shirtTrim: Color(0xFFCF4444),
  trousers: Color(0xFF3A3A42),
  hair: Color(0xFF3A2A1A),
  expr: Expr.smug,
  facing: Facing.left,
  stocky: true,
);
const _porteno = CharacterSpec(
  skin: Color(0xFFEAB489),
  shirt: Color(0xFF2A3A5A),
  shirtTrim: Color(0xFF1E2C46),
  trousers: Color(0xFF20202A),
  hair: Color(0xFF3A2A1A),
  expr: Expr.snooty,
  facing: Facing.left,
);
const _hinchaAr = CharacterSpec(
  skin: Color(0xFFE8B48A),
  shirt: Color(0xFF6CACE4),
  shirtTrim: Color(0xFF4E8FC8),
  trousers: Color(0xFF20202A),
  hat: Hat.beanie,
  hatColor: Color(0xFF6CACE4),
  accessory: Accessory.scarf,
  accentA: Color(0xFF6CACE4),
  accentB: Color(0xFFF5ECD9),
  expr: Expr.shout,
  facing: Facing.left,
  stocky: true,
);

// -- Chile --
const _feriante = CharacterSpec(
  skin: Color(0xFFC98A5A),
  shirt: Color(0xFF3E7D4A),
  shirtTrim: Color(0xFF2E5E38),
  trousers: Color(0xFF3A3A42),
  hat: Hat.beanie,
  hatColor: Color(0xFF24303A),
  accentA: Color(0xFFE9B44C),
  expr: Expr.smug,
  facing: Facing.left,
);
const _flaite = CharacterSpec(
  skin: Color(0xFFC98A5A),
  shirt: Color(0xFF2A2A32),
  shirtTrim: Color(0xFF1E1E24),
  trousers: Color(0xFF1A1A20),
  hat: Hat.beanie,
  hatColor: Color(0xFF14141A),
  accentA: Color(0xFF20F0C0),
  expr: Expr.smug,
  facing: Facing.left,
);
const _casera = CharacterSpec(
  skin: Color(0xFFD9A17A),
  shirt: Color(0xFF6A4A6A),
  shirtTrim: Color(0xFF543A54),
  trousers: Color(0xFF3A2E3A),
  hair: Color(0xFFCFC8B8),
  hat: Hat.sunhat,
  hatColor: Color(0xFFB99A6A),
  accessory: Accessory.pearls,
  accentA: Color(0xFFF5ECD9),
  expr: Expr.angry,
  facing: Facing.left,
  stocky: true,
);

// ---------------------------------------------------------------------------
// Comeback shorthands
// ---------------------------------------------------------------------------

Comeback _sbest(String text, String verdict, String note, {int rep = 120, int bottle = 1}) =>
    Comeback(text: text, quality: Quality.best, rep: rep, bottle: bottle, verdict: verdict, good: true, note: note);
Comeback _sdec(String text, String note, {int rep = 25, int bottle = 0}) =>
    Comeback(text: text, quality: Quality.decent, rep: rep, bottle: bottle, verdict: 'PSÉ.', good: false, note: note);
Comeback _sweak(String text, String note, {int rep = 10, int bottle = -1}) =>
    Comeback(text: text, quality: Quality.weak, rep: rep, bottle: bottle, verdict: 'FLOJO.', good: false, note: note);
Comeback _sgro(String text, String note, {int bottle = -2}) =>
    Comeback(text: text, quality: Quality.grovel, rep: 0, bottle: bottle, verdict: 'TE ACHANTASTE.', good: false, note: note);

// ---------------------------------------------------------------------------
// Zones
// ---------------------------------------------------------------------------

final List<Zone> _spanishZones = [
  // ============================ ESPAÑA ============================
  Zone(
    id: 'espana',
    name: 'ESPAÑA',
    tagline: 'Una plaza al atardecer. Aquí todo el mundo tiene una opinión... y un cuñado.',
    scene: SceneKey.plaza,
    encounters: [
      Encounter(
        npcName: 'EL CUÑAO',
        npc: _cunao,
        rounds: [
          Round(
            lead: [
              Line.npc('¡Hombre! Tú eres el que no sabe ni cambiar una rueda, ¿no?'),
              Line.you('...Perdona, ¿te conozco?'),
            ],
            insult: 'Da igual. Escúchame, que yo de esto sé un rato: eres un poco gilipollas, ¿no te lo han dicho? Con cariño, eh.',
            comebacks: [
              _sbest(
                'Con cariño te digo yo que llevas veinte minutos explicándome mi propia vida. Relaja el cuñadismo, campeón.',
                '¡TOMA!',
                'Le pones nombre a su vicio nacional: el «cuñadismo». (gilipollas = idiot/dickhead.) Nunca defiendas la acusación: devuélvela.',
              ),
              _sdec('Anda, cállate ya, listo.',
                  'Vale, pero es lo que espera. Un buen corte va contra ÉL en concreto, no un «cállate» genérico.'),
              _sweak('Gilipollas lo serás tú.',
                  'El clásico «no, tú». Te ha llevado y le has copiado. Marca tú el ritmo.'),
              _sgro('Perdona, tienes razón, no tengo ni idea.',
                  'Darle la razón al cuñao le acabas de hacer el día. Pierdes AGALLAS. (agallas = nerve/guts.)'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'LA VECINA',
        npc: _vecina,
        rounds: [
          Round(
            lead: [
              Line.npc('¡Chsss! Oye, tú. ¿Esas bolsas del súper las vas a dejar ahí?'),
              Line.you('Es mi rellano también, señora.'),
            ],
            insult: 'Encima respondón. En mis tiempos había más respeto. Menudo elemento estás hecho, hijo.',
            comebacks: [
              _sbest(
                'En sus tiempos también se fumaba en el hospital, doña Puri. El mundo cambia; el rellano lo comparto, la bronca no.',
                '¡OLÉ!',
                'Aceptas su «en mis tiempos» y lo giras con un absurdo del pasado. (elemento = a piece of work; respondón = cheeky/back-talking.)',
              ),
              _sdec('Que sí, señora, que sí.',
                  'El «que sí, que sí» resta, pero le dejas la última palabra. Remátalo con gracia.'),
              _sweak('No le he faltado al respeto.',
                  'Justificarte le confirma que su pulla ha entrado. Nunca le enseñes que te ha rozado.'),
              _sgro('Perdón, ahora mismo las quito, disculpe.',
                  'Recoger corriendo al primer bufido. Ya se lo cuenta a todo el bloque. Pierdes agallas.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'EL CAMARERO BORDE',
      npc: _camarero,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('¿Qué va a ser? Y rápido, que no tengo el día.')],
          insult: '¿Una caña y una tapa? Uf. Menudo fenómeno. ¿Algo más difícil, o lo dejamos ahí, jefe?',
          comebacks: [
            _sbest(
              'Una caña, una tapa, y una sonrisa tuya... aunque esa última veo que no está en la carta.',
              '¡BORDE VENCIDO!',
              'Le devuelves su borderío con una sonrisa. (borde = rude/surly.) Al camarero borde se le gana con arte, no con grito.',
              rep: 140, bottle: 1,
            ),
            _sdec('Qué simpático el servicio, oye.',
                'La ironía va bien, pero es la salida fácil. Un borde respeta el arte, no el bufido.', rep: 30),
            _sweak('Oye, un poco de por favor, ¿no?',
                'Pedir modales en un bar te marca como víctima. Éntrale con gracia.', bottle: -2),
            _sgro('Perdona, ¿mejor me lo pienso y vuelvo?',
                'Retirarte a «pensarlo» ante un borde es rendición. Pierdes agallas.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('*deja la caña de golpe* Aquí tienes. Otro que se cree gracioso.')],
          insult: 'Te crees muy majo tú, ¿eh? Aquí el gracioso soy yo.',
          comebacks: [
            _sbest(
              'Majo no, majísimo. Y encima te he dado tema de conversación para la cocina. De nada.',
              '¡PICO DE ORO!',
              'Aceptas «majo» (dicho con retintín) y lo subes de nivel sin perder la calma. Ganarle al borde es no alterarte jamás.',
              rep: 200, bottle: 2,
            ),
            _sdec('Gracioso y con propina. Piénsatelo.',
                'El toque de la propina está bien, pero le dejas escapar en el golpe final. Remata con clase.', rep: 40),
            _sweak('Tú sí que te lo tienes creído.',
                '«No, tú» otra vez. En la última ronda hay que cerrar, no empatar.', bottle: -1),
            _sgro('Vale, vale, me callo, no quiero problemas.',
                'Callarte a la orden delante del bar entero le da el bar. Pierdes agallas.', bottle: -3),
          ],
        ),
      ],
    ),
  ),

  // ============================ MÉXICO ============================
  Zone(
    id: 'mexico',
    name: 'MÉXICO',
    tagline: 'El mercado y la cantina. Aquí se albura con cariño... y sin piedad.',
    scene: SceneKey.cantina,
    encounters: [
      Encounter(
        npcName: 'EL PUESTERO',
        npc: _puestero,
        rounds: [
          Round(
            lead: [
              Line.npc('¡Pásele, pásele, marchante! ¿Qué va a llevar, güey?'),
              Line.you('Solo estoy viendo, gracias.'),
            ],
            insult: 'Ah, nada más viene a mirar. Típico. No sea codo, no mames. ¿A poco no trae ni pa\'l chesco?',
            comebacks: [
              _sbest(
                'Traigo pa\'l chesco y pa\' tu renta, jefe. Lo que no traigo es ganas de que me vendas mango a precio de iPhone.',
                '¡ÓRALE!',
                'Le sigues el juego y le clavas el sobreprecio. (codo = stingy; no mames = no way / come off it.) En el mercado se regatea con risa.',
              ),
              _sdec('No ando comprando, gracias güey.',
                  'Está bien, pero le concediste el «codo». Nunca defiendas el cargo: voltéalo.'),
              _sweak('No soy codo.',
                  'Negar la acusación te pone a la defensiva. Él ya ganó el volumen.'),
              _sgro('Ah, pos... deme unos mangos, ¿no?',
                  'Comprar por pena, y encima caro. Adiós cartera y agallas. (agallas = nerve.)'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'LA DOÑA',
        npc: _dona,
        rounds: [
          Round(
            lead: [
              Line.npc('Oiga, joven. ¿Ese es su carrito, el que dejó en media banqueta?'),
              Line.you('Ahorita lo muevo, doña.'),
            ],
            insult: 'Ahorita, ahorita. Ustedes los chavos son bien sangrones. En mis tiempos se saludaba, no se andaba de naco.',
            comebacks: [
              _sbest(
                'Buenas tardes, doña, con mucho gusto... ¿ve qué fácil? Ya saludamos los dos. Y el carrito ya se movió, sin sermón incluido.',
                '¡CHINGÓN!',
                'Le das el saludo que exige y desarmas el sermón con clase. (sangrón = obnoxious; naco = tacky / low-class.)',
              ),
              _sdec('Ya voy, doña, ya voy.',
                  'El «ya voy» resta pero le dejas el último regaño. Ciérralo con gracia.'),
              _sweak('No soy naco, ¿eh?',
                  'Repetir su palabra a la defensiva le confirma que pegó. No se lo enseñes.'),
              _sgro('Perdón, perdón, tiene toda la razón, qué pena.',
                  'Deshacerte en disculpas por un carrito. Ya lo anda contando en el mercado. Pierdes agallas.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'EL CABRÓN DE LA CANTINA',
      npc: _cabron,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*te mira de arriba a abajo* ¿Y este quién es, pues?')],
          insult: 'Llegas a MI cantina y ni saludas. Estás bien pendejo, ¿no, güey?',
          comebacks: [
            _sbest(
              'Pendejo el que lleva veinte años calentando la misma silla y le dice "mi cantina". Es del señor de la barra, compa. Salud.',
              '¡NO MAMES!',
              'Le tumbas el "mi cantina" con un dato y brindas. (pendejo = idiot / dumbass; güey = dude / mate.) Nunca muerdas el reto: descríbelo.',
              rep: 150, bottle: 1,
            ),
            _sdec('Cálmate, apenas voy llegando, cabrón.',
                'El tono va bien pero es genérico. Amárralo a ÉL y pega el doble.', rep: 35),
            _sweak('Pendejo tú, güey.',
                'El "no, tú" de siempre. Él marcó, tú copiaste. Marca tú.', bottle: -2),
            _sgro('Perdón, perdón, ya me voy, no quiero broncas.',
                'Anunciarle miedo al bravucón es justo lo que buscaba. Pierdes agallas.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('*se ríe* ¡Ah, salió respondón el chavo!')],
          insult: 'Aquí el chistoso soy yo, ¿eh? ¿Qué vas a hacer, pues?',
          comebacks: [
            _sbest(
              '¿Yo? Nada, güey. Me tomo mi chela y disfruto la tarde. Tú necesitas bronca para sentir algo; yo ya estoy a gusto. Ahí está la diferencia.',
              '¡PICO DE ORO!',
              'Desenganchas tu tranquilidad de su pleito: lo único que un bravucón no sabe contestar. La calma es el mejor albur.',
              rep: 200, bottle: 2,
            ),
            _sdec('Nada, cabrón, seguir aquí tan tranquilo.',
                'La calma está bien pero plana. Enséñale que ÉL es el que necesita el pleito.', rep: 40),
            _sweak('Uy, qué miedo, ¿no?',
                'El sarcasmo fácil aún acepta su marco de amenaza. Quítale el pleito entero.', bottle: -1),
            _sgro('Nada, nada, tú mandas, aquí tranquilo.',
                'Decirle "tú mandas" es sangre en el agua. Pierdes agallas.', bottle: -2),
          ],
        ),
      ],
    ),
  ),

  // ============================ ARGENTINA ============================
  Zone(
    id: 'argentina',
    name: 'ARGENTINA',
    tagline: 'Un asado entre supuestos amigos. Alguien te va a psicoanalizar, sí o sí.',
    scene: SceneKey.parrilla,
    encounters: [
      Encounter(
        npcName: 'EL ASADOR',
        npc: _asador,
        rounds: [
          Round(
            lead: [
              Line.npc('Che, ¿vos entendés algo de asado o venís solo a comer, boludo?'),
              Line.you('Vengo a comer, la verdad.'),
            ],
            insult: 'Se nota. Mirá cómo estás parado al lado del fuego, como un pelotudo. Andá a traer el vino y no toques nada.',
            comebacks: [
              _sbest(
                'Tranquilo, maestro. Vos cuidá la carne, que es lo único que te sale sin joder a alguien. Yo traigo el vino y la charla.',
                '¡GENIO!',
                'Aceptás el mandado y le marcás que lo único que le sale es el asado. (boludo / pelotudo = idiot; che = hey / mate.)',
              ),
              _sdec('Pará un poco, recién llego, che.',
                  'Está bien pero genérico. Metele algo del asado y lo tenés.'),
              _sweak('Pelotudo serás vos.',
                  'El "no, vos" de manual. Él arrancó, vos copiaste.'),
              _sgro('Perdón, tenés razón, no sé nada, decime qué hago.',
                  'Pedirle instrucciones al toque le da el poder. Perdés agallas. (agallas = nerve.)'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'EL PORTEÑO',
        npc: _porteno,
        rounds: [
          Round(
            lead: [
              Line.npc('¿Sabés cuál es tu problema? Te lo digo porque lo veo clarito.'),
              Line.you('No te pedí un diagnóstico.'),
            ],
            insult: 'Y ahí está: sos un reprimido. Necesitás terapia, che. Pero de la buena, no cualquiera.',
            comebacks: [
              _sbest(
                'Diez minutos hablando de MI cabeza para no mirar la tuya. Guardate el diván, Freud, que el que se escapa de algo acá sos vos.',
                '¡CRACK!',
                'Le devolvés su propio psicoanálisis: el que analiza a todos evita mirarse. (chamuyero = smooth-talking BS-er; reprimido = repressed.)',
              ),
              _sdec('Guardate el análisis, che.',
                  'Buena idea pero corta. Mostrale que el análisis es SU escape y lo cerrás.'),
              _sweak('El reprimido serás vos.',
                  '"No, vos" otra vez. Marcá vos, no copies.'),
              _sgro('Y... capaz tenés razón, debería ir a terapia.',
                  'Darle la razón al chamuyero es regalarle el escenario. Perdés agallas.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'EL HINCHA',
      npc: _hinchaAr,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*te ve la remera* Ah, mirá lo que tenemos acá.')],
          insult: 'Vos sos de esos que miran los partidos por la tele, ¿no? Un pecho frío. No tenés aguante, che.',
          comebacks: [
            _sbest(
              '¿Aguante? Viniste a un asado a buscar pelea con un desconocido. Yo estoy comiendo un choripán espectacular. Adiviná quién la está pasando mejor.',
              '¡DE ZURDA!',
              'Le das vuelta el "aguante": el que necesita pelear para sentirse vivo es él. (pecho frío = gutless; cholulo = poser.)',
              rep: 150, bottle: 1,
            ),
            _sdec('Aguante tengo, tranquilo.',
                'Jurar "aguante tengo" es lo que diría un cholulo. Mostralo, no lo jures.', rep: 35),
            _sweak('Pecho frío será tu viejo.',
                'Meter a la familia sin gracia es de amateur. Apuntá a lo que dijo él.', bottle: -2),
            _sgro('Y bueno, sí, más de la tele que de la cancha.',
                'Confesarle al hincha justo su pecado. Perdés agallas.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('¡Uh, salió respondón el pecho frío!')],
          insult: '¿Y si te la agarro cuando salgas, eh? ¿Qué hacés, boludo?',
          comebacks: [
            _sbest(
              'Nada, che. Sigo comiendo. Mirá: vos necesitás que gane tu equipo para estar bien; yo estoy bien y el partido ni empezó. Esa es la diferencia entre vos y yo.',
              '¡PICO DE ORO!',
              'Desenganchás tu humor del resultado y de su amenaza: lo único que un picante no sabe contestar. La calma es el aguante de verdad.',
              rep: 200, bottle: 2,
            ),
            _sdec('Nada, che, seguir tranquilo acá.',
                'La calma está pero plana. Mostrale que ÉL depende del resultado, no vos.', rep: 40),
            _sweak('Uy, qué miedo me das.',
                'El sarcasmo fácil todavía le compra la amenaza. Sacale el partido entero.', bottle: -1),
            _sgro('Pará, pará, ganaste, sos un grande.',
                'Decirle "sos un grande" para zafar es sangre en el agua. Perdés agallas.', bottle: -2),
          ],
        ),
      ],
    ),
  ),

  // ============================ CHILE ============================
  Zone(
    id: 'chile',
    name: 'CHILE',
    tagline: 'La feria a los pies de la cordillera. Si cachái el chilenismo, sobrevivís.',
    scene: SceneKey.feria,
    encounters: [
      Encounter(
        npcName: 'EL FERIANTE',
        npc: _feriante,
        rounds: [
          Round(
            lead: [
              Line.npc('¡Caseritaaa! Llévese el kilo, ¡a luca no más, po!'),
              Line.you('Solo estoy mirando, gracias.'),
            ],
            insult: '¿Puro mirar? Ya po, no seai fome. Se nota que soi medio penca pa\' comprar, cachái.',
            comebacks: [
              _sbest(
                'Penca el tomate que me querís vender a precio de restorán, casero. Cuando bajen los precios, hablamos, ¿ya po?',
                '¡LA RAJA!',
                'Le devolvés el "penca" apuntando a su fruta y su precio. (fome = boring / lame; penca = useless / lame; cachái = you get me?)',
              ),
              _sdec('No ando comprando, gracias.',
                  'Está bien pero le dejaste el "penca". Nunca defiendas el cargo: dalo vuelta.'),
              _sweak('Penca serái tú.',
                  'El "no, tú" de siempre. Marca tú el tono.'),
              _sgro('Ya po, deme un kilo entonces.',
                  'Comprar por pena, y caro. Chao plata y agallas. (agallas = nerve.)'),
            ],
          ),
        ],
      ),
      Encounter(
        npcName: 'EL FLAITE',
        npc: _flaite,
        rounds: [
          Round(
            lead: [
              Line.npc('Ey, ey. ¿Qué te pasa a ti? ¿Andái mirando en menos, o qué?'),
              Line.you('Iba pasando no más, hermano.'),
            ],
            insult: '¿"Hermano"? No te hagai el simpático, weón. Andái too pesao. ¿Erís sapo o qué?',
            comebacks: [
              _sbest(
                'Sapo cero, weón, si ni te conozco. Vai tan a la defensiva que hasta cansa. Relájate, que la calle es de todos.',
                '¡BACÁN!',
                'No entrái en la agresión y le marcái la paranoia. (weón = dude / idiot según el tono; pesao = arrogant / annoying; sapo = nosy / snitch.)',
              ),
              _sdec('Iba pasando no más, tranquilo.',
                  'Repetir "iba pasando" te deja a la defensiva. Dalo vuelta hacia él.'),
              _sweak('Pesao serái tú, weón.',
                  '"No, tú". Te llevó y copiaste. Marca tú el tono.'),
              _sgro('Ya, ya, disculpa, no quiero problemas, hermano.',
                  'Achantarte al tiro con el flaite es justo lo que buscaba. Perdís agallas.'),
            ],
          ),
        ],
      ),
    ],
    boss: Encounter(
      npcName: 'LA CASERA',
      npc: _casera,
      isBoss: true,
      rounds: [
        Round(
          lead: [Line.npc('*te apunta con el dedo* A ver, mijito. ¿Vai a comprar o vai a puro webiar?')],
          insult: 'Llevái media hora dando vueltas como sapo. Erís más fome que domingo lluvioso, cabro.',
          comebacks: [
            _sbest(
              'Fome será el domingo, casera, pero usté lleva media hora vigilándome a MÍ en vez de vender. Parece que la entretengo, ¿ah?',
              '¡CUÁTICO!',
              'Le das vuelta la vigilancia: la entretenida es ella. (webiar = to mess about; fome = dull / lame; sapo = nosy.)',
              rep: 150, bottle: 1,
            ),
            _sdec('Ya po, casera, ando mirando no más.',
                'El "ando mirando" resta pero le dejái el último reto. Ciérralo con gracia.', rep: 35),
            _sweak('Oiga, no sea pesá.',
                'Pedirle modales a la casera te deja de cabro chico. Éntrale con calle.', bottle: -2),
            _sgro('Perdón, perdón, ya me voy, disculpe.',
                'Arrancar de la casera es la rendición que esperaba. Perdís agallas.', bottle: -2),
          ],
        ),
        Round(
          lead: [Line.npc('*se ríe fuerte* ¡Ah! ¡Salió con boca el cabro!')],
          insult: 'Aquí la reina de la feria soy yo, ¿ya? ¿Y ahora qué vai a hacer, mijito?',
          comebacks: [
            _sbest(
              'Nada, casera. Comprarle un kilo de paltas y desearle buen día. Usté necesita pelea pa\' pasarlo bien; yo ya lo estoy pasando la raja. Ahí está la diferencia.',
              '¡PICO DE ORO!',
              'Desenganchái tu buena onda de su pelea, y encima le comprái. Le ganái a la reina de la feria con calma. (la raja = great / awesome.)',
              rep: 200, bottle: 2,
            ),
            _sdec('Nada po, comprarle no más, tranquilo.',
                'La calma va, pero plana. Mostrale que la que necesita pelea es ella.', rep: 40),
            _sweak('Uy, qué miedo, la reina.',
                'El sarcasmo fácil todavía le compra el trono. Quítale la pelea entera.', bottle: -1),
            _sgro('Ya, ya, usté manda, casera.',
                'Decirle "usté manda" pa\' zafar es sangre en el agua. Perdís agallas.', bottle: -3),
          ],
        ),
      ],
    ),
  ),
];

final Game spanishGame = Game(
  id: 'spanish',
  titleLine1: 'CUIDA ESA',
  titleLine2: 'BOCA',
  tileLabel: 'Español',
  subtitle: 'UN SIMULADOR DE MALA LECHE',
  selectBlurb: 'Plántale cara a media España, México, Argentina y Chile.',
  accent: Color(0xFFF04E23),
  avatar: _cunao,
  player: spanishPlayer,
  zones: _spanishZones,
  strings: spanishStrings,
);
