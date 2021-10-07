import 'package:fchan/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:fchan/components/listcontroller/list_entity.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_screen_frame.dart';
import 'package:fchan/components/widgets/app_thread_card.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          icon: const Icon(Icons.delete),
          onPressed: () => showDialog(
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
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                itemBuilder: (context, index) {
                  final item = _bookmarksBloc.threads[index];
                  if (item == listLoader) {
                    return const AppCenteredCircularProgressIndicator();
                  }
                  final thread = item.item as Thread;
                  return AppThreadCard(
                    key: ValueKey(thread.tim),
                    thread: thread,
                    availableActions: const [
                      ThreadPopupMenuAction.openLink,
                      ThreadPopupMenuAction.copyLink,
                      ThreadPopupMenuAction.removeFromBookmarks,
                    ],
                    actionNotifier: (action) {
                      if (action == ThreadPopupMenuAction.removeFromBookmarks) {
                        _bookmarksBloc.add(BookmarksEventBookmarkRemoved(thread: thread));
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
