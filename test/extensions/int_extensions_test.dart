import 'package:fchan/extensions/int_extensions.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Check int extensions',
    () {
      test(
        'Check dateTimeFromUnixTimestamp()',
        () {
          // TODO: fix test on CI
          // DateTime result = DateTime.parse('2019-01-01T01:05:48.000');
          // DateTime dateTime = 1546293948.dateTimeFromUnixTimestamp();
          // expect(
          //   dateTime,
          //   result,
          // );
        },
      );
      test(
        'Check secondsToTime()',
        () {
          expect(
            1.secondsToTime(),
            '00:01',
          );
          expect(
            50.secondsToTime(),
            '00:50',
          );
          expect(
            60.secondsToTime(),
            '01:00',
          );
          expect(
            75.secondsToTime(),
            '01:15',
          );
        },
      );
    },
  );
}
