import 'package:fchan/components/routes/fchan_routes.dart';
import 'package:fchan/data/repositories/data_repository.dart';
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
    final fChanRepository = context.read<DataRepository>();
    Future.microtask(() => fChanRepository.init()).then((fChanDatabase) {
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
