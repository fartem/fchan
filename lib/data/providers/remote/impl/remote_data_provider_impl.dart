import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/post.dart';
import '../../../../entities/thread.dart';
import '../api/remote_data_provider.dart';

class RemoteDataProviderImpl extends RemoteDataProvider {
  static final _boardsCache = <String, Board>{};
  static final _threadsCache = <String, List<Thread>>{};

  static final _threadPageSize = 15;

  final String baseUrl;
  final String imageBaseUrl;
  late Dio dio;

  RemoteDataProviderImpl({
    required this.dio,
    required this.baseUrl,
    required this.imageBaseUrl,
  });

  @override
  String baseUrlImage() => imageBaseUrl;

  @override
  Future<List<Board>> fetchBoards() async {
    if (_boardsCache.isEmpty) {
      final url = '$baseUrl/boards.json';
      final response = await dio.get<Map<String, dynamic>>(url);
      if (response.statusCode == HttpStatus.ok) {
        final boards = response.data!['boards'].map((rawBoard) => Board.fromJson(rawBoard)).toList();
        for (final board in boards) {
          _boardsCache[board.board] = board;
        }
      } else {
        throw HttpException(
          'Cannot fetch boards from $url',
        );
      }
    }
    return _boardsCache.values.toList();
  }

  @override
  Future<EntityPortion<Thread>> fetchCatalog({
    required Board board,
    required EntityPage entityPage,
  }) async {
    final threads = _threadsCache[board.board];
    if (threads == null) {
      final uri = '$baseUrl/${board.board}/catalog.json';
      final response = await dio.get<List<dynamic>>(uri);
      if (response.statusCode == HttpStatus.ok) {
        final parsedThreads = <Thread>[];
        response.data!.forEach(
          (page) => page['threads'].forEach(
            (json) {
              final thread = Thread.fromJson(board, json);
              thread..link = _threadLink(thread);
              parsedThreads.add(thread);
            },
          ),
        );
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

  String _threadLink(Thread thread) {
    return Uri.https(
      'boards.4channel.org',
      '${thread.board.board}/thread/${thread.no}',
    ).toString();
  }

  @override
  Future<List<Post>> fetchPosts(Thread thread) async {
    final uri = '$baseUrl/${thread.board.board}/thread/${thread.no}.json';
    final response = await dio.get<Map<String, dynamic>>(uri);
    if (response.statusCode == HttpStatus.ok) {
      return (response.data!['posts'] as List).map((rawPost) => Post.fromJson(rawPost)..board = thread.board).toList();
    } else {
      throw HttpException(
        'Cannot fetch posts from $uri',
      );
    }
  }
}
