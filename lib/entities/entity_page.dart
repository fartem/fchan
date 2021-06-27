class EntityPage {
  final EntityPagePortionType portionType;
  final int page;

  EntityPage._({
    required this.portionType,
    this.page = 0,
  });

  factory EntityPage.all() {
    return EntityPage._(
      portionType: EntityPagePortionType.all,
    );
  }

  factory EntityPage.paging(int page) {
    return EntityPage._(
      portionType: EntityPagePortionType.paging,
      page: page,
    );
  }
}

enum EntityPagePortionType {
  all,
  paging,
}
