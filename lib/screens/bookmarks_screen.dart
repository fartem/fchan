import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../bloc/bookmarks/bookmarks_bloc.dart';
import '../components/listcontroller/list_entity.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../components/widgets/app_screen_frame.dart';
import '../components/widgets/app_thread_card.dart';
import '../data/repositories/data_repository.dart';
import '../entities/thread.dart';
import '../extensions/build_context_extensions.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final ScrollController _scrollController = ScrollController();
  late BookmarksBloc _bookmarksBloc;

  @override
  Widget build(BuildContext context) {
    return AppScreenFrame(
      title: context.localizations.titleBookmarks,
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async => await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                context.localizations.messageHistoryClear,
              ),
              actions: [
                TextButton(
                  child: Text(
                    context.localizations.commonOk,
                  ),
                  onPressed: () {
                    _bookmarksBloc.add(BookmarksEventClearRequested());
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text(
                    context.localizations.commonCancel,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ],
      body: BlocProvider(
        create: (context) => BookmarksBloc(
          dataRepository: context.read<DataRepository>(),
        ),
        child: BlocBuilder<BookmarksBloc, BookmarksState>(
          builder: (context, state) {
            _bookmarksBloc = context.read<BookmarksBloc>();
            if (state is BookmarksLoadSuccess) {
              if (_bookmarksBloc.threads.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageBookmarksIsEmpty,
                );
              }
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) {
                  final item = _bookmarksBloc.threads[index];
                  if (item == listLoader) {
                    return const AppCenteredCircularProgressIndicator();
                  }
                  final thread = item.item as Thread;
                  return AppThreadCard(
                    key: ValueKey(thread.tim),
                    thread: thread,
                    availableActions: [
                      ThreadPopupMenuAction.openLink,
                      ThreadPopupMenuAction.copyLink,
                      ThreadPopupMenuAction.removeFromBookmarks,
                    ],
                    // TODO: change event to `Update` or similar action
                    actionNotifier: (action) {
                      if (action == ThreadPopupMenuAction.removeFromBookmarks) {
                        _bookmarksBloc.add(BookmarksEventInitialized());
                      }
                    },
                  );
                },
                itemCount: _bookmarksBloc.threads.length,
              );
            }
            return const AppCenteredCircularProgressIndicator();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _bookmarksBloc.add(BookmarksEventPortionRequested());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
