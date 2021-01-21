import 'package:fchan/components/words/fchan_words.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Check words in app',
    () {
      FChanWords fChanWords = FChanWordsImpl();
      test(
        'Check Home title',
        () {
          expect(
            fChanWords.homeTitle,
            'Home',
          );
        },
      );
      test(
        'Check Board words',
        () {
          expect(
            fChanWords.boardsTitle,
            'Favorite boards',
          );
          expect(
            fChanWords.boardsIsEmptyMessage,
            'No favorite boards',
          );
        },
      );
      test(
        'Check Explore words',
        () {
          expect(
            fChanWords.exploreBoardsTitle,
            'Explore boards',
          );
        },
      );
      test(
        'Check Catalog words',
        () {
          expect(
            fChanWords.catalogIsEmpty,
            'Catalog is empty',
          );
        },
      );
      test(
        'Check History words',
        () {
          expect(
            fChanWords.historyTitle,
            'History',
          );
          expect(
            fChanWords.historyIsEmptyMessage,
            'History is empty',
          );
        },
      );
      test(
        'Check Post messages',
        () {
          expect(
            fChanWords.postsInThreadIsEmptyMessage,
            'No posts',
          );
          expect(
            fChanWords.repliesTitle,
            'Re',
          );
          expect(
            fChanWords.imagesTitle,
            'Img',
          );
        },
      );
      test('Check thread actions text', () {
        expect(
          fChanWords.threadActionOpenLink,
          'Open link',
        );
        expect(
          fChanWords.threadActionCopyLink,
          'Copy link',
        );
        expect(
          fChanWords.threadActionRemoveFromHistory,
          'Remove from History',
        );
      });
      test('Check Settings text', () {
        expect(
          fChanWords.settingsTitle,
          'Settings',
        );
        expect(
          fChanWords.settingsCategoryStorage,
          'Storage',
        );
        expect(
          fChanWords.settingsItemClearImageCache,
          'Clear Image Cache',
        );
        expect(
          fChanWords.settingsCategoryInfo,
          'Info',
        );
        expect(
          fChanWords.settingItemBugReport,
          'Bug report',
        );
        expect(
          fChanWords.settingItemAuthor,
          'Author',
        );
        expect(
          fChanWords.settingItemVersion,
          'Version',
        );
      });
      test(
        'Check common text',
        () {
          expect(
            fChanWords.commonRefreshText,
            'Refresh',
          );
          expect(
            fChanWords.commonReplyText,
            'Reply',
          );
          expect(
            fChanWords.commonRepliesText,
            'Replies',
          );
          expect(
            fChanWords.commonErrorMessage,
            'Data load error. Please contact to developer for additional info',
          );
        },
      );
    },
  );
}
