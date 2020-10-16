import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/repository/repository.dart';
import 'package:fchan/logic/widgets/centered_circular_progress_indicator_widget.dart';
import 'package:fchan/logic/widgets/centered_text_widget.dart';
import 'package:fchan/logic/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

class ThreadScreen extends StatefulWidget {
  final Thread _thread;

  ThreadScreen(this._thread);

  @override
  State<StatefulWidget> createState() => _ThreadState(_thread);
}

class _ThreadState extends State<ThreadScreen> {
  final FChanRepository _fChanRepository = GetIt.I.get();

  final ScrollController _scrollController = ScrollController();
  bool _showFab = true;

  final Thread _thread;

  _ThreadState(this._thread);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _thread.toString(),
        ),
        // TODO: thread menu
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.more_vert,
        //     ),
        //     onPressed: () {
        //
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _fChanRepository.postsForThread(_thread),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return CenteredTextWidget(
                context.fChanWords().boardsIsEmptyMessage,
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => PostWidget(snapshot.data[index]),
              itemCount: snapshot.data.length,
              controller: _scrollController,
            );
          } else if (snapshot.hasError) {
            return CenteredTextWidget(
              context.fChanWords().commonErrorMessage,
            );
          }
          return CenteredCircularProgressIndicatorWidget();
        },
      ),
      floatingActionButton: Visibility(
        visible: _showFab,
        child: FloatingActionButton(
          // TODO: refactor
          // child: Text(
          //   '${context.fChanWords().commonRefreshText}',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 12,
          //   ),
          // ),
          child: Icon(
            Icons.refresh,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
