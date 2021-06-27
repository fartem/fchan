import 'package:flutter/cupertino.dart';

class CenteredTextWidget extends StatelessWidget {
  final String text;

  CenteredTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
