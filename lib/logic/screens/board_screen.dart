import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../provider/history_model.dart';
import '../repository/repository.dart';
import '../widgets/centered_circular_progress_indicator_widget.dart';
import '../widgets/centered_text_widget.dart';
import '../widgets/thread_widget.dart';

class BoardScreen extends StatefulWidget {
  final Board _board;

  BoardScreen(this._board);

  @override
  State<StatefulWidget> createState() => _BoardState(_board);
}

class _BoardState extends State<BoardScreen> {
  final FChanRepository _fChanRepository = GetIt.I.get();

  final ScrollController _scrollController = ScrollController();
  bool showFab = true;

  final Board _board;
  final List<Thread> _catalog = [];

  int _page = 1;
  bool _catalogIsLoading = false;
  bool _isLastPage = false;

  _BoardState(this._board);

  @override
  void initState() {
    super.initState();
    _loadCatalog();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _loadCatalog();
      } else {
        setState(() {
          showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
        });
      }
    });
  }

  void _loadCatalog() async {
    if (!_catalogIsLoading && !_isLastPage) {
      _catalogIsLoading = true;
      final portion = await _fChanRepository.catalogForBoard(
        _board,
        EntityPage.paging(_page),
      );
      if (_catalog.isNotEmpty && _catalog.last is Loader) {
        _catalog.removeLast();
      }
      _catalogIsLoading = false;
      _isLastPage = portion.isLastPage;
      if (!_isLastPage) {
        _page++;
      }
      _catalog.addAll(portion.entities);
      if (!portion.isLastPage) {
        _catalog.add(Loader());
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _board.toString(),
        )
      ),
      body: _catalogPresentation(),
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
          child: Icon(
            Icons.refresh,
          ),
          onPressed: () => _refresh(),
        ),
      ),
    );
  }

  void _refresh() {
    setState(() {
      _catalog.clear();
      _catalogIsLoading = false;
      _isLastPage = false;
      _page = 1;
      _loadCatalog();
    });
  }

  Widget _catalogPresentation() {
    if (_catalog.isEmpty) {
      if (_catalogIsLoading) {
        return CenteredCircularProgressIndicatorWidget();
      }
      return CenteredTextWidget(
        context.fChanWords().catalogIsEmpty,
      );
    }
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      itemBuilder: (context, index) {
        final thread = _catalog[index];
        if (thread is Loader) {
          // TODO: set at center
          return CenteredCircularProgressIndicatorWidget();
        }
        return ThreadWidget(
          thread,
          () async {
            await context.read<HistoryModel>().addToHistory(thread);
          },
        );
      },
      itemCount: _catalog.length,
      controller: _scrollController,
    );
  }
}

class Loader extends Thread {
  Loader() : super(
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  );
}
