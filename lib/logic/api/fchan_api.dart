import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';
import '../../extensions/int_extensions.dart';
import 'chan_api.dart';

class FChanApi extends ChanApi {
  static final _boardsCache = <String, Board>{};

  final Client _client;

  FChanApi(this._client);

  @override
  Future<List<Board>> fetchBoards() async {
    final uri = _cdnUri('boards.json');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['boards'] as List).map((rawBoard) => _boardFromJson(rawBoard)).toList();
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
    var board = _boardsCache[boardName];
    if (board == null) {
      board = Board.fromJson(json);
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
      final parsedThreads =
          (body['threads'] as List).map((posts) => _threadFromJson(board, posts['posts'].first)).toList();
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
    final imageLink = filename != null ? _cdnImageUri('/${board.board}/$tim$ext').toString() : null;
    final thumbnailLink = filename != null ? _cdnImageUri('/${board.board}/${tim}s.jpg').toString() : null;
    return Thread(
      board,
      _cdnUri('${board.board}/thread/${json['no']}').toString(),
      json['no'],
      json['sub'],
      json['com'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      json['replies'],
      json['images'],
      filename,
      json['w'],
      json['h'],
      json['tn_w'],
      json['tn_h'],
      ext,
    )
      ..imageLink = imageLink
      ..thumbnailLink = thumbnailLink;
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
    final imageLink = filename != null ? _cdnImageUri('/${board.board}/$tim$ext').toString() : null;
    final thumbnailLink = filename != null ? _cdnImageUri('/${board.board}/${tim}s.jpg').toString() : null;
    return Post(
      json['no'],
      json['sub'],
      json['com'],
      json['replies'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      filename,
      json['w'],
      json['h'],
      json['tn_w'],
      json['tn_h'],
      ext,
    )
      ..imageLink = imageLink
      ..thumbnailLink = thumbnailLink;
  }
}
