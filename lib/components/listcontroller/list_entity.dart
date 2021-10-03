class ListEntity {
  final item;

  const ListEntity(this.item);

  @override
  bool operator ==(Object other) => item == other;

  @override
  int get hashCode => item.hashCode;
}

const listLoader = ListLoader();

class ListLoader extends ListEntity {
  const ListLoader() : super(0);
}
