import 'package:fchan/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_event.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_state.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_list_loader.dart';
import 'package:fchan/components/widgets/app_screen_frame.dart';
import 'package:fchan/components/widgets/app_thread_card.dart';
import 'package:fchan/data/repositories/api/bookmarks_repository.dart';
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
      body: BlocProvider(
        create: (context) => BookmarksBloc(
          bookmarksRepository: context.read<BookmarksRepository>(),
        ),
        child: BlocBuilder<BookmarksBloc, BookmarksState>(
          builder: (context, state) {
            _bookmarksBloc = context.read<BookmarksBloc>();
            return state.when(
              initial: () => const AppCenteredCircularProgressIndicator(),
              loadSuccess: (threads, isLastPage) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                  itemBuilder: (context, index) {
                    if (!isLastPage && index == threads.length) {
                      return const AppListLoader();
                    }
                    final thread = threads[index];
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
                          _bookmarksBloc.add(BookmarksEventBookmarkRemoved(bookmark: thread));
                        }
                      },
                    );
                  },
                  itemCount: threads.length + (isLastPage ? 0 : 1),
                );
              },
              loadError: () => AppCenteredText(
                text: context.localizations.messageBookmarksIsEmpty,
              ),
              clearInProgress: () => const AppCenteredCircularProgressIndicator(),
              bookmarksListIsEmpty: () => AppCenteredText(
                text: context.localizations.messageBookmarksIsEmpty,
              ),
            );
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
        _bookmarksBloc.add(const BookmarksEventPortionRequested());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
