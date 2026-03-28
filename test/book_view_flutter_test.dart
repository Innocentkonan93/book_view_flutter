import 'package:flutter_test/flutter_test.dart';
import 'package:book_view_flutter/book_view_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('BookView renders title and author', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BookView(
            imageUrl: 'https://example.com/image.png',
            title: 'Test Title',
            author: 'Test Author',
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Author'), findsOneWidget);
  });
}
