import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'components/themes/fchan_themes.dart';
import 'components/words/fchan_words.dart';
import 'entities/board.dart';
import 'entities/thread.dart';
import 'extensions/build_context_extensions.dart';
import 'logic/db/impl/sqflite_database.dart';
import 'logic/fchanapi/impl/fchan_impl.dart';
import 'logic/repository/fchan_repository.dart';
import 'logic/routes/fchan_route.dart';
import 'logic/screens/board_screen.dart';
import 'logic/screens/explore_boards_screen.dart';
import 'logic/screens/favorite_boards_screen.dart';
import 'logic/screens/history_screen.dart';
import 'logic/screens/settings_screen.dart';
import 'logic/screens/thread_screen.dart';
import 'provider/catalog_model.dart';
import 'provider/favorite_boards_model.dart';
import 'provider/history_model.dart';
import 'provider/thread_model.dart';

void main() {
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
        Provider<FChanRepository>(
          create: (_) => FChanRepository(
            SQFLiteDatabase(),
            FChanApiImpl(
              Client(),
            ),
          ),
        ),
        Provider<FChanWords>(
          create: (_) => FChanWordsImpl(),
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
    final fChanRepository = context.read<FChanRepository>();
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
            case FChanRoute.initScreen:
              return MaterialPageRoute(
                builder: (context) => FChanInit(),
              );
            case FChanRoute.homeScreen:
              return MaterialPageRoute(
                builder: (context) => FChan(),
              );
            case FChanRoute.exploreBoardsScreen:
              return MaterialPageRoute(
                builder: (context) => ExploreBoardsScreen(),
              );
            case FChanRoute.boardScreen:
              return MaterialPageRoute(
                builder: (context) => BoardScreen(
                  settings.arguments as Board,
                ),
              );
            case FChanRoute.threadScreen:
              return MaterialPageRoute(
                builder: (context) => ThreadScreen(
                  settings.arguments as Thread,
                ),
              );
            default:
              return null;
          }
        },
        initialRoute: FChanRoute.initScreen,
        title: 'FChan',
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.system,
      ),
    );
  }

  @override
  void dispose() {
    final fChanRepository = context.read<FChanRepository>();
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
        FavoriteBoardsScreen(),
        fChanWords.boardsTitle,
        BottomNavigationBarItem(
          label: fChanWords.homeTitle,
          icon: Icon(Icons.home),
        ),
        [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => context.push(
              route: FChanRoute.exploreBoardsScreen,
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
    final fChanRepository = context.read<FChanRepository>();
    Future.microtask(() => fChanRepository.init()).then((fChanDatabase) {
      context.pushReplace(
        route: FChanRoute.homeScreen,
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
  final StatefulWidget screen;
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
