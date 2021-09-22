import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/providers/local/impl/local_data_provider_impl.dart';
import '../data/providers/remote/impl/remote_data_provider_impl.dart';
import '../data/repositories/data_repository.dart';

class AppDependencies extends StatelessWidget {
  final Widget child;

  const AppDependencies({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DataRepository>(
          create: (context) => DataRepository(
            localDataProvider: LocalDataProviderImpl(),
            remoteDataProvider: RemoteDataProviderImpl(),
          ),
        ),
      ],
      child: child,
    );
  }
}
