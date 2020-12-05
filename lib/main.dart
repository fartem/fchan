import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'extensions/build_context_extensions.dart';
import 'logic/api/fchan_api.dart';
import 'logic/db/sqflite_database.dart';
import 'logic/repository/repository.dart';
import 'logic/routes/fchan_route.dart';
import 'logic/screens/board_screen.dart';
import 'logic/screens/explore_boards_screen.dart';
import 'logic/screens/favorite_boards_screen.dart';
import 'logic/screens/history_screen.dart';
import 'logic/screens/thread_screen.dart';
import 'logic/theme/fchan_theme.dart';
import 'logic/words/fchan_words.dart';
import 'provider/boards_model.dart';
import 'provider/history_model.dart';

void main() {
  final getIt = GetIt.I;
  getIt.registerSingleton<FChanRepository>(
    FChanRepository(
      SQFLiteDatabase(),
      FChanApi(Client()),
    )
  );
  getIt.registerSingleton<FChanWords>(FChanWordsImpl());
  runApp(FChanApp());
}

class FChanApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FChanAppState();
}

class FChanAppState extends State<FChanApp> {
  @override
  Widget build(BuildContext context) {
    final theme = FChanTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BoardsModel(
            GetIt.I.get(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryModel(
            GetIt.I.get(),
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
                    settings.arguments,
                )
              );
            case FChanRoute.threadScreen:
              return MaterialPageRoute(
                builder: (context) => ThreadScreen(
                  settings.arguments,
                )
              );
            default:
              return null;
          }
        },
        initialRoute: FChanRoute.initScreen,
        title: 'FChan',
        theme: theme.light,
        darkTheme: theme.dark,
        themeMode: ThemeMode.system,
      ),
    );
  }

  @override
  void dispose() {
    final fChanRepository = GetIt.I.get<FChanRepository>();
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
        FavoriteBoardsScreen(),
        context.fChanWords().boardsTitle,
        BottomNavigationBarItem(
          label: context.fChanWords().homeTitle,
          icon: Icon(Icons.home),
        ),
        [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => context.push(FChanRoute.exploreBoardsScreen),
          ),
        ],
      ),
      NavigationPage(
        HistoryScreen(),
        context.fChanWords().historyTitle,
        BottomNavigationBarItem(
          label: context.fChanWords().historyTitle,
          icon: Icon(Icons.history),
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
        onTap: (selectedIndex) {
          setState(() => _currentIndex = selectedIndex);
        },
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
    final fChanRepository = GetIt.I.get<FChanRepository>();
    Future.microtask(() => fChanRepository.init()).then((fChanDatabase) {
      context.pushReplace(
        FChanRoute.homeScreen,
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
