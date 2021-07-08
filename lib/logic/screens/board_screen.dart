import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../components/widgets/centered_text_widget.dart';
import '../../components/widgets/thread_widget.dart';
import '../../components/words/fchan_words.dart';
import '../../entities/board.dart';
import '../../entities/thread.dart';
import '../../provider/catalog_model.dart';
import '../../provider/history_model.dart';
import '../listcontroller/list_entity.dart';
import '../listcontroller/list_portion_controller.dart';

class BoardScreen extends StatefulWidget {
  final Board _board;

  BoardScreen(this._board);

  @override
  State<StatefulWidget> createState() => _BoardState();
}

class _BoardState extends State<BoardScreen> {
  late ListPortionController _listPortionController;

  final ScrollController _scrollController = ScrollController();
  bool showFab = true;

  @override
  void initState() {
    super.initState();
    _listPortionController = ListPortionController<Thread>(
      (entityPage) => context.read<CatalogModel>().catalogPage(
            widget._board,
            entityPage,
          ),
    );
    _loadMore();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _loadMore();
      } else {
        setState(() {
          showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
        });
      }
    });
  }

  void _loadMore() => _listPortionController.loadMore().then((value) => setState(() {}));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._board.toString(),
        ),
      ),
      body: _catalogPresentation(context.read<FChanWords>()),
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

  void _refresh() => _listPortionController.refresh().then((value) => _loadMore());

  // ignore: avoid-returning-widgets
  Widget _catalogPresentation(FChanWords fChanWords) {
    final items = _listPortionController.items;
    if (items.isEmpty) {
      if (_listPortionController.isLoading) {
        return CenteredCircularProgressIndicatorWidget();
      }
      return CenteredTextWidget(
        text: fChanWords.catalogIsEmpty,
      );
    }
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      itemBuilder: (context, index) {
        final item = items[index];
        if (item == listLoader) {
          // TODO: set at center
          return CenteredCircularProgressIndicatorWidget();
        }
        final thread = item.item;
        return ThreadWidget(
          thread: thread,
          threadClickAdditionalAction: () async =>
              Provider.of<HistoryModel>(context, listen: false).addToHistory(thread),
          availableActions: [
            ThreadPopupMenuAction.openLink,
            ThreadPopupMenuAction.copyLink,
          ],
        );
      },
      itemCount: items.length,
      controller: _scrollController,
    );
  }
}
