class EntityPage {
  final EntityPagePortionType entityPagePortionType;
  final int page;

  EntityPage._(
    this.entityPagePortionType, {
    this.page,
  });

  factory EntityPage.all() {
    return EntityPage._(
      EntityPagePortionType.all,
    );
  }

  factory EntityPage.paging(int page) {
    return EntityPage._(
      EntityPagePortionType.paging,
      page: page,
    );
  }
}

enum EntityPagePortionType {
  all,
  paging,
}
