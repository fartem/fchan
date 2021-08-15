import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class ContentHtmlText extends StatelessWidget {
  final String text;
  final FontWeight bodyWeight;
  final bool wrapText;

  ContentHtmlText({
    required this.text,
    this.bodyWeight = FontWeight.normal,
    this.wrapText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        'a': Style(
          color: Colors.red[700],
        ),
        'b': Style(
          fontWeight: FontWeight.bold,
        ),
        'body': Style(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          fontWeight: bodyWeight,
          maxLines: wrapText ? 5 : null,
          textOverflow: TextOverflow.ellipsis,
        ),
        'span': Style(
          // TODO: add theme
          color: Colors.green[700],
        ),
      },
    );
  }
}