import 'package:flutter_test/flutter_test.dart';

import 'package:mindyourlanguage/main.dart';

void main() {
  testWidgets('boots to the game-select screen', (tester) async {
    await tester.pumpWidget(const MylApp());
    await tester.pump();
    expect(find.text('SELECT A GAME'), findsOneWidget);
  });
}
