import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/widgets/centered_circular_progress_indicator.dart';
import '../../components/widgets/post_card.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';
import 'thread_bloc.dart';

class ThreadPage extends StatefulWidget {
  final Thread thread;

  const ThreadPage({
    Key? key,
    required this.thread,
  }) : super(key: key);

  @override
  _ThreadPageState createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  final ScrollController _scrollController = ScrollController();
  late ThreadBloc _threadBloc;
  bool _showFab = true;

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
              return ListView.builder(
                itemBuilder: (context, index) => PostCard(
                  post: state.posts[index],
                ),
                itemCount: state.posts.length,
                controller: _scrollController,
              );
            }
            return CenteredCircularProgressIndicator();
          },
        ),
        floatingActionButton: Visibility(
          visible: _showFab,
          child: FloatingActionButton(
              child: Icon(
                Icons.refresh,
              ),
              onPressed: () => _threadBloc.add(ThreadEventThreadRefreshRequest())),
        ),
      ),
    );
  }
}
