import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/routes/fchan_routes.dart';
import '../data/repositories/data_repository.dart';
import '../extensions/build_context_extensions.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final fChanRepository = context.read<DataRepository>();
    Future.microtask(() => fChanRepository.init()).then((fChanDatabase) {
      context.pushReplace(
        route: FChanRoutes.routeHome,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
