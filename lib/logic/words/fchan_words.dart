abstract class FChanWords {
  String get homeTitle;

  String get boardsTitle;
  String get boardsIsEmptyMessage;
  String get boardsLoadErrorMessage;

  String get exploreBoardsTitle;

  String get historyTitle;
  String get historyIsEmptyMessage;
  String get historyLoadErrorMessage;

  String get galleryTitle;
  String get galleryIsEmptyMessage;
  String get galleryLoadErrorMessage;

  String get bookmarksTitle;
  String get bookmarksIsEmptyMessage;
  String get bookmarksLoadErrorMessage;

  String get settingsTitle;

  String get postsInThreadIsEmptyMessage;
  String get postsLoadErrorMessage;

  String get repliesTitle;
  String get imagesTitle;

  String get commonRefreshText;
  String get commonReplyText;
  String get commonRepliesText;
}

class FChanWordsImpl extends FChanWords {
  final String commonErrorMessage = 'Data load error. Please contact to developer for additional info';

  @override
  String get homeTitle => 'Home';

  @override
  String get boardsTitle => 'Favorite boards';

  @override
  String get boardsIsEmptyMessage => 'No favorite boards';

  @override
  String get boardsLoadErrorMessage => commonErrorMessage;

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
  String get galleryLoadErrorMessage => commonErrorMessage;

  @override
  String get bookmarksLoadErrorMessage => commonErrorMessage;

  @override
  String get bookmarksTitle => 'Bookmarks';

  @override
  String get bookmarksIsEmptyMessage => 'No bookmarks';

  @override
  String get historyLoadErrorMessage => commonErrorMessage;

  @override
  String get settingsTitle => 'Settings';

  @override
  String get postsInThreadIsEmptyMessage => 'No posts';

  @override
  String get postsLoadErrorMessage => commonErrorMessage;

  @override
  String get repliesTitle => 'Re';

  @override
  String get imagesTitle => 'Img';

  @override
  String get commonRefreshText => 'Refresh';

  @override
  String get commonReplyText => 'Reply';

  @override
  String get commonRepliesText => 'Replies';
}
