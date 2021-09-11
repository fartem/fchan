import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import 'list_entity.dart';

class ListPortionController<T> {
  final List<ListEntity> items = [];

  final Function(EntityPage entityPage) portionProvider;

  int _page = 1;
  bool isLoading = false;
  bool isLastPage = false;

  ListPortionController({required this.portionProvider});

  Future<void> loadMore() async {
    if (!isLoading && !isLastPage) {
      isLoading = true;
      EntityPortion<T> portion = await portionProvider(
        EntityPage.paging(
          page: _page,
          pageSize: 10,
        ),
      );
      if (items.isNotEmpty && items.last == listLoader) {
        items.removeLast();
      }
      isLoading = false;
      isLastPage = portion.isLastPage;
      if (!isLastPage) {
        _page++;
      }
      items.addAll(portion.entities.map((e) => ListEntity(e)));
      if (!isLastPage) {
        items.add(listLoader);
      }
    }
  }

  Future<void> reset() async {
    items.clear();
    isLoading = false;
    isLastPage = false;
    _page = 1;
  }
}
