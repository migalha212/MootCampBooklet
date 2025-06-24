import 'schedule_day.dart';
import 'contact.dart';

class CampData {
  final List<ScheduleDay> schedule;
  final String story;
  final List<String> rules;
  final List<Contact> contacts;

  CampData({
    required this.schedule,
    required this.story,
    required this.rules,
    required this.contacts,
  });

  factory CampData.fromJson(Map<String, dynamic> json) {
    return CampData(
      schedule: (json['schedule'] as List)
          .map((e) => ScheduleDay.fromJson(e))
          .toList(),
      story: json['story'] ?? '',
      rules: List<String>.from(json['rules'] ?? []),
      contacts: (json['contacts'] as List)
          .map((e) => Contact.fromJson(e))
          .toList(),
    );
  }
}
