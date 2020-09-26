import 'dart:convert';

import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:http/http.dart';

class FChanApi extends ChanApi {
  @override
  Future<List<Board>> fetchBoards() async {
    final boardsUrl = 'https://a.4cdn.org/boards.json';
    final response = await get(boardsUrl);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['boards'] as List)
          .map((rawBoard) => Board.fromJson(rawBoard))
          .toList();
    } else {
      throw Exception('Cannot fetch boards from $boardsUrl');
    }
  }

  @override
  Future<List<Thread>> fetchCatalogPage(Board board) async {
    final threadsUrl = 'https://a.4cdn.org/${board.board}/catalog.json';
    final response = await get(threadsUrl);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Thread> parsedThreads = [];
      for (var rawCatalog in body) {
        parsedThreads.addAll(
            (rawCatalog['threads'] as List)
                .map((rawThread) => Thread.fromJson(rawThread, board))
                .toList()
        );
      }
      return parsedThreads;
    } else {
      throw Exception('Cannot fetch threads from $threadsUrl');
    }
  }

  @override
  Future<List<Post>> fetchPosts(Board board, Thread thread) async {
    final postsUrl = 'https://a.4cdn.org/${board.board}/thread/${thread.no}.json';
    final response = await get(postsUrl);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['posts'] as List)
          .map((rawPost) => Post.fromJson(rawPost, board))
          .toList();
    } else {
      throw Exception('Cannot fetch posts from $postsUrl');
    }
  }
}
