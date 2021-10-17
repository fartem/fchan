import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // TODO(fartem): init
    // final fChanRepository = context.read<DataRepository>();
    // Future.microtask(fChanRepository.init).then((fChanDatabase) {
    //   context.pushReplace(
    //     route: routeHome,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
