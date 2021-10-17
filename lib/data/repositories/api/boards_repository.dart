// ignore_for_file: one_member_abstracts

import 'package:fchan/entities/board.dart';

abstract class BoardsRepository {
  Future<List<Board>> boards();
}
