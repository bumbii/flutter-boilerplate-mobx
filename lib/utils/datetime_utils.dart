/// Parse milliseconds (a String) to datetime
DateTime parseMillisecondsToDateTime(String? dateTime) {
  if (dateTime == null || dateTime.isEmpty) {
    return DateTime.fromMillisecondsSinceEpoch(0);
  }
  return DateTime.parse(dateTime).toLocal();
}
