import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:mobx/mobx.dart';

part 'thread_store.g.dart';

class ThreadStore = _ThreadStore with _$ThreadStore;

abstract class _ThreadStore with Store {
  final Thread thread;

  @observable
  var posts = ObservableList<Post>();

  _ThreadStore({required this.thread});

  @action
  Future<void> init() async {

  }
}
