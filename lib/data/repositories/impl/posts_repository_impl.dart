import 'package:fchan/data/providers/remote/api/remote_data_provider.dart';
import 'package:fchan/data/repositories/api/posts_repository.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

class PostsRepositoryImpl extends PostsRepository {
  final RemoteDataProvider remoteDataProvider;

  PostsRepositoryImpl({required this.remoteDataProvider});

  @override
  Future<List<Post>> postsForThread(Thread thread) => remoteDataProvider.fetchPosts(thread);
}
