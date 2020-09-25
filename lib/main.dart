import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/api/fchan_api.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:fchan/logic/db/fake_database.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/logic/screens/board_screen.dart';
import 'package:fchan/logic/screens/bookmarks_screen.dart';
import 'package:fchan/logic/screens/explore_boards_screen.dart';
import 'package:fchan/logic/screens/favorite_boards_screen.dart';
import 'package:fchan/logic/screens/gallery_screen.dart';
import 'package:fchan/logic/screens/history_screen.dart';
import 'package:fchan/logic/screens/settings_screen.dart';
import 'package:fchan/logic/screens/thread_screen.dart';
import 'package:fchan/logic/words/fchan_words.dart';
import 'package:fchan/provider/bookmark_threads_model.dart';
import 'package:fchan/provider/favorite_boards_model.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'logic/api/4chan_api.dart';

void main() {
  final GetIt getIt = GetIt.I;
  getIt.registerSingleton<ChanApi>(FChanApi());
  getIt.registerSingleton<Database>(FakeDatabase());
  getIt.registerSingleton<FChanWords>(FChanWordsImpl());
  runApp(FChanApp());
}

class FChanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteBoardsModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookmarkThreadsModel(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case FChanRoute.initialScreen:
              return MaterialPageRoute(
                  builder: (context) {
                    return InitScreen();
                  }
              );
            case FChanRoute.homeScreen:
              return MaterialPageRoute(
                  builder: (context) {
                    return FChan();
                  }
              );
            case FChanRoute.exploreBoardsScreen:
              return MaterialPageRoute(
                builder: (context) {
                  return ExploreBoardsScreen();
                }
              );
            case FChanRoute.boardScreen:
              return MaterialPageRoute(
                builder: (context) => BoardScreen(
                    settings.arguments
                )
              );
            case FChanRoute.threadScreen:
              return MaterialPageRoute(
                builder: (context) => ThreadScreen(
                  settings.arguments
                )
              );
            default:
              return null;
          }
        },
        initialRoute: FChanRoute.initialScreen,
        title: 'FChan',
      ),
    );
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
      ),
      NavigationPage(
        HistoryScreen(),
        context.fChanWords().historyTitle,
      ),
      NavigationPage(
        GalleryScreen(),
        context.fChanWords().galleryTitle,
      ),
      NavigationPage(
        BookmarksScreen(),
        context.fChanWords().bookmarksTitle,
      ),
      NavigationPage(
        SettingsScreen(),
        context.fChanWords().settingsTitle,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _screens[_currentIndex].title
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  FChanRoute.exploreBoardsScreen,
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('History'),
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            title: Text('Gallery'),
            icon: Icon(Icons.image),
          ),
          BottomNavigationBarItem(
            title: Text('Bookmarks'),
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
      ),
    );
  }
}

class NavigationPage {
  final StatefulWidget screen;
  final String title;

  NavigationPage(
      this.screen,
      this.title
  );
}

class InitScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<InitScreen> {
  @override
  void initState() {
    super.initState();
    final Database database = GetIt.I.get();
    Future.microtask(() async {
      context.read<FavoriteBoardsModel>().refreshFavoriteBoards(
        await database.favoriteBoards(),
      );
      Navigator.pushReplacementNamed(
        context,
        FChanRoute.homeScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}
