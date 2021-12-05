import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCenteredCircularProgressIndicator extends StatelessWidget {
  const AppCenteredCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
