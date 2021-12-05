import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/providers/local/impl/local_data_provider_impl.dart';
import 'package:fchan/data/providers/remote/api/remote_data_provider.dart';
import 'package:fchan/data/providers/remote/impl/remote_data_provider_impl.dart';
import 'package:fchan/data/repositories/api/boards_repository.dart';
import 'package:fchan/data/repositories/api/favorites_repository.dart';
import 'package:fchan/data/repositories/api/posts_repository.dart';
import 'package:fchan/data/repositories/api/threads_repository.dart';
import 'package:fchan/data/repositories/impl/boards_repository_impl.dart';
import 'package:fchan/data/repositories/impl/favorites_repository_impl.dart';
import 'package:fchan/data/repositories/impl/posts_repository_impl.dart';
import 'package:fchan/data/repositories/impl/threads_repository_impl.dart';
import 'package:fchan/features/explore_boards/stores/explore_boards_store.dart';
import 'package:fchan/features/favorites/stores/favorites_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDependencies extends StatelessWidget {
  final Widget app;

  const AppDependencies({
    required this.app,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalDataProvider>(create: (_) => LocalDataProviderImpl()),
        Provider<RemoteDataProvider>(create: (_) => RemoteDataProviderImpl()),
        ProxyProvider<LocalDataProvider, FavoritesRepository>(
          update: (_, localDataProvider, __) => FavoritesRepositoryImpl(
            localDataProvider: localDataProvider,
          ),
        ),
        ProxyProvider<RemoteDataProvider, ThreadsRepository>(
          update: (_, remoteDataProvider, __) => ThreadsRepositoryImpl(
            remoteDataProvider: remoteDataProvider,
          ),
        ),
        ProxyProvider<RemoteDataProvider, PostsRepository>(
          update: (_, remoteDataProvider, __) => PostsRepositoryImpl(
            remoteDataProvider: remoteDataProvider,
          ),
        ),
        ProxyProvider2<RemoteDataProvider, FavoritesRepository, BoardsRepository>(
          update: (_, remoteDataProvider, favoritesRepository, __) => BoardsRepositoryImpl(
            remoteDataProvider: remoteDataProvider,
            favoritesRepository: favoritesRepository,
          ),
        ),
        ProxyProvider<FavoritesRepository, FavoritesStore>(
          update: (_, favoritesRepository, __) => FavoritesStore(
            favoritesRepository: favoritesRepository,
          ),
        ),
        ProxyProvider<BoardsRepository, ExploreBoardsStore>(
          update: (_, boardsRepository, __) => ExploreBoardsStore(
            boardsRepository: boardsRepository,
          ),
        ),
      ],
      child: app,
    );
  }
}
