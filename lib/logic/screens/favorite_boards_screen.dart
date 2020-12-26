import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../entities/board.dart';
import '../../extensions/build_context_extensions.dart';
import '../repository/repository.dart';
import '../routes/fchan_route.dart';
import '../widgets/centered_circular_progress_indicator_widget.dart';
import '../widgets/centered_text_widget.dart';

class FavoriteBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteBoardsState();
}

class _FavoriteBoardsState extends State<FavoriteBoardsScreen> {
  final FChanRepository _fChanRepository = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Board>>(
      future: _fChanRepository.favoriteBoards(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return CenteredTextWidget(
              context.fChanWords().boardsIsEmptyMessage,
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => _boardListItem(
              context,
              snapshot.data[index],
            ),
            itemCount: snapshot.data.length,
          );
        } else if (snapshot.hasError) {
          return CenteredTextWidget('');
        }
        return CenteredCircularProgressIndicatorWidget();
      },
    );
  }

  Widget _boardListItem(BuildContext context, Board board) {
    return ListTile(
      title: Text(board.toString()),
      onTap: () => context.push(
        FChanRoute.boardScreen,
        arguments: board,
      ),
    );
  }
}
