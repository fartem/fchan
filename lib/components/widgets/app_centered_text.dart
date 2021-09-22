import 'package:flutter/cupertino.dart';

class AppCenteredText extends StatelessWidget {
  final String text;

  const AppCenteredText({
    Key? key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
