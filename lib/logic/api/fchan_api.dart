import 'dart:convert';
import 'dart:io';

import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/int_extensions.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:http/http.dart';

class FChanApi extends ChanApi {
  static final _boardsCache = <String, Board>{};

  final Client _client;

  FChanApi(this._client);

  @override
  Future<List<Board>> fetchBoards() async {
    final uri = _cdnUri('boards.json');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['boards'] as List)
          .map((rawBoard) => _boardFromJson(rawBoard))
          .toList();
    } else {
      throw HttpException('Cannot fetch boards from $uri');
    }
  }

  Uri _cdnUri(String path) {
    return Uri.https(
      'a.4cdn.org',
      path,
    );
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
  Future<EntityPortion<Thread>> fetchCatalog(
      Board board,
      EntityPage entityPage,
  ) async {
    final uri = _cdnUri('${board.board}/${entityPage.page}.json');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<Thread> parsedThreads = (body['threads'] as List)
          .map((posts) => _threadFromJson(board, posts['posts'].first))
          .toList();
      return EntityPortion<Thread>(
        parsedThreads,
        entityPage.page == 10,
      );
    } else {
      throw HttpException('Cannot fetch threads from $uri');
    }
  }

  Thread _threadFromJson(Board board, Map<String, dynamic> json) {
    final filename = json['filename'] as String;
    final tim = json['tim'] as int;
    final ext = json['ext'] as String;
    return Thread(
      board,
      _cdnUri('${board.board}/thread/${json['no']}').toString(),
      json['no'],
      json['sub'],
      json['com'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      json['replies'],
      json['images'],
      filename != null ? _cdnImageUri('/${board.board}/$tim$ext').toString() : null,
      json['w'],
      json['h'],
      filename != null ? _cdnImageUri('${board.board}/${tim}s.jpg').toString() : null,
      json['tn_w'],
      json['tn_h'],
      ext,
    );
  }

  Uri _cdnImageUri(String path) {
    return Uri.https(
      'i.4cdn.org',
      path,
    );
  }

  @override
  Future<List<Post>> fetchPosts(Thread thread) async {
    final uri = _cdnUri('/${thread.board.board}/thread/${thread.no}.json');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['posts'] as List)
          .map((rawPost) => _postFromJson(thread.board, rawPost))
          .toList();
    } else {
      throw HttpException('Cannot fetch posts from $uri');
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
      filename != null ? _cdnImageUri('/${board.board}/$tim$ext').toString() : null,
      json['w'],
      json['h'],
      filename != null ? _cdnUri('/${board.board}/${tim}s.jpg').toString() : null,
      json['tn_w'],
      json['tn_h'],
      ext,
    );
  }
}
