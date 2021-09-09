class EntityPage {
  final EntityPagePortionType portionType;
  final int page;
  final int pageSize;

  EntityPage._({
    required this.portionType,
    required this.pageSize,
    this.page = 0,
  });

  factory EntityPage.paging({
    required int page,
    required int pageSize,
  }) {
    return EntityPage._(
      portionType: EntityPagePortionType.paging,
      page: page,
      pageSize: pageSize,
    );
  }
}

enum EntityPagePortionType {
  all,
  paging,
}
