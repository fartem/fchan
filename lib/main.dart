import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app_dependencies.dart';
import 'app/fchan_app.dart';

void main() async {
  await dotenv.load();
  runApp(
    AppDependencies(
      child: FChanApp(),
    ),
  );
}
