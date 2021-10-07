import 'package:fchan/bloc/thread/thread_bloc.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_post_card.dart';
import 'package:fchan/data/repositories/data_repository.dart';
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
            return const AppCenteredCircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => context.read<ThreadBloc>().add(
                ThreadEventThreadRefreshRequested(),
              ),
        ),
      ),
    );
  }
}
