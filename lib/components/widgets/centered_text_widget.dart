import 'package:flutter/cupertino.dart';

class CenteredTextWidget extends StatelessWidget {
  final String _text;

  CenteredTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_text),
    );
  }
}
