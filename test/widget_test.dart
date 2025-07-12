import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:palindrome_app/screens/first_screen.dart'; 
import 'package:palindrome_app/providers/user_provider.dart'; 

void main() {
  testWidgets('Test tombol CHECK dan NEXT serta selectedUserName',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(),
        child: MaterialApp(
          home: FirstScreen(),
        ),
      ),
    );

    final nameField = find.byType(TextField).at(0);
    await tester.enterText(nameField, 'Alvin');

    await tester.tap(find.text('CHECK'));
    await tester.pump(); 
    expect(find.textContaining('isPalindrome'), findsOneWidget); 

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('NEXT'));
    await tester.pumpAndSettle(); 

    final context = tester.element(find.byType(Scaffold).first);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    expect(userProvider.userName, 'Alvin');
  });
}
