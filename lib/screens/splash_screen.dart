import 'package:fchan/components/routes/fchan_routes.dart';
import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/providers/remote/api/remote_data_provider.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.wait([context.read<LocalDataProvider>().init()]).then((_) {
      context.pushReplace(
        route: routeHome,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
