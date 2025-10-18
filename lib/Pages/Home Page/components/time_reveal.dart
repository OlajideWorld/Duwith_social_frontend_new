String timeAgo(DateTime date, {DateTime? now}) {
  final current = now ?? DateTime.now();
  Duration diff = current.difference(date);

  // Future dates: return a short future message
  if (diff.isNegative) {
    final ahead = date.difference(current);
    if (ahead.inSeconds < 60)
      return 'in ${ahead.inSeconds} ${ahead.inSeconds == 1 ? "second" : "seconds"}';
    if (ahead.inMinutes < 60)
      return 'in ${ahead.inMinutes} ${ahead.inMinutes == 1 ? "minute" : "minutes"}';
    if (ahead.inHours < 24)
      return 'in ${ahead.inHours} ${ahead.inHours == 1 ? "hour" : "hours"}';
    if (ahead.inDays < 7)
      return 'in ${ahead.inDays} ${ahead.inDays == 1 ? "day" : "days"}';
    final weeksAhead = (ahead.inDays / 7).floor();
    if (weeksAhead < 4)
      return 'in $weeksAhead ${weeksAhead == 1 ? "week" : "weeks"}';
    // fallback for far future
    return _formatDate(date);
  }

  final seconds = diff.inSeconds;
  if (seconds < 60) {
    return '$seconds ${seconds == 1 ? "second" : "seconds"} ago';
  }

  final minutes = diff.inMinutes;
  if (minutes < 60) {
    return '$minutes ${minutes == 1 ? "minute" : "minutes"} ago';
  }

  final hours = diff.inHours;
  if (hours < 24) {
    return '$hours ${hours == 1 ? "hour" : "hours"} ago';
  }

  final days = diff.inDays;
  if (days < 7) {
    return '$days ${days == 1 ? "day" : "days"} ago';
  }

  // weeks (7..27 days => 1..3 weeks)
  if (days < 28) {
    final weeks = (days / 7).floor();
    return '$weeks ${weeks == 1 ? "week" : "weeks"} ago';
  }

  // months (use year/month math for better accuracy)
  final months = _monthDifference(date, current);
  if (months < 12) {
    return '$months ${months == 1 ? "month" : "months"} ago';
  }

  // years
  final years = (months / 12).floor();
  if (years < 10) {
    return '$years ${years == 1 ? "year" : "years"} ago';
  }

  // >= 10 years -> show full date
  return _formatDate(date);
}

// helper: get month difference between two dates (floor)
int _monthDifference(DateTime from, DateTime to) {
  int yearsDiff = to.year - from.year;
  int monthsDiff = to.month - from.month;
  int totalMonths = yearsDiff * 12 + monthsDiff;
  // adjust if day-of-month in 'to' is before 'from' -> subtract one month
  if (to.day < from.day) totalMonths -= 1;
  if (totalMonths < 0) totalMonths = 0;
  return totalMonths;
}

String _formatDate(DateTime d) {
  const monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final month = monthNames[d.month - 1];
  return '$month ${d.day}, ${d.year}';
}
