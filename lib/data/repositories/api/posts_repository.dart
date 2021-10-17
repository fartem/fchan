// ignore_for_file: one_member_abstracts

import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

abstract class PostsRepository {
  Future<List<Post>> postsForThread(Thread thread);
}
