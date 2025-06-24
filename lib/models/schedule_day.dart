class ScheduleDay {
  final DateTime date;
  final Map<String, ActivityPeriod> periods; // morning, afternoon, night

  ScheduleDay({required this.date, required this.periods});

  factory ScheduleDay.fromJson(Map<String, dynamic> json) {
    final periodsJson = json['periods'] as Map<String, dynamic>;
    final periods = periodsJson.map(
      (k, v) => MapEntry(k, ActivityPeriod.fromJson(v)),
    );

    return ScheduleDay(date: DateTime.parse(json['date']), periods: periods);
  }
}

class ActivityPeriod {
  final String label;
  final String id;

  ActivityPeriod({required this.label, required this.id});

  factory ActivityPeriod.fromJson(Map<String, dynamic> json) {
    return ActivityPeriod(label: json['label'], id: json['id']);
  }
}
