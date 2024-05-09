import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stuwise/ui/constants/exports.dart';
import 'package:stuwise/ui/views/learn_view.dart';

void main() {
  group('Access Financial Education Content', () {
    testWidgets('Browse and select financial topics',
        (WidgetTester tester) async {
      // Building the LearnView widget
      await tester
          .pumpWidget(Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
          home: LearnView(),
        );
      }));

      // Verify the presence of LearnTileWidget
      expect(find.byType(LearnTileWidget), findsNWidgets(7));

      // Tap on the first educational topic
      await tester.tap(find.text("Difference between good and bad credit"));
      await tester.pumpAndSettle();

      // Verify that the ChatView is pushed with the selected topic
      expect(
          find.text("Difference between good and bad credit"), findsOneWidget);
    });
  });
}
