import 'dart:ui';

class PathInfo {
  final String id;
  final String label;
  final Color primary;
  final Color secondary;

  PathInfo({
    required this.id,
    required this.label,
    required this.primary,
    required this.secondary,
  });

  factory PathInfo.fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    return PathInfo(
      id: json['id'],
      label: json['label'],
      primary: _hexToColor(theme['primary']),
      secondary: _hexToColor(theme['secondary']),
    );
  }

  static Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}
