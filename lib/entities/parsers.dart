import '../extensions/int_extensions.dart';

Duration parseTimeFromInt(int time) => DateTime.now().difference(time.dateTimeFromUnixTimestamp());

int parseBoolToInt(bool? value) => value == true ? 1 : 0;

bool parseBoolFromInt(int? value) => value == 1;
