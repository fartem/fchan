


void main() {
  // group(
  //   'Check FChanAPI',
  //   () {
  //     group(
  //       'Check boards fetching',
  //       () {
  //         test(
  //           'Check boards fetching success',
  //           () async {
  //             final boardsResponse = File('assets_test/boards.json').readAsStringSync();
  //             when(() => mockHttpClient.get('/boards.json')).thenAnswer((_) async => Response(boardsResponse, 200));
  //             final boards = await fChanApi.fetchBoards();
  //             expect(
  //               boards.length,
  //               76,
  //             );
  //           },
  //         );
  //         test(
  //           'Check boards fetching error',
  //           () {
  //             when(() => mockHttpClient.get('/boards.json')).thenAnswer((_) async => Response(
  //                   data: '',
  //                   statusCode: 404,
  //                   requestOptions: RequestOptions(path: ''),
  //                 ));
  //             expect(
  //               () async => await fChanApi.fetchBoards(),
  //               throwsA(
  //                 isA<HttpException>().having(
  //                   (error) => error.message,
  //                   'Error message',
  //                   'Cannot fetch boards from https://a.4cdn.org/boards.json',
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //     group(
  //       'Check threads fetching',
  //       () {
  //         test(
  //           'Check threads fetching success',
  //           () async {
  //             final board = Board(
  //               board: 'po',
  //               title: 'Papercraft & Origami',
  //               isFavorite: true,
  //             );
  //             final catalogPages = File('assets_test/catalog.json').readAsStringSync();
  //             when(() => mockHttpClient.get(_cdnUri('/${board.board}/catalog.json')))
  //                 .thenAnswer((_) async => Response(catalogPages, 200));
  //             for (var i = 0; i < 10; i++) {
  //               final threadPortion = await fChanApi.fetchCatalog(
  //                 board: board,
  //                 entityPage: EntityPage.paging(i),
  //               );
  //               expect(
  //                 threadPortion.entities.length,
  //                 15,
  //               );
  //             }
  //           },
  //         );
  //         test(
  //           'Check threads fetching error',
  //           () {
  //             final board = Board(
  //               board: 'co',
  //               title: 'Comics & Cartoons',
  //               isFavorite: true,
  //             );
  //             when(() => mockHttpClient.get(_cdnUri('/${board.board}/catalog.json')))
  //                 .thenAnswer((_) async => Response('', 404));
  //             expect(
  //               () async => await fChanApi.fetchCatalog(
  //                 board: board,
  //                 entityPage: EntityPage.paging(1),
  //               ),
  //               throwsA(
  //                 isA<HttpException>().having(
  //                   (error) => error.message,
  //                   'Error message',
  //                   'Cannot fetch threads from https://a.4cdn.org/${board.board}/catalog.json',
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //     group(
  //       'Check posts fetching',
  //       () {
  //         test(
  //           'Check posts fetching success',
  //           () async {
  //             final postsResponse = File('assets_test/posts.json').readAsStringSync();
  //             final thread = Thread(
  //               no: 0,
  //               time: Duration(seconds: 0),
  //               replies: 0,
  //               images: 0,
  //             )..board = Board(
  //                 board: 'po',
  //                 title: 'Papercraft & Origami',
  //                 isFavorite: true,
  //               );
  //             when(() => mockHttpClient.get(_cdnUri('/${thread.board.board}/thread/${thread.no}.json')))
  //                 .thenAnswer((_) async => Response(postsResponse, 200));
  //             final posts = await fChanApi.fetchPosts(thread);
  //             expect(
  //               posts.length,
  //               3,
  //             );
  //           },
  //         );
  //         test(
  //           'Check posts fetching error',
  //           () {
  //             final thread = Thread(
  //               no: 0,
  //               time: Duration(seconds: 0),
  //               replies: 0,
  //               images: 0,
  //             )..board = Board(
  //                 board: 'po',
  //                 title: 'Papercraft & Origami',
  //                 isFavorite: true,
  //               );
  //             when(() => mockHttpClient.get(_cdnUri('/${thread.board.board}/thread/${thread.no}.json')))
  //                 .thenAnswer((_) async => Response('', 404));
  //             expect(
  //               () async => await fChanApi.fetchPosts(thread),
  //               throwsA(
  //                 isA<HttpException>().having(
  //                   (error) => error.message,
  //                   'Error message',
  //                   'Cannot fetch posts from https://a.4cdn.org/${thread.board.board}/thread/${thread.no}.json',
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     );
  //   },
  // );
}
