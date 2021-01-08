import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../components/widgets/centered_text_widget.dart';
import '../../components/widgets/post_widget.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../provider/thread_model.dart';

class ThreadScreen extends StatefulWidget {
  final Thread _thread;

  ThreadScreen(this._thread);

  @override
  State<StatefulWidget> createState() => _ThreadState();
}

class _ThreadState extends State<ThreadScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = true;

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
    return Consumer<ThreadModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            widget._thread.toString(),
          ),
        ),
        body: FutureBuilder<List<Post>>(
          future: model.postsForThread(widget._thread),
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
            child: Icon(
              Icons.refresh,
            ),
            onPressed: () => setState(() {}),
          ),
        ),
      );
    });
  }
}
