import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/thread/thread_bloc.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../components/widgets/app_post_card.dart';
import '../data/repositories/data_repository.dart';
import '../entities/thread.dart';
import '../extensions/build_context_extensions.dart';

class ThreadScreen extends StatefulWidget {
  final Thread thread;

  const ThreadScreen({
    Key? key,
    required this.thread,
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
        dataRepository: context.read<DataRepository>(),
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
            if (state is ThreadPostsLoadSuccess) {
              if (state.posts.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageThreadIsEmpty,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => AppPostCard(
                  post: state.posts[index],
                ),
                itemCount: state.posts.length,
                controller: _scrollController,
              );
            }
            return AppCenteredCircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
          ),
          onPressed: () => context.read<ThreadBloc>().add(
                ThreadEventThreadRefreshRequested(),
              ),
        ),
      ),
    );
  }
}
