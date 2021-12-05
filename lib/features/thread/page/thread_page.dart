import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_post_card.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/features/thread/stores/thread_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ThreadPage extends StatefulWidget {
  final Thread thread;

  const ThreadPage({
    required this.thread,
    Key? key,
  }) : super(key: key);

  @override
  _ThreadPageState createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  ThreadStore? _threadStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _threadStore ??= Provider.of<ThreadStore>(context);
    _threadStore!.init(widget.thread);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.thread.toString(),
        ),
      ),
      body: Observer(
        builder: (_) {
          switch (_threadStore!.initFuture!.status) {
            case FutureStatus.pending:
              return AppCenteredText(
                text: context.localizations.messageThreadIsEmpty,
              );
            case FutureStatus.rejected:
              return AppCenteredText(
                text: context.localizations.messageThreadIsEmpty,
              );
            case FutureStatus.fulfilled:
              final posts = _threadStore!.posts;
              return ListView.builder(
                itemBuilder: (context, index) => AppPostCard(
                  post: posts[index],
                ),
                itemCount: posts.length,
              );
          }
        },
      ),
    );
  }
}
