abstract class FChanWords {
  String get homeTitle;

  String get boardsTitle;

  String get boardsIsEmptyMessage;

  String get exploreBoardsTitle;

  String get catalogIsEmpty;

  String get historyTitle;

  String get historyIsEmptyMessage;

  String get postsInThreadIsEmptyMessage;

  String get repliesTitle;

  String get imagesTitle;

  String get threadActionOpenLink;

  String get threadActionCopyLink;

  String get threadActionRemoveFromHistory;

  String get settingsTitle;

  String get settingBugReport;

  String get settingsClearImageCache;

  String get commonRefreshText;

  String get commonReplyText;

  String get commonRepliesText;

  String get commonErrorMessage;
}

class FChanWordsImpl extends FChanWords {
  @override
  String get homeTitle => 'Home';

  @override
  String get boardsTitle => 'Favorite boards';

  @override
  String get boardsIsEmptyMessage => 'No favorite boards';

  @override
  String get exploreBoardsTitle => 'Explore boards';

  @override
  String get catalogIsEmpty => 'Catalog is empty';

  @override
  String get historyTitle => 'History';

  @override
  String get historyIsEmptyMessage => 'History is empty';

  @override
  String get postsInThreadIsEmptyMessage => 'No posts';

  @override
  String get repliesTitle => 'Re';

  @override
  String get imagesTitle => 'Img';

  @override
  String get threadActionOpenLink => 'Open link';

  @override
  String get threadActionCopyLink => 'Copy link';

  @override
  String get threadActionRemoveFromHistory => 'Remove from History';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingBugReport => 'Bug report';

  @override
  String get settingsClearImageCache => 'Clear Image Cache';

  @override
  String get commonRefreshText => 'Refresh';

  @override
  String get commonReplyText => 'Reply';

  @override
  String get commonRepliesText => 'Replies';

  @override
  String get commonErrorMessage => 'Data load error. Please contact to developer for additional info';
}
