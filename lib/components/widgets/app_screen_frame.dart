import 'package:flutter/material.dart';

class AppScreenFrame extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const AppScreenFrame({
    required this.title,
    required this.body,
    this.actions,
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
