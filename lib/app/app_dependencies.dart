import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDependencies extends StatelessWidget {
  final Widget app;

  const AppDependencies({
    required this.app,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // TODO(fartem): init
        // RepositoryProvider<DataRepository>(
        //   create: (context) => DataRepository(
        //     localDataProvider: LocalDataProviderImpl(),
        //     remoteDataProvider: RemoteDataProviderImpl(),
        //   ),
        // ),
      ],
      child: app,
    );
  }
}
