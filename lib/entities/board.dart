class Board {
  final String board;
  final String title;

  Board(this.board, this.title);

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      json['board'],
      json['title'],
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
