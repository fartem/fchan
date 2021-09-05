import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/post.dart';
import '../../../../entities/thread.dart';
import '../api/remote_data_provider.dart';

class RemoteDataProviderImpl extends RemoteDataProvider {
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
    final uri = '$baseUrl/${board.board}/${entityPage.page}.json';
    final response = await dio.get<Map<String, dynamic>>(uri);
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
