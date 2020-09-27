import 'dart:async';

import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/extensions/int_extensions.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:fchan/logic/gallery/gallery.dart';
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
  static final int _timeToRefreshInSeconds = 120;

  final ChanApi _chanApi = GetIt.I.get();
  final Gallery _gallery = GetIt.I.get();

  final ScrollController _scrollController = ScrollController();
  bool _showFab = true;

  Timer _timer;
  int time = _timeToRefreshInSeconds;

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
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (time == 0) {
          time = _timeToRefreshInSeconds;
        }
        setState(() {
          time--;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _thread.toString(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: _chanApi.fetchPosts(_thread.board, _thread),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return Text(
                  context.fChanWords().boardsIsEmptyMessage,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => PostWidget(snapshot.data[index]),
                itemCount: snapshot.data.length,
                controller: _scrollController,
              );
            } else if (snapshot.hasError) {
              return Text(
                context.fChanWords().postsLoadErrorMessage,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: _showFab,
        child: FloatingActionButton(
          child: Text(
            '${context.fChanWords().commonRefreshText}\n${time.secondsToTime()}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          onPressed: () {
            time = _timeToRefreshInSeconds;
          },
        ),
      ),
    );
  }
}
