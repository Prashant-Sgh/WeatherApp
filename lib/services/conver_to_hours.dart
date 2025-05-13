class ConvertToHours {
  final int dt;
  ConvertToHours({required this.dt});

  String getHours() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    int hour = date.hour - 3;
    if (hour < 12) {
      return ('$hour AM');
    } else {
      return ('${hour - 12} PM');
    }
  }
}
