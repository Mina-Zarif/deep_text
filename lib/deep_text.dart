import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DeepText extends StatelessWidget {
  final String text;

  // Callbacks
  final Function(String)? onHashTagTap;
  final Function(String)? onMentionTap;
  final Function(String)? onEmailTap;
  final Function(String)? onPhoneTap;
  final Function(String)? onUrlTap;

  // Enable/Disable parsing
  final bool enableBold;
  final bool enableItalic;
  final bool enableUnderline;
  final bool enableStrikethrough;
  final bool enableCode;
  final bool enableHashTags;
  final bool enableMentions;
  final bool enableEmails;
  final bool enablePhones;
  final bool enableUrls;


  // Custom styles
  final TextStyle? boldStyle;
  final TextStyle? italicStyle;
  final TextStyle? underlineStyle;
  final TextStyle? strikethroughStyle;
  final TextStyle? codeStyle;
  final TextStyle? hashTagStyle;
  final TextStyle? mentionStyle;
  final TextStyle? emailStyle;
  final TextStyle? phoneStyle;
  final TextStyle? urlStyle;
  final TextStyle? defaultStyle;

  const DeepText({
    super.key,
    required this.text,
    this.onHashTagTap,
    this.onMentionTap,
    this.onEmailTap,
    this.onPhoneTap,
    this.onUrlTap,

    // Default enabled
    this.enableBold = true,
    this.enableItalic = true,
    this.enableUnderline = true,
    this.enableStrikethrough = true,
    this.enableCode = true,
    this.enableHashTags = true,
    this.enableMentions = true,
    this.enableEmails = true,
    this.enablePhones = true,
    this.enableUrls = true,

    // Default styles
    this.boldStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.italicStyle = const TextStyle(fontStyle: FontStyle.italic),
    this.underlineStyle = const TextStyle(decoration: TextDecoration.underline),
    this.strikethroughStyle =
    const TextStyle(decoration: TextDecoration.lineThrough),
    this.codeStyle = const TextStyle(
        fontFamily: 'monospace', backgroundColor: Color(0xFFEAEAEA)),
    this.hashTagStyle = const TextStyle(color: Colors.blue),
    this.mentionStyle = const TextStyle(color: Colors.green),
    this.emailStyle = const TextStyle(color: Colors.red),
    this.phoneStyle = const TextStyle(color: Colors.purple),
    this.urlStyle = const TextStyle(color: Colors.orange, decoration: TextDecoration.underline),
    this.defaultStyle = const TextStyle(fontSize: 16, color: Colors.black),
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: _parseText(text),
      ),
    );
  }

  List<TextSpan> _parseText(String input) {
    final RegExp regex = RegExp(
      r'(\*.*?\*)|(_.*?_)|(~.*?~)|(-.*?-)|(`(?:.|\n)*?`)|'
      r'(\#\w+)|(@\w+)|'
      r'(\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b)|'
      r'(\+?\d{1,3}[-.\s]?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9})|'
      r'(https?:\/\/[^\s]+)',
      multiLine: true,
    );

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (RegExpMatch match in regex.allMatches(input)) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: input.substring(lastMatchEnd, match.start)));
      }

      String matchText = match[0]!;
      TextStyle style = defaultStyle!;
      GestureRecognizer? recognizer;

      if (matchText.startsWith('*') && matchText.endsWith('*') && enableBold) {
        style = boldStyle!;
        matchText = matchText.substring(1, matchText.length - 1);
      } else if (matchText.startsWith('_') &&
          matchText.endsWith('_') &&
          enableItalic) {
        style = italicStyle!;
        matchText = matchText.substring(1, matchText.length - 1);
      } else if (matchText.startsWith('~') &&
          matchText.endsWith('~') &&
          enableUnderline) {
        style = underlineStyle!;
        matchText = matchText.substring(1, matchText.length - 1);
      } else if (matchText.startsWith('-') &&
          matchText.endsWith('-') &&
          enableStrikethrough) {
        style = strikethroughStyle!;
        matchText = matchText.substring(1, matchText.length - 1);
      } else if (matchText.startsWith('`') &&
          matchText.endsWith('`') &&
          enableCode) {
        style = codeStyle!;
        matchText = matchText.substring(1, matchText.length - 1);
      } else if (matchText.startsWith('#') && enableHashTags) {
        style = hashTagStyle!;
        recognizer = TapGestureRecognizer()
          ..onTap = () => onHashTagTap?.call(matchText.substring(1));
      } else if (matchText.startsWith('@') && enableMentions) {
        style = mentionStyle!;
        recognizer = TapGestureRecognizer()
          ..onTap = () => onMentionTap?.call(matchText.substring(1));
      } else if (RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
          .hasMatch(matchText) &&
          enableEmails) {
        style = emailStyle!;
        recognizer = TapGestureRecognizer()
          ..onTap = () => onEmailTap?.call(matchText);
      } else if (RegExp(r'(\+?\d{1,3}[-.\s]?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9})')
          .hasMatch(matchText) &&
          enablePhones) {
        style = phoneStyle!;
        recognizer = TapGestureRecognizer()
          ..onTap = () => onPhoneTap?.call(matchText);
      } else if (RegExp(r'https?:\/\/[^\s]+').hasMatch(matchText) &&
          enableUrls) {
        style = urlStyle!;
        recognizer = TapGestureRecognizer()
          ..onTap = () => onUrlTap?.call(matchText);
      }

      spans.add(TextSpan(text: matchText, style: style, recognizer: recognizer));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < input.length) {
      spans.add(TextSpan(text: input.substring(lastMatchEnd)));
    }

    return spans;
  }
}