import 'dart:convert';

import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/api/4chan_api.dart';
import 'package:http/http.dart';

class FChanApi extends ChanApi {
  @override
  Future<List<Board>> fetchBoards() async {
    final response = await get('https://a.4cdn.org/boards.json');
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      final rawBoards = body['boards'];
      List<Board> parsedBoards = [];
      for (var rawBoard in rawBoards) {
        parsedBoards.add(
          Board.fromJson(rawBoard)
        );
      }
      return parsedBoards;
    } else {
      throw Exception('Cannot fetch boards from https://a.4cdn.org/boards.json');
    }
  }

  @override
  Future<List<Thread>> fetchCatalogPage(Board board) async {
    final response = await get("https://a.4cdn.org/${board.board}/catalog.json");
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Thread> parsedThreads = [];
      for (var rawCatalog in body) {
        List<dynamic> rawThreads = rawCatalog['threads'];
        rawThreads.forEach((element) {
          parsedThreads.add(
              Thread.fromJson(
                element,
                board,
              )
          );
        });
      }
      return parsedThreads;
    } else {
      throw Exception('Cannot fetch boards from https://a.4cdn.org/boards.json');
    }
  }

  @override
  Future<List<Post>> fetchPosts(Board board, Thread thread) async {
    final response = await get("https://a.4cdn.org/${board.board}/thread/${thread.no}.json");
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['posts'];
      List<Post> parsedPosts = [];
      for (var rawPost in body) {
        parsedPosts.add(
          Post.fromJson(
              rawPost,
              board,
          )
        );
      }
      return parsedPosts;
    } else {
      throw Exception('Cannot fetch boards from https://a.4cdn.org/boards.json');
    }
  }
}
