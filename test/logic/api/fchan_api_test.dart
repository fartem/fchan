import 'dart:io';

import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/api/fchan_api.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final mockHttpClient = MockHttpClient();
  final fChanApi = FChanApi(mockHttpClient);
  group('Check FChanAPI', () {
    group('Check boards fetching', () {
      test('Check boards fetching success', () async {
        final boardsResponse = File('assets_test/boards.json').readAsStringSync();
        when(mockHttpClient.get(_cdnUri('/boards.json')))
            .thenAnswer((_) async => Response(boardsResponse, 200));
        final boards = await fChanApi.fetchBoards();
        expect(
          boards.length,
          76,
        );
      });
      test('Check boards fetching error', () {
        when(mockHttpClient.get(_cdnUri('/boards.json')))
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
        final board = Board(
          'po',
          'Papercraft & Origami',
          true,
        );
        final catalogPages = List.generate(
            10,
            (index) => File('assets_test/threads/${index + 1}.json').readAsStringSync()
        );
        for (var i = 0; i < 10; i++) {
          when(mockHttpClient.get(_cdnUri('/${board.board}/${i + 1}.json')))
              .thenAnswer((_) async => Response(catalogPages[i], 200));
        }
        for (var i = 0; i < 10; i++) {
          final threadPortion = await fChanApi.fetchCatalog(board, EntityPage.paging(i + 1));
          expect(
            threadPortion.entities.length,
            15,
          );
        }
      });
      test('Check threads fetching error', () {
        final board = Board(
          'po',
          'Papercraft & Origami',
          true,
        );
        when(mockHttpClient.get(_cdnUri('/${board.board}/1.json')))
            .thenAnswer((_) async => Response('', 404));
        expect(
          () async => await fChanApi.fetchCatalog(board, EntityPage.paging(1)),
          throwsA(
            isA<HttpException>().having(
               (error) => error.message,
              'Error message',
              'Cannot fetch threads from https://a.4cdn.org/${board.board}/1.json',
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
        );
        when(mockHttpClient.get(_cdnUri('/${thread.board.board}/thread/${thread.no}.json')))
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
        );
        when(mockHttpClient.get(_cdnUri('/${thread.board.board}/thread/${thread.no}.json')))
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

Uri _cdnUri(String path) {
  return Uri.https(
    'a.4cdn.org',
    path,
  );
}

class MockHttpClient extends Mock with Client {}
