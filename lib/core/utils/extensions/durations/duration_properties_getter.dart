extension DurationPropertiesGetter on Duration {
  int get days => inDays;
  int get hours => inHours <= 0 ? 0 : inHours % 24;
  int get minutes => inMinutes <= 0 ? 0 : inMinutes % 60;
  int get seconds => inSeconds <= 0 ? 0 : inSeconds % 60;
}
