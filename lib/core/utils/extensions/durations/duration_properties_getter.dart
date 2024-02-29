extension DurationPropertiesGetter on Duration {
  int get days => inDays;
  int get hours => inHours % 24;
  int get minutes => inMinutes % 60;
  int get seconds => inSeconds % 60;
}
