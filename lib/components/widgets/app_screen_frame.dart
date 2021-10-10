import 'package:flutter/material.dart';

class AppScreenFrame extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;

  const AppScreenFrame({
    required this.title,
    required this.actions,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}
