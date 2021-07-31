import 'package:flutter/material.dart';

import '../data/repositories/data_repository.dart';
import '../entities/post.dart';
import '../entities/thread.dart';

class ThreadModel extends ChangeNotifier {
  final DataRepository _fChanRepository;

  ThreadModel(this._fChanRepository);

  Future<List<Post>> postsForThread(Thread thread) => _fChanRepository.postsForThread(thread);

  String threadLink(Thread thread) => _fChanRepository.threadLink(thread);
}
