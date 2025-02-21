import 'package:flutter/material.dart';
import 'package:deep_text/deep_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DeepText(
            text:
                "Hello *bold* _italic_ ~underline~ ~~strikethrough~~ `code` #hashtag @mention example@email.com +123456789 https://example.com",
            onHashTagTap: (tag) => print("Hashtag tapped: $tag"),
            onMentionTap: (mention) => print("Mention tapped: $mention"),
            onEmailTap: (email) => print("Email tapped: $email"),
            onPhoneTap: (phone) => print("Phone tapped: $phone"),
            onUrlTap: (url) => print("URL tapped: $url"),
            boldStyle: const TextStyle(fontWeight: FontWeight.bold),
            italicStyle: const TextStyle(fontStyle: FontStyle.italic),
            underlineStyle:
                const TextStyle(decoration: TextDecoration.underline),
            strikethroughStyle:
                const TextStyle(decoration: TextDecoration.lineThrough),
            codeStyle: const TextStyle(
                fontFamily: 'monospace', backgroundColor: Color(0xFFEAEAEA)),
            hashTagStyle: const TextStyle(color: Colors.blue),
            mentionStyle: const TextStyle(color: Colors.green),
            emailStyle: const TextStyle(color: Colors.red),
            phoneStyle: const TextStyle(color: Colors.purple),
            urlStyle: const TextStyle(
                color: Colors.orange, decoration: TextDecoration.underline),
            defaultStyle: const TextStyle(fontSize: 16, color: Colors.black),
            enableBold: true,
            enableCode: true,
            enableEmails: true,
            enableHashTags: true,
            enableItalic: true,
            enableMentions: true,
            enablePhones: true,
            enableStrikethrough: true,
            enableUnderline: true,
            enableUrls: true,
          ),
        ),
      ),
    );
  }
}
