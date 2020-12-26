import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../repository/repository.dart';
import '../widgets/centered_circular_progress_indicator_widget.dart';
import '../widgets/centered_text_widget.dart';
import '../widgets/thread_widget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  final FChanRepository _fChanRepository = GetIt.I.get();

  int _page = 0;
  bool _isLoading = false;
  bool _isLastPage = false;

  final ScrollController _scrollController = ScrollController();

  final _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _loadHistory();
      }
    });
  }

  void _loadHistory() async {
    if (!_isLoading && !_isLastPage) {
      _isLoading = true;
      EntityPortion entityPortion = await _fChanRepository.history(
        EntityPage.paging(_page),
      );
      _isLastPage = entityPortion.isLastPage;
      _history.addAll(entityPortion.entities);
      _isLoading = false;
      _page++;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _history.isEmpty) {
      return CenteredCircularProgressIndicatorWidget();
    } else if (_history.isEmpty) {
      return CenteredTextWidget(
        context.fChanWords().historyIsEmptyMessage,
      );
    }
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      itemBuilder: (context, index) {
        final item = _history[index];
        if (item is Thread) {
          return ThreadWidget(
            item,
            () {},
            ThreadPopupMenuAction.values,
            () async {
              await _fChanRepository.removeThreadFromHistory(item);
              setState(() => _history.remove(item));
            },
          );
        }
        return CenteredCircularProgressIndicatorWidget();
      },
      itemCount: _history.length,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class Loader {}
