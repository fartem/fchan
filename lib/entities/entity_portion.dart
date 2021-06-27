class EntityPortion<T> {
  final List<T> entities;
  final bool isLastPage;

  EntityPortion({
    required this.entities,
    required this.isLastPage,
  });
}
