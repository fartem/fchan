import 'package:flutter/material.dart';

import '../data/repositories/data_repository.dart';
import '../entities/board.dart';
import '../entities/entity_page.dart';
import '../entities/entity_portion.dart';
import '../entities/thread.dart';

class CatalogModel extends ChangeNotifier {
  final DataRepository _fChanRepository;

  CatalogModel(this._fChanRepository);

  Future<EntityPortion<Thread>> catalogPage(
    Board board,
    EntityPage entityPage,
  ) {
    return _fChanRepository.catalogForBoard(
      board,
      entityPage,
    );
  }
}
