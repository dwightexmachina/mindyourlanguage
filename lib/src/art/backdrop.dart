import '../content/models.dart';

/// Full-bleed scene backdrops (viewBox 1600x900) in Terry Gilliam cut-out
/// collage style: an aged-paper page with flat, ink-edged cut-out props and a
/// few scalloped paper clouds. One per zone.

const _ink = 'stroke="#2A1E10" stroke-width="4" stroke-linejoin="round"';
const _ink2 = 'stroke="#2A1E10" stroke-width="3"';

/// A scalloped cut-out cloud with a hard offset shadow.
String _cloud(double x, double y, double s) {
  const path = 'M0 20 q-4 -20 18 -20 q6 -16 26 -10 q10 -14 28 -4 q22 -6 22 14 '
      'q16 2 12 16 q4 14 -14 14 l-104 0 q-16 0 -12 -14 z';
  return '<g transform="translate($x,$y) scale($s)">'
      '<path d="$path" transform="translate(6,6)" fill="#241a0e" opacity="0.16"/>'
      '<path d="$path" fill="#EFE6CC" $_ink2/></g>';
}

String _wrap(String body) =>
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1600 900">'
    '<rect width="1600" height="900" fill="#E7D6AE"/>$body</svg>';

String backdropSvg(SceneKey key) {
  switch (key) {
    case SceneKey.highStreet:
      return _highStreet;
    case SceneKey.pub:
      return _pub;
    case SceneKey.footy:
      return _footy;
    case SceneKey.dinner:
      return _dinner;
    case SceneKey.plaza:
      return _plaza;
    case SceneKey.cantina:
      return _cantina;
    case SceneKey.parrilla:
      return _parrilla;
    case SceneKey.feria:
      return _feria;
    case SceneKey.berlin:
      return _berlin;
    case SceneKey.biergarten:
      return _biergarten;
    case SceneKey.ruhrpott:
      return _ruhrpott;
    case SceneKey.hafen:
      return _hafen;
    case SceneKey.kafeneio:
      return _kafeneio;
    case SceneKey.laiki:
      return _laiki;
    case SceneKey.gipedo:
      return _gipedo;
    case SceneKey.trapezi:
      return _trapezi;
  }
}

// ---- British ----

final _highStreet = _wrap('''
  <defs><linearGradient id="hs" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#9FB6C2"/><stop offset="1" stop-color="#D8C7A0"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="640" fill="url(#hs)"/>
  <circle cx="1200" cy="210" r="80" fill="#E8C765" $_ink2/>
  ${_cloud(160, 150, 1.4)} ${_cloud(560, 110, 1.1)} ${_cloud(980, 170, 1.2)}
  <rect x="0" y="636" width="1600" height="264" fill="#B98A52" $_ink/>
  <!-- terraced shopfronts as cut-outs -->
  <g>
    <rect x="60" y="330" width="250" height="312" fill="#8C5A6A" $_ink/>
    <rect x="330" y="290" width="230" height="352" fill="#6E5A8C" $_ink/>
    <rect x="580" y="350" width="210" height="292" fill="#5A7A6E" $_ink/>
    <rect x="1000" y="300" width="250" height="342" fill="#7A6A9C" $_ink/>
    <rect x="1270" y="345" width="270" height="297" fill="#8C6A52" $_ink/>
  </g>
  <g fill="#E8C765" $_ink2>
    <rect x="100" y="360" width="52" height="66"/><rect x="180" y="360" width="52" height="66"/>
    <rect x="370" y="330" width="54" height="70"/><rect x="460" y="330" width="54" height="70"/>
    <rect x="1030" y="340" width="54" height="70"/><rect x="1120" y="340" width="54" height="70"/>
    <rect x="1320" y="380" width="54" height="66"/><rect x="1410" y="380" width="54" height="66"/>
  </g>
  <!-- pub sign -->
  <g><rect x="840" y="360" width="150" height="90" rx="4" fill="#38502E" $_ink/>
    <text x="915" y="398" text-anchor="middle" fill="#E8C765" font-family="Fredericka,serif" font-size="28">THE</text>
    <text x="915" y="430" text-anchor="middle" fill="#E8C765" font-family="Fredericka,serif" font-size="26">RED LION</text></g>
  <!-- postbox -->
  <g><rect x="720" y="516" width="50" height="126" rx="16" fill="#B23A2A" $_ink/>
    <rect x="728" y="552" width="34" height="8" rx="3" fill="#3a0e0e"/></g>
  <!-- lamp -->
  <g><rect x="1524" y="360" width="12" height="282" fill="#3a2a18" $_ink2/>
    <circle cx="1530" cy="352" r="20" fill="#F2D98A" $_ink2/></g>
''');

final _pub = _wrap('''
  <rect x="0" y="0" width="1600" height="700" fill="#5A3A22"/>
  <rect x="0" y="636" width="1600" height="264" fill="#3E2A18" $_ink/>
  <g stroke="#2a1a0e" stroke-width="5" opacity="0.5">
    <line x1="0" y1="360" x2="1600" y2="360"/><line x1="0" y1="500" x2="1600" y2="500"/>
    <line x1="300" y1="360" x2="300" y2="636"/><line x1="800" y1="360" x2="800" y2="636"/><line x1="1300" y1="360" x2="1300" y2="636"/>
  </g>
  <circle cx="400" cy="150" r="120" fill="#7a5028" opacity="0.5"/>
  <circle cx="1200" cy="150" r="120" fill="#7a5028" opacity="0.5"/>
  <!-- hanging lamps -->
  <g><rect x="360" y="90" width="8" height="66" fill="#2a1a0e"/><path d="M330 156 h68 l-12 40 h-44 z" fill="#8a4a1c" $_ink2/></g>
  <g><rect x="1160" y="90" width="8" height="66" fill="#2a1a0e"/><path d="M1130 156 h68 l-12 40 h-44 z" fill="#8a4a1c" $_ink2/></g>
  <!-- dartboard -->
  <g><circle cx="800" cy="230" r="74" fill="#38502E" $_ink/>
    <circle cx="800" cy="230" r="46" fill="#6E8A3A" $_ink2/>
    <circle cx="800" cy="230" r="20" fill="#B23A2A" $_ink2/>
    <line x1="726" y1="230" x2="874" y2="230" stroke="#2a1a0e" stroke-width="3"/>
    <line x1="800" y1="156" x2="800" y2="304" stroke="#2a1a0e" stroke-width="3"/></g>
  <!-- bottle shelf -->
  <g><rect x="1360" y="330" width="190" height="300" fill="#2a1a0e" $_ink/>
    <g fill="#8a6a3a" $_ink2>
      <rect x="1380" y="352" width="30" height="72" rx="5"/><rect x="1420" y="352" width="30" height="72" rx="5"/>
      <rect x="1460" y="352" width="30" height="72" rx="5"/><rect x="1500" y="352" width="30" height="72" rx="5"/>
      <rect x="1380" y="446" width="30" height="72" rx="5"/><rect x="1420" y="446" width="30" height="72" rx="5"/>
      <rect x="1460" y="446" width="30" height="72" rx="5"/><rect x="1500" y="446" width="30" height="72" rx="5"/></g></g>
''');

final _footy = _wrap('''
  <defs><linearGradient id="ft" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#8AA0AE"/><stop offset="1" stop-color="#B7C2C0"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="520" fill="url(#ft)"/>
  ${_cloud(240, 120, 1.2)} ${_cloud(1080, 100, 1.3)}
  <rect x="0" y="300" width="1600" height="230" fill="#8C7A9C" $_ink/>
  <g stroke="#2A1E10" stroke-width="3" opacity="0.5">
    <line x1="0" y1="360" x2="1600" y2="360"/><line x1="0" y1="420" x2="1600" y2="420"/><line x1="0" y1="480" x2="1600" y2="480"/></g>
  <g $_ink2>
    <g fill="#B23A2A"><circle cx="140" cy="335" r="9"/><circle cx="420" cy="332" r="9"/><circle cx="900" cy="336" r="9"/><circle cx="1360" cy="333" r="9"/></g>
    <g fill="#E8C765"><circle cx="280" cy="392" r="9"/><circle cx="620" cy="388" r="9"/><circle cx="980" cy="392" r="9"/><circle cx="1220" cy="389" r="9"/></g>
    <g fill="#6E8A3A"><circle cx="200" cy="450" r="9"/><circle cx="520" cy="452" r="9"/><circle cx="1040" cy="448" r="9"/><circle cx="1300" cy="452" r="9"/></g></g>
  <!-- floodlights -->
  <g><rect x="150" y="120" width="12" height="190" fill="#3a2a18" $_ink2/>
    <rect x="108" y="86" width="96" height="42" rx="5" fill="#4a3a22" $_ink2/>
    <g fill="#F2D98A"><circle cx="130" cy="100" r="6"/><circle cx="156" cy="100" r="6"/><circle cx="182" cy="100" r="6"/><circle cx="130" cy="116" r="6"/><circle cx="156" cy="116" r="6"/><circle cx="182" cy="116" r="6"/></g></g>
  <g><rect x="1438" y="120" width="12" height="190" fill="#3a2a18" $_ink2/>
    <rect x="1396" y="86" width="96" height="42" rx="5" fill="#4a3a22" $_ink2/>
    <g fill="#F2D98A"><circle cx="1418" cy="100" r="6"/><circle cx="1444" cy="100" r="6"/><circle cx="1470" cy="100" r="6"/><circle cx="1418" cy="116" r="6"/><circle cx="1444" cy="116" r="6"/><circle cx="1470" cy="116" r="6"/></g></g>
  <rect x="0" y="520" width="1600" height="380" fill="#6E8A3A" $_ink/>
  <rect x="0" y="520" width="1600" height="380" fill="#5E7A30" opacity="0" />
  <g stroke="#EFE6CC" stroke-width="4" opacity="0.6"><line x1="60" y1="560" x2="60" y2="880"/><line x1="0" y1="700" x2="1600" y2="700"/></g>
''');

final _dinner = _wrap('''
  <rect x="0" y="0" width="1600" height="700" fill="#3A2E42"/>
  <rect x="0" y="470" width="1600" height="170" fill="#2E243A" $_ink/>
  <rect x="0" y="636" width="1600" height="264" fill="#5A3A28" $_ink/>
  <g $_ink2 fill="none" stroke="#5a4a6a">
    <rect x="60" y="500" width="180" height="90"/><rect x="300" y="500" width="180" height="90"/>
    <rect x="1120" y="500" width="180" height="90"/><rect x="1360" y="500" width="180" height="90"/></g>
  <!-- chandelier -->
  <rect x="796" y="0" width="8" height="120" fill="#8a6a2a"/>
  <g fill="#C9A24A" $_ink2><ellipse cx="800" cy="150" rx="72" ry="16"/>
    <circle cx="740" cy="150" r="9"/><circle cx="770" cy="164" r="9"/><circle cx="800" cy="170" r="9"/><circle cx="830" cy="164" r="9"/><circle cx="860" cy="150" r="9"/></g>
  <!-- framed portrait -->
  <g><rect x="200" y="180" width="180" height="220" rx="4" fill="#241a2a" $_ink/>
    <rect x="212" y="192" width="156" height="196" fill="#5a4a38"/>
    <circle cx="290" cy="270" r="40" fill="#8a6a4a" $_ink2/><rect x="250" y="322" width="80" height="66" fill="#3a2a44"/></g>
  <!-- window + drapes -->
  <g><rect x="1180" y="150" width="240" height="300" rx="4" fill="#4a5a6a" $_ink/>
    <rect x="1160" y="140" width="40" height="320" fill="#7A2E3A" $_ink2/><rect x="1400" y="140" width="40" height="320" fill="#7A2E3A" $_ink2/>
    <line x1="1300" y1="150" x2="1300" y2="450" stroke="#2A1E10" stroke-width="4"/></g>
''');

// ---- Spanish ----

final _plaza = _wrap('''
  <defs><linearGradient id="pl" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#A9C0CE"/><stop offset="1" stop-color="#E8C98A"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="640" fill="url(#pl)"/>
  <circle cx="1180" cy="220" r="86" fill="#F2C765" $_ink2/>
  ${_cloud(220, 130, 1.3)} ${_cloud(700, 100, 1.0)}
  <rect x="0" y="636" width="1600" height="264" fill="#C89B63" $_ink/>
  <g>
    <rect x="40" y="300" width="360" height="336" fill="#C86B3C" $_ink/>
    <rect x="420" y="250" width="360" height="386" fill="#A85230" $_ink/>
    <rect x="1040" y="280" width="330" height="356" fill="#C86B3C" $_ink/>
    <rect x="1200" y="250" width="360" height="386" fill="#9A4A2A" $_ink/></g>
  <g fill="#5A3018" $_ink2>
    <rect x="90" y="350" width="60" height="94" rx="3"/><rect x="200" y="350" width="60" height="94" rx="3"/>
    <rect x="470" y="320" width="60" height="94" rx="3"/><rect x="600" y="320" width="60" height="94" rx="3"/>
    <rect x="1090" y="340" width="60" height="94" rx="3"/><rect x="1260" y="330" width="60" height="94" rx="3"/></g>
  <!-- cafe awning -->
  <g><rect x="820" y="468" width="200" height="22" fill="#7a2020" $_ink2/>
    <g $_ink2><rect x="820" y="490" width="25" height="36" fill="#B23A2A"/><rect x="845" y="490" width="25" height="36" fill="#E8C765"/>
    <rect x="870" y="490" width="25" height="36" fill="#B23A2A"/><rect x="895" y="490" width="25" height="36" fill="#E8C765"/>
    <rect x="920" y="490" width="25" height="36" fill="#B23A2A"/><rect x="945" y="490" width="25" height="36" fill="#E8C765"/>
    <rect x="970" y="490" width="25" height="36" fill="#B23A2A"/><rect x="995" y="490" width="25" height="36" fill="#E8C765"/></g></g>
  <!-- fountain -->
  <g><ellipse cx="800" cy="640" rx="130" ry="26" fill="#8FA9B8" $_ink/>
    <rect x="792" y="560" width="16" height="80" fill="#8FA9B8"/><ellipse cx="800" cy="558" rx="34" ry="10" fill="#B9D2DE" $_ink2/></g>
''');

final _cantina = _wrap('''
  <defs><linearGradient id="ca" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#A9C0CE"/><stop offset="1" stop-color="#E8A86A"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="636" fill="url(#ca)"/>
  ${_cloud(300, 120, 1.2)} ${_cloud(1050, 150, 1.0)}
  <rect x="0" y="636" width="1600" height="264" fill="#7A4A2A" $_ink/>
  <rect x="0" y="300" width="520" height="336" fill="#D9557A" $_ink/>
  <rect x="520" y="330" width="520" height="306" fill="#2E9B94" $_ink/>
  <rect x="1040" y="300" width="560" height="336" fill="#E0803A" $_ink/>
  <g fill="#7a2a44" $_ink2><rect x="90" y="360" width="70" height="112" rx="3"/><rect x="240" y="360" width="70" height="112" rx="3"/><rect x="390" y="360" width="70" height="112" rx="3"/></g>
  <g fill="#1c6a64" $_ink2><rect x="600" y="390" width="70" height="112" rx="3"/><rect x="770" y="390" width="70" height="112" rx="3"/><rect x="920" y="390" width="70" height="112" rx="3"/></g>
  <!-- CANTINA sign -->
  <g><rect x="690" y="250" width="220" height="72" rx="4" fill="#2a1810" $_ink/>
    <text x="800" y="302" text-anchor="middle" fill="#E8C765" font-family="Fredericka,serif" font-size="40">CANTINA</text></g>
  <!-- papel picado -->
  <g><path d="M0 210 Q800 250 1600 210" stroke="#5a4a2a" stroke-width="3" fill="none"/>
    <g $_ink2><path d="M80 214 h48 l-24 34 z" fill="#B23A2A"/><path d="M200 218 h48 l-24 34 z" fill="#E8C765"/>
    <path d="M320 220 h48 l-24 34 z" fill="#2E9B94"/><path d="M560 222 h48 l-24 34 z" fill="#5A7DE0"/>
    <path d="M800 222 h48 l-24 34 z" fill="#B23A2A"/><path d="M1040 220 h48 l-24 34 z" fill="#E8C765"/>
    <path d="M1280 216 h48 l-24 34 z" fill="#2E9B94"/><path d="M1440 214 h48 l-24 34 z" fill="#5A7DE0"/></g></g>
  <!-- cactus -->
  <g $_ink2><rect x="1330" y="470" width="34" height="150" rx="14" fill="#3E7D4A"/>
    <rect x="1290" y="510" width="26" height="70" rx="12" fill="#3E7D4A"/><rect x="1364" y="490" width="26" height="80" rx="12" fill="#3E7D4A"/></g>
''');

final _parrilla = _wrap('''
  <rect x="0" y="0" width="1600" height="636" fill="#4A5A6A"/>
  ${_cloud(260, 110, 1.1)}
  <rect x="0" y="200" width="1600" height="436" fill="#8C5238" $_ink/>
  <g stroke="#2A1E10" stroke-width="4" opacity="0.4">
    <line x1="0" y1="290" x2="1600" y2="290"/><line x1="0" y1="380" x2="1600" y2="380"/><line x1="0" y1="470" x2="1600" y2="470"/><line x1="0" y1="560" x2="1600" y2="560"/></g>
  <rect x="0" y="636" width="1600" height="264" fill="#3A2E24" $_ink/>
  <!-- fairy lights -->
  <path d="M0 220 Q800 300 1600 220" stroke="#2a1a0e" stroke-width="3" fill="none"/>
  <g fill="#F2D98A" $_ink2><circle cx="180" cy="256" r="8"/><circle cx="500" cy="278" r="8"/><circle cx="820" cy="284" r="8"/><circle cx="1140" cy="272" r="8"/><circle cx="1420" cy="252" r="8"/></g>
  <!-- parrilla grill -->
  <g transform="translate(1240 470)">
    <rect x="0" y="60" width="220" height="80" rx="6" fill="#2a2a2a" $_ink/>
    <rect x="10" y="36" width="200" height="26" rx="4" fill="#1a1a1a" $_ink2/>
    <g fill="#E2662F" $_ink2><rect x="40" y="42" width="34" height="14" rx="3"/><rect x="100" y="42" width="38" height="14" rx="3"/><rect x="160" y="42" width="28" height="14" rx="3"/></g>
    <rect x="34" y="140" width="14" height="64" fill="#1a1a1a"/><rect x="172" y="140" width="14" height="64" fill="#1a1a1a"/></g>
  <!-- wine + crate -->
  <g transform="translate(120 470)"><rect x="0" y="70" width="130" height="96" fill="#8a5a34" $_ink/>
    <rect x="44" y="0" width="24" height="82" rx="5" fill="#5a1020" $_ink2/><path d="M84 40 h32 l-6 36 h-20 z" fill="#7a1e34" $_ink2/></g>
''');

final _feria = _wrap('''
  <defs><linearGradient id="fe" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#A9C6DA"/><stop offset="1" stop-color="#E3D2A8"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="640" fill="url(#fe)"/>
  ${_cloud(360, 90, 1.1)} ${_cloud(1120, 120, 1.0)}
  <!-- Andes -->
  <path d="M0 430 L220 220 L360 350 L560 170 L760 370 L980 190 L1200 370 L1400 230 L1600 410 L1600 640 L0 640 Z" fill="#8C93A6" $_ink/>
  <path d="M560 170 L520 220 L600 220 Z M980 190 L940 242 L1020 242 Z M220 220 L188 262 L252 262 Z" fill="#EFE6CC"/>
  <rect x="0" y="636" width="1600" height="264" fill="#8A7A5A" $_ink/>
  <!-- stalls -->
  <g><rect x="80" y="360" width="360" height="26" fill="#2E7D5A" $_ink2/>
    <path d="M80 386 h360 v40 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 z" fill="#2E7D5A" $_ink2/>
    <rect x="90" y="426" width="8" height="180" fill="#5a4e38"/><rect x="422" y="426" width="8" height="180" fill="#5a4e38"/>
    <rect x="80" y="520" width="360" height="90" fill="#6E5A3A" $_ink2/></g>
  <g><rect x="1160" y="360" width="360" height="26" fill="#C1442F" $_ink2/>
    <path d="M1160 386 h360 v40 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 l-30 18 l-30 -18 z" fill="#C1442F" $_ink2/>
    <rect x="1170" y="426" width="8" height="180" fill="#5a4e38"/><rect x="1502" y="426" width="8" height="180" fill="#5a4e38"/>
    <rect x="1160" y="520" width="360" height="90" fill="#6E5A3A" $_ink2/></g>
  <!-- crates -->
  <g $_ink2><rect x="120" y="540" width="120" height="64" fill="#8a6a3a"/>
    <g fill="#B23A2A"><circle cx="150" cy="546" r="12"/><circle cx="180" cy="546" r="12"/><circle cx="210" cy="546" r="12"/></g>
    <rect x="1200" y="540" width="120" height="64" fill="#8a6a3a"/>
    <g fill="#6E8A3A"><circle cx="1230" cy="546" r="12"/><circle cx="1260" cy="546" r="12"/><circle cx="1290" cy="546" r="12"/></g></g>
''');

// ---- German ----

final _berlin = _wrap('''
  <defs><linearGradient id="be" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#9AAAB6"/><stop offset="1" stop-color="#CBBE9E"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="640" fill="url(#be)"/>
  ${_cloud(240, 130, 1.2)} ${_cloud(1000, 110, 1.1)}
  <rect x="0" y="636" width="1600" height="264" fill="#6E6A66" $_ink/>
  <!-- Fernsehturm -->
  <g><rect x="792" y="150" width="16" height="486" fill="#8A8680" $_ink2/>
    <circle cx="800" cy="210" r="42" fill="#B23A2A" $_ink/>
    <circle cx="800" cy="210" r="20" fill="#E8C765" $_ink2/>
    <rect x="795" y="90" width="10" height="60" fill="#8A8680"/></g>
  <!-- grey Plattenbau blocks -->
  <g>
    <rect x="60" y="320" width="300" height="316" fill="#7A8896" $_ink/>
    <rect x="380" y="280" width="300" height="356" fill="#69707C" $_ink/>
    <rect x="1000" y="300" width="280" height="336" fill="#77838F" $_ink/>
    <rect x="1300" y="330" width="260" height="306" fill="#69707C" $_ink/></g>
  <g fill="#E8C765" $_ink2>
    <rect x="90" y="350" width="46" height="60"/><rect x="160" y="350" width="46" height="60"/><rect x="230" y="350" width="46" height="60"/>
    <rect x="410" y="320" width="46" height="60"/><rect x="490" y="320" width="46" height="60"/><rect x="570" y="320" width="46" height="60"/>
    <rect x="1030" y="340" width="46" height="60"/><rect x="1110" y="340" width="46" height="60"/>
    <rect x="1330" y="370" width="46" height="60"/><rect x="1420" y="370" width="46" height="60"/></g>
  <!-- Spaeti kiosk -->
  <g><rect x="700" y="470" width="200" height="166" fill="#B23A2A" $_ink/>
    <rect x="700" y="470" width="200" height="26" fill="#8A2A20"/>
    <text x="800" y="512" text-anchor="middle" fill="#E8C765" font-family="Fredericka,serif" font-size="30">SPAETI</text>
    <rect x="720" y="540" width="160" height="70" fill="#3a2a20" $_ink2/></g>
''');

final _biergarten = _wrap('''
  <defs><linearGradient id="bg" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#8FB4D2"/><stop offset="1" stop-color="#D8E0B0"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="620" fill="url(#bg)"/>
  ${_cloud(260, 110, 1.2)} ${_cloud(1080, 90, 1.1)}
  <!-- alps -->
  <path d="M0 360 L280 200 L440 320 L680 190 L900 330 L1160 200 L1600 360 L1600 620 L0 620 Z" fill="#9AA6B4" $_ink2/>
  <path d="M680 190 L640 240 L720 240 Z M1160 200 L1120 250 L1200 250 Z" fill="#EFE6CC"/>
  <rect x="0" y="616" width="1600" height="284" fill="#6E8A3A" $_ink/>
  <!-- chestnut trees -->
  <g><rect x="180" y="380" width="26" height="240" fill="#5a3a20" $_ink2/><circle cx="193" cy="360" r="90" fill="#3E6E34" $_ink/></g>
  <g><rect x="1400" y="380" width="26" height="240" fill="#5a3a20" $_ink2/><circle cx="1413" cy="360" r="90" fill="#3E6E34" $_ink/></g>
  <!-- blue-white bunting -->
  <g><path d="M0 250 Q800 300 1600 250" stroke="#2a4a8a" stroke-width="3" fill="none"/>
    <g $_ink2><path d="M120 254 h48 l-24 34 z" fill="#4A78C0"/><path d="M240 258 h48 l-24 34 z" fill="#F2F2F2"/>
    <path d="M420 260 h48 l-24 34 z" fill="#4A78C0"/><path d="M700 262 h48 l-24 34 z" fill="#F2F2F2"/>
    <path d="M980 260 h48 l-24 34 z" fill="#4A78C0"/><path d="M1240 256 h48 l-24 34 z" fill="#F2F2F2"/>
    <path d="M1420 252 h48 l-24 34 z" fill="#4A78C0"/></g></g>
  <!-- beer table + Mass -->
  <g><rect x="640" y="540" width="320" height="26" fill="#B98A52" $_ink/>
    <rect x="660" y="566" width="16" height="70" fill="#8a5a34"/><rect x="924" y="566" width="16" height="70" fill="#8a5a34"/>
    <rect x="640" y="500" width="320" height="16" fill="#B98A52" $_ink2/></g>
  <g><rect x="790" y="452" width="44" height="56" rx="4" fill="#E8B84A" $_ink/>
    <rect x="790" y="452" width="44" height="12" fill="#F2F2F2"/><rect x="834" y="464" width="14" height="30" rx="6" fill="none" $_ink2/></g>
''');

final _ruhrpott = _wrap('''
  <defs><linearGradient id="rp" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#B0A89A"/><stop offset="1" stop-color="#C8B48A"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="636" fill="url(#rp)"/>
  ${_cloud(300, 120, 1.1)} ${_cloud(1120, 140, 1.0)}
  <!-- Foerderturm (winding tower) -->
  <g $_ink2 fill="none" stroke="#3a3a3a" stroke-width="8">
    <path d="M760 640 L800 300 L840 640"/><path d="M775 500 L825 500 M785 420 L815 420"/>
    <path d="M800 300 L800 240"/></g>
  <circle cx="800" cy="235" r="30" fill="#B23A2A" $_ink/>
  <circle cx="782" cy="235" r="14" fill="none" $_ink2/><circle cx="818" cy="235" r="14" fill="none" $_ink2/>
  <!-- brick buildings -->
  <g>
    <rect x="60" y="360" width="300" height="276" fill="#9A5238" $_ink/>
    <rect x="1080" y="340" width="320" height="296" fill="#8A4A30" $_ink/></g>
  <g stroke="#5a2e1c" stroke-width="2" opacity="0.5">
    <line x1="60" y1="420" x2="360" y2="420"/><line x1="60" y1="480" x2="360" y2="480"/><line x1="60" y1="540" x2="360" y2="540"/>
    <line x1="1080" y1="410" x2="1400" y2="410"/><line x1="1080" y1="480" x2="1400" y2="480"/><line x1="1080" y1="550" x2="1400" y2="550"/></g>
  <rect x="0" y="636" width="1600" height="264" fill="#5A4A3A" $_ink/>
  <!-- Bude (kiosk) -->
  <g><rect x="1180" y="470" width="200" height="166" fill="#3E6E5A" $_ink/>
    <rect x="1180" y="470" width="200" height="26" fill="#2E5244"/>
    <text x="1280" y="512" text-anchor="middle" fill="#E8C765" font-family="Fredericka,serif" font-size="34">BUDE</text>
    <rect x="1200" y="540" width="160" height="70" fill="#2a2018" $_ink2/></g>
''');

final _hafen = _wrap('''
  <defs><linearGradient id="ha" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#8FA6B6"/><stop offset="1" stop-color="#C6CFC0"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="560" fill="url(#ha)"/>
  ${_cloud(220, 100, 1.2)} ${_cloud(1040, 120, 1.1)}
  <!-- water -->
  <rect x="0" y="500" width="1600" height="140" fill="#5E7E8E" $_ink2/>
  <g stroke="#EFE6CC" stroke-width="3" opacity="0.4"><line x1="0" y1="540" x2="1600" y2="540"/><line x1="0" y1="580" x2="1600" y2="580"/></g>
  <rect x="0" y="636" width="1600" height="264" fill="#6E6258" $_ink/>
  <!-- harbour cranes -->
  <g $_ink2 fill="none" stroke="#B23A2A" stroke-width="8">
    <path d="M180 500 L180 220 L420 220"/><path d="M180 260 L120 220"/><line x1="360" y1="220" x2="360" y2="300"/></g>
  <g $_ink2 fill="none" stroke="#3a5a6a" stroke-width="8">
    <path d="M1180 500 L1180 240 L1420 240"/><path d="M1180 280 L1120 240"/><line x1="1360" y1="240" x2="1360" y2="320"/></g>
  <!-- containers -->
  <g $_ink2>
    <rect x="500" y="420" width="120" height="70" fill="#C1442F"/><rect x="620" y="420" width="120" height="70" fill="#2E6E9B"/>
    <rect x="740" y="420" width="120" height="70" fill="#6E8A3A"/><rect x="560" y="350" width="120" height="70" fill="#E8B84A"/>
    <rect x="680" y="350" width="120" height="70" fill="#C1442F"/></g>
  <!-- ship -->
  <g><path d="M980 470 h300 l-40 60 h-220 z" fill="#3a4a54" $_ink/>
    <rect x="1060" y="410" width="120" height="60" fill="#B23A2A" $_ink2/>
    <rect x="1100" y="360" width="16" height="50" fill="#8a8680"/></g>
''');

// ---- Greek ----

final _kafeneio = _wrap('''
  <defs><linearGradient id="ka" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#4FA0D8"/><stop offset="1" stop-color="#E7D6A8"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="620" fill="url(#ka)"/>
  ${_cloud(240, 110, 1.1)} ${_cloud(1080, 130, 1.0)}
  <rect x="0" y="616" width="1600" height="284" fill="#CBB58A"/>
  <g stroke="#a9946c" stroke-width="3" opacity="0.5"><line x1="0" y1="700" x2="1600" y2="700"/><line x1="0" y1="790" x2="1600" y2="790"/></g>
  <!-- whitewashed wall with blue shutters -->
  <rect x="0" y="300" width="1600" height="320" fill="#F0EAD8" $_ink/>
  <g $_ink2 fill="#1B6EC2">
    <rect x="120" y="360" width="120" height="150" rx="4"/><rect x="1240" y="360" width="120" height="150" rx="4"/></g>
  <g stroke="#0f4a86" stroke-width="3"><line x1="180" y1="360" x2="180" y2="510"/><line x1="1300" y1="360" x2="1300" y2="510"/></g>
  <!-- KAFENEIO sign -->
  <g><rect x="640" y="330" width="320" height="70" rx="6" fill="#1B6EC2" $_ink/>
    <text x="800" y="380" text-anchor="middle" fill="#F0EAD8" font-family="Fredericka,serif" font-size="34">KAFENEIO</text></g>
  <!-- cafe table with tavli + ouzo -->
  <g>
    <rect x="700" y="560" width="12" height="70" fill="#3a2a1a"/>
    <ellipse cx="706" cy="558" rx="90" ry="18" fill="#1B6EC2" $_ink2/>
    <rect x="660" y="540" width="90" height="24" rx="3" fill="#7a5a34" $_ink2/>
    <g stroke="#3a2a1a" stroke-width="2"><path d="M666 542 l10 20 M676 542 l10 20 M686 542 l10 20"/></g>
    <rect x="770" y="516" width="16" height="42" rx="4" fill="#cfe6d0" $_ink2/>
  </g>
  <!-- blue chair -->
  <g $_ink2 fill="#1B6EC2"><rect x="470" y="560" width="70" height="12"/><rect x="470" y="520" width="12" height="52"/><rect x="528" y="520" width="12" height="52"/></g>
''');

final _laiki = _wrap('''
  <defs><linearGradient id="la" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#5AA8DC"/><stop offset="1" stop-color="#E3D2A8"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="640" fill="url(#la)"/>
  ${_cloud(300, 100, 1.1)} ${_cloud(1120, 120, 1.0)}
  <rect x="0" y="636" width="1600" height="264" fill="#B89A66" $_ink/>
  <!-- blue/white striped awnings -->
  <g>
    <rect x="80" y="360" width="360" height="24" fill="#1B6EC2" $_ink2/>
    <g><rect x="80" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="120" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="160" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="200" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="240" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="280" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="320" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="360" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="400" y="384" width="40" height="34" fill="#1B6EC2"/></g>
    <rect x="90" y="418" width="8" height="180" fill="#5a4e38"/><rect x="422" y="418" width="8" height="180" fill="#5a4e38"/>
    <rect x="80" y="516" width="360" height="82" fill="#6E5A3A" $_ink2/></g>
  <g>
    <rect x="1160" y="360" width="360" height="24" fill="#1B6EC2" $_ink2/>
    <g><rect x="1160" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="1200" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="1240" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="1280" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="1320" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="1360" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="1400" y="384" width="40" height="34" fill="#F0EAD8"/><rect x="1440" y="384" width="40" height="34" fill="#1B6EC2"/><rect x="1480" y="384" width="40" height="34" fill="#F0EAD8"/></g>
    <rect x="1170" y="418" width="8" height="180" fill="#5a4e38"/><rect x="1502" y="418" width="8" height="180" fill="#5a4e38"/>
    <rect x="1160" y="516" width="360" height="82" fill="#6E5A3A" $_ink2/></g>
  <!-- crates: tomatoes, olives, lemons -->
  <g $_ink2>
    <rect x="120" y="540" width="120" height="60" fill="#8a6a3a"/>
    <g fill="#C1121F"><circle cx="150" cy="546" r="12"/><circle cx="180" cy="546" r="12"/><circle cx="210" cy="546" r="12"/></g>
    <rect x="280" y="540" width="120" height="60" fill="#8a6a3a"/>
    <g fill="#3E5E2E"><circle cx="310" cy="546" r="10"/><circle cx="335" cy="546" r="10"/><circle cx="360" cy="546" r="10"/><circle cx="385" cy="546" r="10"/></g>
    <rect x="1200" y="540" width="120" height="60" fill="#8a6a3a"/>
    <g fill="#E9C22C"><circle cx="1230" cy="546" r="12"/><circle cx="1260" cy="546" r="12"/><circle cx="1290" cy="546" r="12"/></g></g>
''');

final _gipedo = _wrap('''
  <defs><linearGradient id="gi" x1="0" y1="0" x2="0" y2="1">
    <stop offset="0" stop-color="#3A6EA5"/><stop offset="1" stop-color="#9FC0D0"/></linearGradient></defs>
  <rect x="0" y="0" width="1600" height="520" fill="url(#gi)"/>
  ${_cloud(240, 110, 1.1)} ${_cloud(1080, 100, 1.2)}
  <rect x="0" y="300" width="1600" height="230" fill="#7E8C9C" $_ink/>
  <g stroke="#2A1E10" stroke-width="3" opacity="0.5"><line x1="0" y1="360" x2="1600" y2="360"/><line x1="0" y1="420" x2="1600" y2="420"/><line x1="0" y1="480" x2="1600" y2="480"/></g>
  <g $_ink2>
    <g fill="#2E7D4A"><circle cx="140" cy="335" r="9"/><circle cx="420" cy="332" r="9"/><circle cx="900" cy="336" r="9"/><circle cx="1360" cy="333" r="9"/></g>
    <g fill="#F0EAD8"><circle cx="280" cy="392" r="9"/><circle cx="620" cy="388" r="9"/><circle cx="980" cy="392" r="9"/><circle cx="1220" cy="389" r="9"/></g>
    <g fill="#2E7D4A"><circle cx="200" cy="450" r="9"/><circle cx="520" cy="452" r="9"/><circle cx="1040" cy="448" r="9"/><circle cx="1300" cy="452" r="9"/></g></g>
  <g><rect x="150" y="120" width="12" height="190" fill="#3a2a18" $_ink2/><rect x="108" y="86" width="96" height="42" rx="5" fill="#4a3a22" $_ink2/>
    <g fill="#F2D98A"><circle cx="130" cy="100" r="6"/><circle cx="156" cy="100" r="6"/><circle cx="182" cy="100" r="6"/><circle cx="130" cy="116" r="6"/><circle cx="156" cy="116" r="6"/><circle cx="182" cy="116" r="6"/></g></g>
  <g><rect x="1438" y="120" width="12" height="190" fill="#3a2a18" $_ink2/><rect x="1396" y="86" width="96" height="42" rx="5" fill="#4a3a22" $_ink2/>
    <g fill="#F2D98A"><circle cx="1418" cy="100" r="6"/><circle cx="1444" cy="100" r="6"/><circle cx="1470" cy="100" r="6"/><circle cx="1418" cy="116" r="6"/><circle cx="1444" cy="116" r="6"/><circle cx="1470" cy="116" r="6"/></g></g>
  <rect x="0" y="520" width="1600" height="380" fill="#2E7D4A" $_ink/>
  <g stroke="#EFF6EC" stroke-width="4" opacity="0.6"><line x1="60" y1="560" x2="60" y2="880"/><line x1="0" y1="700" x2="1600" y2="700"/></g>
''');

final _trapezi = _wrap('''
  <rect x="0" y="0" width="1600" height="640" fill="#7A4A3A"/>
  <rect x="0" y="616" width="1600" height="284" fill="#5A3A28" $_ink/>
  <!-- grapevine across the top -->
  <path d="M0 120 Q800 60 1600 120" stroke="#4A6A2E" stroke-width="10" fill="none"/>
  <g fill="#3E6E34" $_ink2><circle cx="200" cy="140" r="26"/><circle cx="520" cy="120" r="26"/><circle cx="900" cy="128" r="26"/><circle cx="1280" cy="130" r="26"/></g>
  <g fill="#6A3E7A"><circle cx="330" cy="150" r="7"/><circle cx="345" cy="162" r="7"/><circle cx="360" cy="150" r="7"/><circle cx="1080" cy="150" r="7"/><circle cx="1095" cy="162" r="7"/><circle cx="1110" cy="150" r="7"/></g>
  <!-- warm wall -->
  <rect x="0" y="180" width="1600" height="300" fill="#B0784E" opacity="0.4"/>
  <!-- long table with blue-checked cloth -->
  <rect x="120" y="470" width="1360" height="150" fill="#E7ECF2" $_ink/>
  <g fill="#1B6EC2" opacity="0.5">
    <rect x="120" y="470" width="1360" height="16"/><rect x="120" y="530" width="1360" height="16"/><rect x="120" y="590" width="1360" height="16"/>
    <rect x="240" y="470" width="16" height="150"/><rect x="480" y="470" width="16" height="150"/><rect x="720" y="470" width="16" height="150"/><rect x="960" y="470" width="16" height="150"/><rect x="1200" y="470" width="16" height="150"/></g>
  <!-- big dish + wine carafe + bread -->
  <g $_ink2>
    <ellipse cx="800" cy="500" rx="120" ry="26" fill="#F0EAD8"/><ellipse cx="800" cy="496" rx="90" ry="16" fill="#C77B3A"/>
    <path d="M560 500 l0 -46 q0 -14 22 -14 q22 0 22 14 l0 46 z" fill="#7a1e34" fill-opacity="0.9"/>
    <ellipse cx="1080" cy="498" rx="70" ry="18" fill="#D9A24A"/></g>
''');
