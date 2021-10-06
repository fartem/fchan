import 'package:fchan/data/providers/local/impl/local_data_provider_impl.dart';
import 'package:fchan/data/providers/remote/impl/remote_data_provider_impl.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDependencies extends StatelessWidget {
  final Widget child;

  const AppDependencies({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
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
