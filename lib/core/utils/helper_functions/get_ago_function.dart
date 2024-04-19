import 'package:shamsi_date/shamsi_date.dart';

String getAgo({
  required DateTime postDate,
  required bool isPersian,
}) {
  final now = DateTime(
    Jalali.now().year,
    Jalali.now().month,
    Jalali.now().day,
    Jalali.now().hour,
    Jalali.now().minute,
    Jalali.now().second,
  );
  final difference = now.difference(postDate);

  if (difference.inDays >= 365) {
    return '${(difference.inDays / 365).floor()} '
        '${isPersian ? 'سال پیش' : 'years ago'}';
  } else if (difference.inDays >= 30) {
    return '${(difference.inDays / 30).floor()} '
    '${isPersian ? 'ماه پیش' : 'months ago'}';
  } else if (difference.inDays >= 7) {
    return '${(difference.inDays / 7).floor()} '
    '${isPersian ? 'هفته پیش' : 'weeks ago'}';
  } else if (difference.inDays >= 1) {
    return '${difference.inDays} ${isPersian ? 'روز پیش' : 'days ago'}';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours} ${isPersian ? 'ساعت پیش' : 'hours ago'}';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes} ${isPersian ? 'دقیقه پیش' : 'minutes ago'}';
  } else {
    return isPersian ? 'همین الان' : 'Just now';
  }
}
