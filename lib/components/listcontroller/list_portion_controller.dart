import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';

const _pageSize = 10;

class ListPortionController<T> {
  final items = <T>[];

  final Function(EntityPage entityPage) portionProvider;

  int _page = 1;
  bool isLoading = false;
  bool isLastPage = false;

  ListPortionController({required this.portionProvider});

  Future<void> loadMore() async {
    if (!isLoading && !isLastPage) {
      isLoading = true;
      final EntityPortion<T> portion = await portionProvider(
        EntityPage.paging(
          page: _page,
          pageSize: _pageSize,
        ),
      );
      isLoading = false;
      isLastPage = portion.isLastPage;
      if (!isLastPage) {
        _page++;
      }
      items.addAll(portion.entities);
    }
  }

  Future<void> reset() async {
    items.clear();
    isLoading = false;
    isLastPage = false;
    _page = 1;
  }
}
