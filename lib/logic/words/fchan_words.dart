abstract class FChanWords {
  String get boardsTitle;
  String get boardsIsEmptyMessage;

  String get exploreBoardsTitle;

  String get historyTitle;
  String get historyIsEmptyMessage;

  String get galleryTitle;
  String get galleryIsEmptyMessage;

  String get bookmarksTitle;
  String get bookmarksIsEmptyMessage;

  String get settingsTitle;

  String get postsInThreadIsEmptyMessage;

  String get repliesTitle;
  String get imagesTitle;
}

class FChanWordsImpl extends FChanWords {
  @override
  String get boardsTitle => 'Favorite boards';

  @override
  String get boardsIsEmptyMessage => 'No favorite boards';

  @override
  String get exploreBoardsTitle => 'Explore boards';

  @override
  String get historyTitle => 'History';

  @override
  String get historyIsEmptyMessage => 'History is empty';

  @override
  String get galleryTitle => 'Gallery';

  @override
  String get galleryIsEmptyMessage => 'Gallery is empty';

  @override
  String get bookmarksTitle => 'Bookmarks';

  @override
  String get bookmarksIsEmptyMessage => 'No bookmarks';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get postsInThreadIsEmptyMessage => 'No posts';

  @override
  String get repliesTitle => 'Re';

  @override
  String get imagesTitle => 'Img';
}
