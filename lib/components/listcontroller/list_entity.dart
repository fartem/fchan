class ListEntity {
  final item;

  ListEntity(this.item);

  @override
  bool operator ==(Object other) => item == other;

  @override
  int get hashCode => item.hashCode;
}

final listLoader = _ListLoader();

class _ListLoader extends ListEntity {
  _ListLoader() : super(Object());
}
