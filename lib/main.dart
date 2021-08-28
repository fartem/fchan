import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/board/board_page.dart';
import 'bloc/explore_boards/explore_boards_page.dart';
import 'bloc/favorites/favorites_page.dart';
import 'bloc/history/history_page.dart';
import 'bloc/thread/thread_page.dart';
import 'components/themes/fchan_themes.dart';
import 'data/providers/local/impl/local_data_provider_impl.dart';
import 'data/providers/remote/impl/remote_data_provider_impl.dart';
import 'data/repositories/data_repository.dart';
import 'entities/board.dart';
import 'entities/thread.dart';
import 'extensions/build_context_extensions.dart';
import 'logic/routes/fchan_routes.dart';

void main() async {
  await dotenv.load();
  runApp(
    AppDependencies(
      child: FChanApp(),
    ),
  );
}

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
            remoteDataProvider: RemoteDataProviderImpl(
              dio: Dio(
                BaseOptions(
                  baseUrl: dotenv.env['API_URL']!,
                ),
              ),
              baseUrl: dotenv.env['API_URL']!,
              imageBaseUrl: dotenv.env['API_URL_IMAGES']!,
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}

class FChanApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FChanAppState();
}

class FChanAppState extends State<FChanApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case FChanRoutes.routeInit:
            return MaterialPageRoute(
              builder: (context) => FChanInit(),
            );
          case FChanRoutes.routeHome:
            return MaterialPageRoute(
              builder: (context) => FChan(),
            );
          case FChanRoutes.routeExploreBoards:
            return MaterialPageRoute(
              builder: (context) => ExploreBoardsPage(),
            );
          case FChanRoutes.routeBoard:
            return MaterialPageRoute(
              builder: (context) => BoardPage(
                board: settings.arguments as Board,
              ),
            );
          case FChanRoutes.routeThread:
            return MaterialPageRoute(
              builder: (context) => ThreadPage(
                thread: settings.arguments as Thread,
              ),
            );
          default:
            return null;
        }
      },
      initialRoute: FChanRoutes.routeInit,
      title: 'FChan',
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  @override
  void dispose() {
    final fChanRepository = context.read<DataRepository>();
    fChanRepository.dispose();
    super.dispose();
  }
}

class FChan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FChanState();
}

class _FChanState extends State<FChan> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: refactor this
    final _screens = [
      NavigationPage(
        screen: FavoritesPage(),
        title: context.localizations().titleFavoriteBoards,
        bottomNavigationBarItem: BottomNavigationBarItem(
          label: context.localizations().titleHome,
          icon: Icon(Icons.home),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => context.push(
              route: FChanRoutes.routeExploreBoards,
            ),
          ),
        ],
      ),
      NavigationPage(
        screen: HistoryPage(),
        title: context.localizations().titleHistory,
        bottomNavigationBarItem: BottomNavigationBarItem(
          label: context.localizations().titleHistory,
          icon: Icon(Icons.history),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // TODO: implement
              }),
        ],
      ),
    ];
    final currentPage = _screens[_currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentPage.title,
        ),
        actions: currentPage.actions,
      ),
      body: currentPage.screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        // TODO: performance?
        items: _screens.map((screen) => screen.bottomNavigationBarItem).toList(),
        onTap: (selectedIndex) => setState(() => _currentIndex = selectedIndex),
      ),
    );
  }
}

class FChanInit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FChanInitState();
}

class FChanInitState extends State<FChanInit> {
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

class NavigationPage {
  final Widget screen;
  final String title;
  final BottomNavigationBarItem bottomNavigationBarItem;
  final List<IconButton> actions;

  NavigationPage({
    required this.screen,
    required this.title,
    required this.bottomNavigationBarItem,
    required this.actions,
  });
}
