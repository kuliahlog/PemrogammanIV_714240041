import 'package:flutter_test/flutter_test.dart';

import 'package:pertemuan6/main.dart';

void main() {
  testWidgets('Advanced Form menu can be opened', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Latihan'), findsOneWidget);

    await tester.tap(find.text('Advanced Form'));
    await tester.pumpAndSettle();

    expect(find.text('Interactive Widget'), findsOneWidget);
    expect(find.text('Tanggal'), findsOneWidget);
    expect(find.text('Warna'), findsOneWidget);
    expect(find.text('File'), findsOneWidget);
  });
}
