import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../components/widgets/centered_text_widget.dart';
import '../../components/widgets/thread_widget.dart';
import '../../components/words/fchan_words.dart';
import '../../entities/thread.dart';
import '../../provider/history_model.dart';
import '../listcontroller/list_entity.dart';
import '../listcontroller/list_portion_controller.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  late ListPortionController? _listPortionController;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listPortionController = ListPortionController<Thread>(
      (entityPage) => context.read<HistoryModel>().historyPage(entityPage),
    );
    _loadMore();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _loadMore();
      }
    });
    context.read<HistoryModel>().addListener(() => _listPortionController?.refresh());
  }

  void _loadMore() => _listPortionController!.loadMore().then((value) => setState(() {}));

  @override
  Widget build(BuildContext context) {
    final fChanWords = context.read<FChanWords>();
    final items = _listPortionController!.items;
    if (_listPortionController!.isLoading && items.isEmpty) {
      return CenteredCircularProgressIndicatorWidget();
    } else if (items.isEmpty) {
      return CenteredTextWidget(
        text: fChanWords.historyIsEmptyMessage,
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
          threadClickAdditionalAction: () {},
          availableActions: ThreadPopupMenuAction.values,
          deleteAction: () async {
            await Provider.of<HistoryModel>(context, listen: false).removeFromHistory(thread);
            setState(() => items.remove(item));
          },
        );
      },
      itemCount: items.length,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
