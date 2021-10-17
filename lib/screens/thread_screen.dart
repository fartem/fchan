import 'package:fchan/bloc/thread/thread_bloc.dart';
import 'package:fchan/bloc/thread/thread_event.dart';
import 'package:fchan/bloc/thread/thread_state.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_post_card.dart';
import 'package:fchan/data/repositories/api/posts_repository.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadScreen extends StatefulWidget {
  final Thread thread;

  const ThreadScreen({
    required this.thread,
    Key? key,
  }) : super(key: key);

  @override
  _ThreadScreenState createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThreadBloc>(
      create: (context) => ThreadBloc(
        postsRepository: context.read<PostsRepository>(),
        thread: widget.thread,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.thread.toString(),
          ),
        ),
        body: BlocBuilder<ThreadBloc, ThreadState>(
          builder: (context, state) {
            return state.when(
              initial: () => const AppCenteredCircularProgressIndicator(),
              loadSuccess: (posts) {
                return ListView.builder(
                  itemBuilder: (context, index) => AppPostCard(
                    post: posts[index],
                  ),
                  itemCount: posts.length,
                  controller: _scrollController,
                );
              },
              loadError: () => AppCenteredText(
                text: context.localizations.messageThreadIsEmpty,
              ),
              threadsListIsEmpty: () => AppCenteredText(
                text: context.localizations.messageThreadIsEmpty,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => context.read<ThreadBloc>().add(
                const ThreadEventRefreshRequested(),
              ),
        ),
      ),
    );
  }
}
