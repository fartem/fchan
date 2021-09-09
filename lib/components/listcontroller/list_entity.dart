class ListEntity {
  final item;

  ListEntity(this.item);
}

final listLoader = _ListLoader();

class _ListLoader extends ListEntity {
  _ListLoader() : super(Object());
}
