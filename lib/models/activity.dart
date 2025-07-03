class Activity {
  final String id;
  final String name;
  final String shortDescription;
  final String description;
  final String banner;

  Activity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.banner,
  });

  factory Activity.fromJson(String id, Map<String, dynamic> json) {
    return Activity(
      id: id,
      name: json['label'] as String,
      shortDescription: json['short_description'] as String? ?? '',
      description: json['description'] as String? ?? '',
      banner: json['banner'] as String? ?? '',
    );
  }

    factory Activity.fromJsonId(Map<String, dynamic> json) {
    return Activity(
      id: json['id'] as String,
      name: json['label'] as String,
      shortDescription: json['short_description'] as String? ?? '',
      description: json['description'] as String? ?? '',
      banner: json['banner'] as String? ?? '',
    );
  }
}
