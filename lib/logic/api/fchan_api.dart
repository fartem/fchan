import 'dart:convert';
import 'dart:io';

import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/int_extensions.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:http/http.dart';

class FChanApi extends ChanApi {
  static final _boardsCache = <String, Board>{};

  static final _cdnUrl = 'https://a.4cdn.org';
  static final _imageCdnUrl = 'https://i.4cdn.org';

  final Client _client;

  FChanApi(this._client);

  @override
  Future<List<Board>> fetchBoards() async {
    final boardsUrl = '$_cdnUrl/boards.json';
    final response = await _client.get(boardsUrl);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['boards'] as List)
          .map((rawBoard) => _boardFromJson(rawBoard))
          .toList();
    } else {
      throw HttpException('Cannot fetch boards from $boardsUrl');
    }
  }

  Board _boardFromJson(Map<String, dynamic> json) {
    final boardName = json['board'];
    Board board = _boardsCache[boardName];
    if (board == null) {
      board = Board(
        json['board'],
        json['title'],
        false,
      );
      _boardsCache[boardName] = board;
    }
    return board;
  }

  @override
  Future<List<Thread>> fetchCatalog(Board board) async {
    final threadsUrl = '$_cdnUrl/${board.board}/catalog.json';
    final response = await _client.get(threadsUrl);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Thread> parsedThreads = [];
      for (var rawCatalog in body) {
        parsedThreads.addAll(
            (rawCatalog['threads'] as List)
                .map((rawThread) => _threadFromJson(board, rawThread))
                .toList()
        );
      }
      return parsedThreads;
    } else {
      throw HttpException('Cannot fetch threads from $threadsUrl');
    }
  }

  Thread _threadFromJson(Board board, Map<String, dynamic> json) {
    final filename = json['filename'] as String;
    final tim = json['tim'] as int;
    final ext = json['ext'] as String;
    return Thread(
      board,
      '$_cdnUrl/${board.board}/thread/${json['no']}',
      json['no'],
      json['sub'],
      json['com'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      json['replies'],
      json['images'],
      filename != null ? '$_imageCdnUrl/${board.board}/$tim$ext' : null,
      json['w'],
      json['h'],
      filename != null ? '$_imageCdnUrl/${board.board}/${tim}s.jpg' : null,
      json['tn_w'],
      json['tn_h'],
      ext,
    );
  }

  @override
  Future<List<Post>> fetchPosts(Thread thread) async {
    final postsUrl = '$_cdnUrl/${thread.board.board}/thread/${thread.no}.json';
    final response = await _client.get(postsUrl);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['posts'] as List)
          .map((rawPost) => _postFromJson(thread.board, rawPost))
          .toList();
    } else {
      throw HttpException('Cannot fetch posts from $postsUrl');
    }
  }

  Post _postFromJson(Board board, Map<String, dynamic> json) {
    final filename = json['filename'] as String;
    final tim = json['tim'] as int;
    final ext = json['ext'] as String;
    return Post(
      json['no'],
      json['sub'],
      json['com'],
      json['replies'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      filename != null ? '$_imageCdnUrl/${board.board}/$tim$ext' : null,
      json['w'],
      json['h'],
      filename != null ? '$_imageCdnUrl/${board.board}/${tim}s.jpg' : null,
      json['tn_w'],
      json['tn_h'],
      ext,
    );
  }
}
