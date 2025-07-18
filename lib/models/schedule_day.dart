class ScheduleDay {
  final DateTime date;
  final Map<String, SchedulePeriod> periods;

  ScheduleDay({required this.date, required this.periods});

  factory ScheduleDay.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> rawPeriods = json['periods'] ?? {};
    final parsedPeriods = rawPeriods.map(
      (key, value) => MapEntry(key, SchedulePeriod.fromJson(value)),
    );

    return ScheduleDay(date: DateTime.parse(json['date']), periods: parsedPeriods);
  }
}

class SchedulePeriod {
  final String label;
  final String? id;
  final String? responsibility;

  SchedulePeriod({required this.label, this.id, this.responsibility});

  factory SchedulePeriod.fromJson(Map<String, dynamic> json) {
    return SchedulePeriod(
      label: json['label'],
      id: json['id'],
      responsibility: json['responsibility'],
    );
  }
}

