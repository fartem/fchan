import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/feature/feature_flag.dart';
import 'package:fchan/logic/api/fchan_api.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:fchan/logic/db/fake_database.dart';
import 'package:fchan/logic/gallery/fake_gallery.dart';
import 'package:fchan/logic/gallery/gallery.dart';
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
import 'package:fchan/provider/gallery_model.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'logic/api/chan_api.dart';

void main() {
  final GetIt getIt = GetIt.I;
  getIt.registerSingleton<ChanApi>(FChanApi());
  getIt.registerSingleton<Database>(FakeDatabase());
  getIt.registerSingleton<FChanWords>(FChanWordsImpl());
  getIt.registerSingleton<Gallery>(FakeGallery());
  runApp(FChanApp());
}

class FChanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteBoardsModel(
            GetIt.I.get(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryModel(
            GetIt.I.get(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookmarkThreadsModel(
            GetIt.I.get(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => GalleryModel(
            GetIt.I.get(),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
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
        initialRoute: FChanRoute.homeScreen,
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
        BottomNavigationBarItem(
          title: Text(
            context.fChanWords().homeTitle,
          ),
          icon: Icon(Icons.home),
        ),
      ),
      NavigationPage(
        HistoryScreen(),
        context.fChanWords().historyTitle,
        BottomNavigationBarItem(
          title: Text(
            context.fChanWords().historyTitle,
          ),
          icon: Icon(Icons.history),
        ),
      ),
      if (FChanFeatureFlag.showGallery)
        NavigationPage(
          GalleryScreen(),
          context.fChanWords().galleryTitle,
          BottomNavigationBarItem(
            title: Text(
              context.fChanWords().galleryTitle,
            ),
            icon: Icon(Icons.image),
          ),
        ),
      NavigationPage(
        BookmarksScreen(),
        context.fChanWords().bookmarksTitle,
        BottomNavigationBarItem(
          title: Text('Bookmarks'),
          icon: Icon(Icons.bookmark),
        ),
      ),
      if (FChanFeatureFlag.showSettings)
        NavigationPage(
          SettingsScreen(),
          context.fChanWords().settingsTitle,
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
          ),
        ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _screens[_currentIndex].title,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => context.push(FChanRoute.exploreBoardsScreen),
          ),
        ],
      ),
      body: _screens[_currentIndex].screen,
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

class NavigationPage {
  final StatefulWidget screen;
  final String title;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationPage(
      this.screen,
      this.title,
      this.bottomNavigationBarItem,
  );
}
