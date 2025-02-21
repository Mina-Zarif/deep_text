# DeepText

DeepText is a Flutter package for rendering rich text with support for:

- **Bold**, *Italic*, ~Underline~, ~~Strikethrough~~, and `Code`
- Hashtags (`#example`) and Mentions (`@user`)
- Emails (`example@email.com`) and Phone Numbers (`+123456789`)
- URLs (`https://example.com`)
- Customizable styles and tap handlers

## Features

- Parse and style text dynamically.
- Detect and handle user interactions with mentions, hashtags, URLs, emails, and phone numbers.
- Easily customizable with different text styles.

## Example

Here’s how DeepText looks in action:

![DeepText Example](https://i.imgur.com/HJmy0QE.jpeg)

## Usage
```dart
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
        appBar: AppBar(title: const Text("DeepText Example")),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
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
```
## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  deep_text: latest_version
