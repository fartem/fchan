import 'package:flutter/material.dart';

import '../entities/post.dart';
import '../entities/thread.dart';
import '../logic/repository/fchan_repository.dart';

class ThreadModel extends ChangeNotifier {
  final FChanRepository _fChanRepository;

  ThreadModel(this._fChanRepository);

  Future<List<Post>> postsForThread(Thread thread) => _fChanRepository.postsForThread(thread);

  String threadLink(Thread thread) => _fChanRepository.threadLink(thread);
}
