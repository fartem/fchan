extension IntExtensions on int {
  DateTime dateTimeFromUnixTimestamp() {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }
}
