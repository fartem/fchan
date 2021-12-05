import 'package:fchan/data/repositories/api/posts_repository.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:mobx/mobx.dart';

part 'thread_store.g.dart';

class ThreadStore = _ThreadStore with _$ThreadStore;

abstract class _ThreadStore with Store {
  final PostsRepository postsRepository;
  final Thread thread;

  @observable
  var posts = ObservableList<Post>();

  @observable
  ObservableFuture? initFuture;

  _ThreadStore({
    required this.postsRepository,
    required this.thread,
  });

  @action
  Future<void> init() async {
    initFuture = ObservableFuture(_initPosts());
    try {
      await initFuture;
    } on Exception {
      initFuture = ObservableFuture.error('');
    }
  }

  Future<void> _initPosts() async => posts
    ..clear()
    ..addAll(await postsRepository.postsForThread(thread));
}
