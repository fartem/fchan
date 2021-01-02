import 'package:flutter/material.dart';

import '../entities/post.dart';
import '../entities/thread.dart';
import '../logic/repository/repository.dart';

class ThreadModel extends ChangeNotifier {
  final FChanRepository _fChanRepository;

  ThreadModel(this._fChanRepository);

  Future<List<Post>> postsForThread(Thread thread) => _fChanRepository.postsForThread(thread);
}
