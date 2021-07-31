import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'bloc/board/board_page.dart';
import 'bloc/explore_boards/explore_boards_page.dart';
import 'bloc/favorites/favorites_page.dart';
import 'components/themes/fchan_themes.dart';
import 'components/words/fchan_words.dart';
import 'data/providers/local/impl/local_data_provider_impl.dart';
import 'data/providers/remote/impl/remote_data_provider_impl.dart';
import 'data/repositories/data_repository.dart';
import 'entities/board.dart';
import 'entities/thread.dart';
import 'extensions/build_context_extensions.dart';
import 'logic/routes/fchan_routes.dart';
import 'logic/screens/history_screen.dart';
import 'logic/screens/settings_screen.dart';
import 'logic/screens/thread_screen.dart';
import 'provider/catalog_model.dart';
import 'provider/favorite_boards_model.dart';
import 'provider/history_model.dart';
import 'provider/thread_model.dart';

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
    return MultiProvider(
      providers: [
        Provider<FChanWords>(
          create: (_) => FChanWordsImpl(),
        ),
      ],
      child: MultiRepositoryProvider(
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
      ),
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
    final fChanRepository = context.read<DataRepository>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteBoardsModel(
            fChanRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryModel(
            fChanRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CatalogModel(
            fChanRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ThreadModel(
            fChanRepository,
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case FChanRoutes.initScreen:
              return MaterialPageRoute(
                builder: (context) => FChanInit(),
              );
            case FChanRoutes.homeScreen:
              return MaterialPageRoute(
                builder: (context) => FChan(),
              );
            case FChanRoutes.exploreBoardsScreen:
              return MaterialPageRoute(
                builder: (context) => ExploreBoardsPage(),
              );
            case FChanRoutes.boardScreen:
              return MaterialPageRoute(
                builder: (context) => BoardPage(
                  board: settings.arguments as Board,
                ),
              );
            case FChanRoutes.threadScreen:
              return MaterialPageRoute(
                builder: (context) => ThreadScreen(
                  settings.arguments as Thread,
                ),
              );
            default:
              return null;
          }
        },
        initialRoute: FChanRoutes.initScreen,
        title: 'FChan',
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.system,
      ),
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
    final fChanWords = context.read<FChanWords>();
    final _screens = [
      NavigationPage(
        FavoritesPage(),
        fChanWords.boardsTitle,
        BottomNavigationBarItem(
          label: fChanWords.homeTitle,
          icon: Icon(Icons.home),
        ),
        [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => context.push(
              route: FChanRoutes.exploreBoardsScreen,
            ),
          ),
        ],
      ),
      NavigationPage(
        HistoryScreen(),
        fChanWords.historyTitle,
        BottomNavigationBarItem(
          label: fChanWords.historyTitle,
          icon: Icon(Icons.history),
        ),
        [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async => await Provider.of<HistoryModel>(context, listen: false).clearHistory(),
          ),
        ],
      ),
      NavigationPage(
        SettingsScreen(),
        fChanWords.settingsTitle,
        BottomNavigationBarItem(
          label: fChanWords.settingsTitle,
          icon: Icon(Icons.settings),
        ),
        [],
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
        route: FChanRoutes.homeScreen,
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

  NavigationPage(
    this.screen,
    this.title,
    this.bottomNavigationBarItem,
    this.actions,
  );
}
