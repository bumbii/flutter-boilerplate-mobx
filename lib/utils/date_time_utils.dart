DateTime fromDateTimeJson(String? dateTime) {
  if (dateTime == null || dateTime.isEmpty) {
    return DateTime.fromMillisecondsSinceEpoch(0);
  }
  return DateTime.parse(dateTime).toLocal();
}

String toDateTimeJson(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  return dateTime.toString();
}
