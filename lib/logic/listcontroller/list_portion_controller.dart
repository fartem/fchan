import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import 'list_entity.dart';

class ListPortionController<T> {
  final List<ListEntity> items = [];

  final Function(EntityPage entityPage) _portionProvider;

  int _page = 1;
  bool isLoading = false;
  bool isLastPage = false;

  ListPortionController(this._portionProvider);

  Future<void> loadMore() async {
    if (!isLoading && !isLastPage) {
      isLoading = true;
      EntityPortion<T> portion = await _portionProvider.call(EntityPage.paging(_page));
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

  Future<void> refresh() async {
    items.clear();
    isLoading = false;
    isLastPage = false;
    _page = 1;
  }
}
