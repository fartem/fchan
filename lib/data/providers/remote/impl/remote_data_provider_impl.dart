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
    final url = '$baseUrl/boards.json';
    final response = await dio.get<Map<String, dynamic>>(url);
    if (response.statusCode == HttpStatus.ok) {
      final boards = response.data!['boards'].map((rawBoard) => Board.fromJson(rawBoard)).toList();
      return List<Board>.from(boards);
    } else {
      throw HttpException(
        'Cannot fetch boards from $url',
      );
    }
  }

  @override
  Future<EntityPortion<Thread>> fetchCatalog({
    required Board board,
    required EntityPage entityPage,
  }) async {
    final uri = '$baseUrl/${board.board}/catalog.json';
    final response = await dio.get<List<dynamic>>(uri);
    if (response.statusCode == HttpStatus.ok) {
      final parsedThreads = <Thread>[];
      response.data!.forEach(
        (page) => page['threads'].forEach(
          (json) {
            final thread = Thread.fromJson(board, json);
            parsedThreads.add(thread);
          },
        ),
      );
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
  }

  // TODO: link creation for thread here
  // String _threadLink(Thread thread) {
  //   return Uri.https(
  //     'boards.4channel.org',
  //     '${thread.board.board}/thread/${thread.no}',
  //   ).toString();
  // }

  @override
  Future<List<Post>> fetchPosts(Thread thread) async {
    final uri = '$baseUrl/${thread.board}/thread/${thread.no}.json';
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
