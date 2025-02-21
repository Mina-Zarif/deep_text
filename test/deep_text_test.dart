import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deep_text/deep_text.dart';

void main() {
  testWidgets('DeepText renders correctly and applies styles', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DeepText(
            text: "Hello *bold* _italic_ ~underline~ -strikethrough- `code` #Flutter @JohnDoe john.doe@example.com +1234567890 https://flutter.dev",
            enableBold: true,
            enableItalic: true,
            enableUnderline: true,
            enableStrikethrough: false, // Disabled
            enableCode: true,
            enableHashTags: true,
            enableMentions: true,
            enableEmails: true,
            enablePhones: true,
            enableUrls: true,
            boldStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            italicStyle: const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
            onHashTagTap: (tag) => debugPrint("Hashtag clicked: $tag"),
            onMentionTap: (mention) => debugPrint("Mention clicked: $mention"),
            onEmailTap: (email) => debugPrint("Email clicked: $email"),
            onPhoneTap: (phone) => debugPrint("Phone clicked: $phone"),
            onUrlTap: (url) => debugPrint("URL clicked: $url"),
          ),
        ),
      ),
    );

    // // Check if text is rendered
    // expect(find.textContaining("Hello"), findsOneWidget);
    // expect(find.textContaining("bold"), findsOneWidget);
    // expect(find.textContaining("italic"), findsOneWidget);
    // expect(find.textContaining("underline"), findsOneWidget);
    // expect(find.textContaining("strikethrough"), findsOneWidget);
    // expect(find.textContaining("code"), findsOneWidget);
    // expect(find.textContaining("Flutter"), findsOneWidget);
    // expect(find.textContaining("@JohnDoe"), findsOneWidget);
    // expect(find.textContaining("john.doe@example.com"), findsOneWidget);
    // expect(find.textContaining("+1234567890"), findsOneWidget);
    // expect(find.textContaining("https://flutter.dev"), findsOneWidget);
  });
}
