import 'storage_entitiy.dart';

class Board extends StorageEntity {
  final String board;
  final String title;
  bool isFavorite;

  Board(
      this.board,
      this.title,
      this.isFavorite,
      {int id}
  ) : super(id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Board &&
          runtimeType == other.runtimeType &&
          board == other.board &&
          title == other.title;

  @override
  int get hashCode => board.hashCode ^ title.hashCode;

  @override
  String toString() => '/$board/ - $title';
}
