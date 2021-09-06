import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  late ThreadBloc _threadBloc;
  bool _showFab = true;

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
            _threadBloc = context.read<ThreadBloc>();
            if (state is ThreadPostsLoadSuccess) {
              if (state.posts.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageThreadIsEmpty,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => AppPostCard(
                  key: ValueKey(state.posts[index].tim),
                  post: state.posts[index],
                ),
                itemCount: state.posts.length,
                controller: _scrollController,
              );
            }
            return AppCenteredCircularProgressIndicator();
          },
        ),
        floatingActionButton: Visibility(
          visible: _showFab,
          child: FloatingActionButton(
            child: Icon(
              Icons.refresh,
            ),
            onPressed: () => _threadBloc.add(
              ThreadEventThreadRefreshRequested(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() => _showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
