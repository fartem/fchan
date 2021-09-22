import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/post.dart';
import '../../../../entities/thread.dart';
import '../api/remote_data_provider.dart';
import 'interceptors/logger_interceptor.dart';

const _baseUrl = 'https://a.4cdn.org';
const _imageBaseUrl = 'https://i.4cdn.org';

class RemoteDataProviderImpl extends RemoteDataProvider {
  late Dio _dio;

  RemoteDataProviderImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    )..interceptors.add(LoggerInterceptor());
  }

  @override
  String baseUrlImage() => _imageBaseUrl;

  @override
  Future<List<Board>> fetchBoards() async {
    final url = '$_baseUrl/boards.json';
    final response = await _dio.get<Map<String, dynamic>>(url);
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
    final uri = '$_baseUrl/${board.board}/${entityPage.page}.json';
    final response = await _dio.get<Map<String, dynamic>>(uri);
    if (response.statusCode == HttpStatus.ok) {
      final rawThreads = response.data!['threads']!;
      final threads = <Thread>[
        ...rawThreads.map((rawThread) => Thread.fromJson(board, rawThread['posts'].first)).toList(),
      ];
      return EntityPortion<Thread>(
        entities: threads,
        isLastPage: threads.isEmpty,
      );
    } else {
      throw HttpException(
        'Cannot fetch threads from $uri',
      );
    }
  }

  @override
  Future<List<Post>> fetchPosts(Thread thread) async {
    final uri = '$_baseUrl/${thread.board}/thread/${thread.no}.json';
    final response = await _dio.get<Map<String, dynamic>>(uri);
    if (response.statusCode == HttpStatus.ok) {
      return (response.data!['posts'] as List).map((rawPost) => Post.fromJson(rawPost)..board = thread.board).toList();
    } else {
      throw HttpException(
        'Cannot fetch posts from $uri',
      );
    }
  }

  @override
  String urlForThread(Thread thread) {
    return Uri.https(
      'boards.4channel.org',
      '${thread.board}/thread/${thread.no}',
    ).toString();
  }

  @override
  String urlForThreadsImage(Thread thread) => '$_imageBaseUrl/${thread.board}/${thread.tim}${thread.ext}';

  @override
  String urlForThreadsImageThumbnail(Thread thread) => '$_imageBaseUrl/${thread.board}/${thread.tim}s.jpg';

  @override
  String urlForPostsImage(Post post) => '$_imageBaseUrl/${post.board}/${post.tim}${post.ext}';

  @override
  String urlForPostsImageThumbnail(Post post) => '$_imageBaseUrl/${post.board}/${post.tim}s.jpg';
}
