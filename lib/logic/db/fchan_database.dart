import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';

abstract class FChanDatabase {
  Future<FChanDatabase> init();
  Future<void> close();

  Future<DataPage<Board>> favoriteBoards(Portion portion);
  Future<Board> addToFavorites(Board board);
  Future<Board> removeFromFavorites(Board board);

  Future<DataPage<Thread>> historyThreads(Portion portion);
  Future<Thread> threadFromHistory(Thread thread);
  Future<Thread> addToHistory(Thread thread);
  Future<Thread> removeFromHistory(Thread thread);

  Future<DataPage<Thread>> bookmarks(Portion portion);
  Future<Thread> addToBookmarks(Thread thread);
  Future<Thread> removeFromBookmarks(Thread thread);
}

class DataPage<T> {
  final List<T> portion;
  final bool isLastPage;

  DataPage(this.portion, this.isLastPage);
}

class Portion {
  final PortionType portionType;
  final int page;

  Portion._(this.portionType, {this.page});

  factory Portion.all() {
    return Portion._(
      PortionType.all,
    );
  }

  factory Portion.smallPage(int page) {
    return Portion._(
      PortionType.smallPage,
      page: page,
    );
  }

  factory Portion.largePage(int page) {
    return Portion._(
      PortionType.largePage,
      page: page,
    );
  }
}

enum PortionType {
  all,
  smallPage,
  largePage,
}
