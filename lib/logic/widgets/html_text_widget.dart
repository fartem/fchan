import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class HtmlTextWidget extends StatelessWidget {
  final String text;

  HtmlTextWidget(this.text);

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
        ),
        'span': Style(
          // TODO: add theme
          color: Colors.green[700],
        ),
      },
      onLinkTap: (link) {

      },
    );
  }
}
