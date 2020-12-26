class EntityPortion<T> {
  final List<T> entities;
  final bool isLastPage;

  EntityPortion(
    this.entities,
    this.isLastPage,
  );
}
