import 'package:flutter/cupertino.dart';

class CenteredText extends StatelessWidget {
  final String text;

  CenteredText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
