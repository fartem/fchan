extension DurationExtensions on Duration {
  String formatToTime() {
    int seconds = this.inSeconds;

    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;

    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;

    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final tokens = [];
    if (days > 0) {
      tokens.add('$days d');
    } else if (hours > 0) {
      tokens.add('$hours h');
    } else if (minutes > 0) {
      tokens.add('$minutes m');
    }
    if (tokens.isEmpty) {
      tokens.add('$seconds s');
    }
    return tokens.join(' ');
  }
}
