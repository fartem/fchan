import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../components/routes/fchan_routes.dart';
import '../components/themes/fchan_themes.dart';
import '../data/repositories/data_repository.dart';
import '../entities/board.dart';
import '../entities/thread.dart';
import '../extensions/build_context_extensions.dart';
import '../screens/board_screen.dart';
import '../screens/explore_boards_screen.dart';
import '../screens/favorite_boards_screen.dart';
import '../screens/history_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/thread_screen.dart';

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
              builder: (context) => SplashScreen(),
            );
          case FChanRoutes.routeHome:
            return MaterialPageRoute(
              builder: (context) => FChan(),
            );
          case FChanRoutes.routeExploreBoards:
            return MaterialPageRoute(
              builder: (context) => ExploreBoardsScreen(),
            );
          case FChanRoutes.routeBoard:
            return MaterialPageRoute(
              builder: (context) => BoardScreen(
                board: settings.arguments as Board,
              ),
            );
          case FChanRoutes.routeThread:
            return MaterialPageRoute(
              builder: (context) => ThreadScreen(
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
  final _currentScreen = ValueNotifier<int>(0);
  final screens = [
    FavoriteBoardsScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentScreen,
      builder: (context, currentScreen, child) {
        return Scaffold(
          body: screens[currentScreen],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentScreen.value,
            // TODO: performance?
            items: [
              BottomNavigationBarItem(
                label: context.localizations.titleHome,
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: context.localizations.titleHistory,
                icon: Icon(Icons.history),
              ),
            ],
            onTap: (page) => _currentScreen.value = page,
          ),
        );
      },
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
