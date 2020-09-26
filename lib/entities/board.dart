class Board {
  final String board;
  final String title;
  final bool isFavorite;

  Board(
      this.board,
      this.title,
      this.isFavorite
  );

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      json['board'],
      json['title'],
      false,
    );
  }

  factory Board.fromSchema(Map<String, dynamic> schema) {
    return Board(
      schema['board'],
      schema['title'],
      schema['is_favorite'],
    );
  }

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
  String toString() => "/$board/ - $title";
}
