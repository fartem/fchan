import 'package:fchan/components/routes/fchan_routes.dart';
import 'package:fchan/components/themes/fchan_themes.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/screens/board_screen.dart';
import 'package:fchan/screens/bookmarks_screen.dart';
import 'package:fchan/screens/explore_boards_screen.dart';
import 'package:fchan/screens/favorite_boards_screen.dart';
import 'package:fchan/screens/history_screen.dart';
import 'package:fchan/screens/splash_screen.dart';
import 'package:fchan/screens/thread_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FChanApp extends StatefulWidget {
  const FChanApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FChanAppState();
}

class FChanAppState extends State<FChanApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case routeInit:
              return MaterialPageRoute(
                builder: (context) => SplashScreen(),
              );
            case routeHome:
              return MaterialPageRoute(
                builder: (context) => const FChan(),
              );
            case routeExploreBoards:
              return MaterialPageRoute(
                builder: (context) => ExploreBoardsScreen(),
              );
            case routeBoard:
              return MaterialPageRoute(
                builder: (context) => BoardScreen(
                  board: settings.arguments as Board,
                ),
              );
            case routeThread:
              return MaterialPageRoute(
                builder: (context) => ThreadScreen(
                  thread: settings.arguments as Thread,
                ),
              );
            default:
              return null;
          }
        },
        initialRoute: routeInit,
        title: 'FChan',
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );

  @override
  void dispose() {
    context.read<DataRepository>().dispose();
    super.dispose();
  }
}

class FChan extends StatefulWidget {
  const FChan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FChanState();
}

class _FChanState extends State<FChan> {
  final _currentScreen = ValueNotifier<int>(0);
  final screens = [
    const FavoritesScreen(),
    const BookmarksScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<int>(
        valueListenable: _currentScreen,
        builder: (context, currentScreen, child) => Scaffold(
          body: screens[currentScreen],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentScreen.value,
            items: [
              BottomNavigationBarItem(
                label: context.localizations.titleHome,
                icon: const Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: context.localizations.titleBookmarks,
                icon: const Icon(Icons.bookmarks),
              ),
              BottomNavigationBarItem(
                label: context.localizations.titleHistory,
                icon: const Icon(Icons.history),
              ),
            ],
            onTap: (page) => _currentScreen.value = page,
          ),
        ),
      );
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
