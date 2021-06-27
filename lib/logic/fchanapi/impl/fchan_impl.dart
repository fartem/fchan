import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart';

import '../../../entities/board.dart';
import '../../../entities/entity_page.dart';
import '../../../entities/entity_portion.dart';
import '../../../entities/post.dart';
import '../../../entities/thread.dart';
import '../../../entities/web_image.dart';
import '../../../extensions/int_extensions.dart';
import '../api/fchan_api.dart';

class FChanApiImpl extends FChanApi {
  static final _boardsCache = <String, Board>{};
  static final _threadsCache = <String, List<Thread>>{};

  static final _threadPageSize = 15;

  final Client _client;

  FChanApiImpl(this._client);

  @override
  Future<List<Board>> fetchBoards() async {
    final uri = _cdnUri('boards.json');
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['boards'] as List).map((rawBoard) => _boardFromJson(rawBoard)).toList();
    } else {
      throw HttpException(
        'Cannot fetch boards from $uri',
      );
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
        board: json['board'],
        title: json['title'],
        isFavorite: false,
      );
      _boardsCache[boardName] = board;
    }
    return board;
  }

  @override
  Future<EntityPortion<Thread>> fetchCatalog({
    required Board board,
    required EntityPage entityPage,
  }) async {
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
          entities: parsedThreads.sublist(
            0,
            min(
              parsedThreads.length,
              _threadPageSize,
            ),
          ),
          isLastPage: parsedThreads.length == _threadPageSize,
        );
      } else {
        throw HttpException(
          'Cannot fetch threads from $uri',
        );
      }
    } else {
      final startIndex = entityPage.page == 1 ? 0 : (entityPage.page - 1) * _threadPageSize;
      final endIndex = startIndex + _threadPageSize;
      final portion = threads.sublist(
        startIndex,
        startIndex +
            min(
              _threadPageSize,
              threads.length - endIndex,
            ),
      );
      return EntityPortion<Thread>(
        entities: portion,
        isLastPage: portion.isEmpty,
      );
    }
  }

  Thread _threadFromJson(
    Board board,
    Map<String, dynamic> json,
  ) {
    final filename = json['filename'] as String?;
    final tim = json['tim'] as int?;
    final ext = json['ext'] as String;
    return Thread(
      board: board,
      no: json['no'],
      sub: json['sub'],
      com: json['com'],
      timeFromPublish: DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      replies: json['replies'],
      images: json['images'],
      image: filename != null
          ? WebImage(
              url: _cdnImageUri('/${board.board}/$tim$ext').toString(),
              width: json['w'],
              height: json['h'],
            )
          : null,
      thumbnail: filename != null
          ? WebImage(
              url: _cdnImageUri('/${board.board}/${tim}s.jpg').toString(),
              height: json['tn_w'],
              width: json['tn_h'],
            )
          : null,
      ext: ext,
      lastSeenDate: null,
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
      throw HttpException(
        'Cannot fetch posts from $uri',
      );
    }
  }

  Post _postFromJson(
    Board board,
    Map<String, dynamic> json,
  ) {
    final filename = json['filename'] as String?;
    final tim = json['tim'] as int?;
    final ext = json['ext'] as String?;
    return Post(
      no: json['no'],
      sub: json['sub'],
      com: json['com'],
      replies: json['replies'],
      timeFromPublish: DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      image: filename != null
          ? WebImage(
              url: _cdnImageUri('/${board.board}/$tim$ext').toString(),
              height: json['w'],
              width: json['h'],
            )
          : null,
      thumbnail: filename != null
          ? WebImage(
              url: _cdnImageUri('/${board.board}/${tim}s.jpg').toString(),
              height: json['tn_w'],
              width: json['tn_h'],
            )
          : null,
      ext: ext,
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
