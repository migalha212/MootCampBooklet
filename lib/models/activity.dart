class Activity {
  final String id;
  final String name;
  final String shortDescription;

  Activity({
    required this.id,
    required this.name,
    required this.shortDescription,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'] as String,
      name: json['label'] as String,
      shortDescription:
          json['short_description'] as String? ??
          '', // Handle potential null or missing
    );
  }
}
