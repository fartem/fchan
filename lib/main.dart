import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/api/fchan_api.dart';
import 'package:fchan/logic/db/sqflite_database.dart';
import 'package:fchan/logic/gallery/fake_gallery.dart';
import 'package:fchan/logic/gallery/gallery.dart';
import 'package:fchan/logic/repository/repository.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/logic/screens/board_screen.dart';
import 'package:fchan/logic/screens/explore_boards_screen.dart';
import 'package:fchan/logic/screens/favorite_boards_screen.dart';
import 'package:fchan/logic/screens/history_screen.dart';
import 'package:fchan/logic/screens/thread_screen.dart';
import 'package:fchan/logic/theme/fchan_theme.dart';
import 'package:fchan/logic/words/fchan_words.dart';
import 'package:fchan/provider/boards_model.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  final GetIt getIt = GetIt.I;
  getIt.registerSingleton<FChanRepository>(
    FChanRepository(
      SQFLiteDatabase(),
      FChanApi(Client()),
    )
  );
  getIt.registerSingleton<FChanWords>(FChanWordsImpl());
  getIt.registerSingleton<Gallery>(FakeGallery());
  runApp(FChanApp());
}

class FChanApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FChanAppState();
}

class FChanAppState extends State<FChanApp> {
  @override
  Widget build(BuildContext context) {
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
        theme: FChanTheme.light,
        darkTheme: FChanTheme.dark,
        themeMode: ThemeMode.system,
      ),
    );
  }

  @override
  void dispose() {
    FChanRepository fChanRepository = GetIt.I.get();
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
    final List<NavigationPage> _screens = [
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
    NavigationPage currentPage = _screens[_currentIndex];
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
          setState(() {
            _currentIndex = selectedIndex;
          });
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
    FChanRepository fChanRepository = GetIt.I.get();
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
