import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart';

import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';
import '../../entities/web_image.dart';
import '../../extensions/int_extensions.dart';
import 'chan_api.dart';

class FChanApi extends ChanApi {
  static final _boardsCache = <String, Board>{};
  static final _threadsCache = <String, List<Thread>>{};

  static final _threadPageSize = 15;

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
    final threads = _threadsCache[board.board];
    if (threads == null) {
      final uri = _cdnUri('${board.board}/catalog.json');
      final response = await _client.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        final parsedThreads = <Thread>[];
        body.forEach((page) => page['threads'].forEach((thread) => parsedThreads.add(_threadFromJson(board, thread))));
        _threadsCache[board.board] = parsedThreads;
        return EntityPortion<Thread>(
          parsedThreads.sublist(0, min(parsedThreads.length, _threadPageSize)),
          parsedThreads.length == _threadPageSize,
        );
      } else {
        throw HttpException('Cannot fetch threads from $uri');
      }
    } else {
      final startIndex = entityPage.page == 1 ? 0 : (entityPage.page - 1) * _threadPageSize;
      final endIndex = startIndex + _threadPageSize;
      final portion = threads.sublist(
        startIndex,
        startIndex + min(_threadPageSize, threads.length - endIndex),
      );
      return EntityPortion<Thread>(
        portion,
        portion.isEmpty,
      );
    }
  }

  Thread _threadFromJson(Board board, Map<String, dynamic> json) {
    final filename = json['filename'] as String;
    final tim = json['tim'] as int;
    final ext = json['ext'] as String;
    return Thread(
      board,
      json['no'],
      json['sub'],
      json['com'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      json['replies'],
      json['images'],
      filename != null ? WebImage(_cdnImageUri('/${board.board}/$tim$ext').toString(), json['w'], json['h']) : null,
      filename != null
          ? WebImage(_cdnImageUri('/${board.board}/${tim}s.jpg').toString(), json['tn_w'], json['tn_h'])
          : null,
      ext,
      null,
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
      filename != null ? WebImage(_cdnImageUri('/${board.board}/$tim$ext').toString(), json['w'], json['h']) : null,
      filename != null
          ? WebImage(_cdnImageUri('/${board.board}/${tim}s.jpg').toString(), json['tn_w'], json['tn_h'])
          : null,
      ext,
    );
  }

  @override
  String threadLink(Thread thread) {
    return Uri.https(
      'boards.4channel.org',
      '${thread.board.board}/thread/${thread.no}',
    ).toString();
  }
}
