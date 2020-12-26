import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../entities/board.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/theme_extensions.dart';
import '../repository/repository.dart';
import '../widgets/centered_circular_progress_indicator_widget.dart';
import '../widgets/centered_text_widget.dart';

class ExploreBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreBoardsState();
}

class _ExploreBoardsState extends State<ExploreBoardsScreen> {
  final FChanRepository _fChanRepository = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.fChanWords().exploreBoardsTitle,
        ),
      ),
      body: FutureBuilder<List<Board>>(
        future: _fChanRepository.boards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return CenteredTextWidget(
                context.fChanWords().boardsIsEmptyMessage,
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => _createBoardListItem(snapshot.data[index]),
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return CenteredTextWidget(
              context.fChanWords().commonErrorMessage,
            );
          }
          return CenteredCircularProgressIndicatorWidget();
        },
      ),
    );
  }

  Widget _createBoardListItem(Board board) {
    return ListTile(
      title: Text(board.toString()),
      trailing: Icon(
        board.isFavorite ? Icons.star : Icons.star_border,
        color: board.isFavorite ? context.accentColor : Colors.grey,
      ),
      onTap: () async {
        if (!board.isFavorite) {
          await _fChanRepository.addBoardToFavorites(board);
        } else {
          await _fChanRepository.removeBoardFromFavorites(board);
        }
        setState(() {});
      },
    );
  }
}
