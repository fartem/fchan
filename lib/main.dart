import 'package:fchan/app/app_dependencies.dart';
import 'package:fchan/app/fchan_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    const AppDependencies(
      app: FChanApp(),
    ),
  );
}
