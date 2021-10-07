import 'package:fchan/extensions/duration_extensions.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Check Duration extensions',
    () {
      test(
        'Check formatToTime',
        () {
          expect(
            const Duration(seconds: 1).formatToTime(),
            '1 s',
          );
          expect(
            const Duration(minutes: 1).formatToTime(),
            '1 m',
          );
          expect(
            const Duration(hours: 1).formatToTime(),
            '1 h',
          );
          expect(
            const Duration(days: 1).formatToTime(),
            '1 d',
          );
          expect(
            const Duration(
              seconds: 1,
              minutes: 10,
              hours: 3,
              days: 9,
            ).formatToTime(),
            '9 d',
          );
        },
      );
    },
  );
}
