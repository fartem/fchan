import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCenteredCircularProgressIndicator extends StatelessWidget {
  const AppCenteredCircularProgressIndicator({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
