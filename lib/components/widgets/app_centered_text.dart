import 'package:flutter/cupertino.dart';

class AppCenteredText extends StatelessWidget {
  final String text;

  const AppCenteredText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
