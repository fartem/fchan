extension IntExtensions on int {
  DateTime dateTimeFromUnixTimestamp() => DateTime.fromMillisecondsSinceEpoch(this * 1000);

  String secondsToTime() {
    int seconds = this;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    return '${minutes > 9 ? minutes : '0$minutes'}:${seconds > 9 ? seconds : '0$seconds'}';
  }
}
