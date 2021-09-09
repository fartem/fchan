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
            Duration(seconds: 1).formatToTime(),
            '1 s',
          );
          expect(
            Duration(minutes: 1).formatToTime(),
            '1 m',
          );
          expect(
            Duration(hours: 1).formatToTime(),
            '1 h',
          );
          expect(
            Duration(days: 1).formatToTime(),
            '1 d',
          );
          expect(
            Duration(
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
