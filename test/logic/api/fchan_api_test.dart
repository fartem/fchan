import 'dart:io';

import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/api/fchan_api.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final MockHttpClient mockHttpClient = MockHttpClient();
  final FChanApi fChanApi = FChanApi(mockHttpClient);
  group('Check FChanAPI', () {
    group('Check boards fetching', () {
      test('Check boards fetching success', () async {
        final boardsResponse = File('assets_test/boards.json').readAsStringSync();
        when(mockHttpClient.get('https://a.4cdn.org/boards.json'))
            .thenAnswer((_) async => Response(boardsResponse, 200));
        final boards = await fChanApi.fetchBoards();
        expect(
          boards.length,
          76,
        );
      });
      test('Check boards fetching error', () {
        when(mockHttpClient.get('https://a.4cdn.org/boards.json'))
            .thenAnswer((_) async => Response('', 404));
        expect(
          () async => await fChanApi.fetchBoards(),
          throwsA(
            isA<HttpException>().having(
              (error) => error.message,
              'Error message',
              'Cannot fetch boards from https://a.4cdn.org/boards.json',
            ),
          ),
        );
      });
    });
    group('Check threads fetching', () {
      test('Check threads fetching success', () async {
        final catalogResponse = File('assets_test/threads.json').readAsStringSync();
        final board = Board(
          'po',
          'Papercraft & Origami',
          true,
        );
        when(mockHttpClient.get('https://a.4cdn.org/${board.board}/catalog.json'))
            .thenAnswer((_) async => Response(catalogResponse, 200));
        final catalog = await fChanApi.fetchCatalog(board);
        expect(
          catalog.length,
          150,
        );
      });
      test('Check threads fetching error', () {
        final board = Board(
          'po',
          'Papercraft & Origami',
          true,
        );
        when(mockHttpClient.get('https://a.4cdn.org/${board.board}/catalog.json'))
            .thenAnswer((_) async => Response('', 404));
        expect(
          () async => await fChanApi.fetchCatalog(board),
          throwsA(
            isA<HttpException>().having(
               (error) => error.message,
              'Error message',
              'Cannot fetch threads from https://a.4cdn.org/${board.board}/catalog.json',
            ),
          ),
        );
      });
    });
    group('Check posts fetching', () {
      test('Check posts fetching success', () async {
        final postsResponse = File('assets_test/posts.json').readAsStringSync();
        final thread = Thread(
          Board(
            'po',
            'Papercraft & Origami',
            true,
          ),
          'https://a.4cdn.org/po/thread/570368',
          570368,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        );
        when(mockHttpClient.get('https://a.4cdn.org/${thread.board.board}/thread/${thread.no}.json'))
            .thenAnswer((_) async => Response(postsResponse, 200));
        final posts = await fChanApi.fetchPosts(thread);
        expect(
          posts.length,
          3,
        );
      });
      test('Check posts fetching error', () {
        final thread = Thread(
          Board(
            'po',
            'Papercraft & Origami',
            true,
          ),
          'https://a.4cdn.org/po/thread/570368',
          570368,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        );
        when(mockHttpClient.get('https://a.4cdn.org/${thread.board.board}/thread/${thread.no}.json'))
            .thenAnswer((_) async => Response('', 404));
        expect(
          () async => await fChanApi.fetchPosts(thread),
          throwsA(
            isA<HttpException>().having(
               (error) => error.message,
              'Error message',
              'Cannot fetch posts from https://a.4cdn.org/${thread.board.board}/thread/${thread.no}.json',
            ),
          ),
        );
      });
    });
  });
}

class MockHttpClient extends Mock with Client {}
