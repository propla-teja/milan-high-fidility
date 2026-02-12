import 'screen_item.dart';

class ScreenSection {
  const ScreenSection({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.items,
  });

  final String id;
  final String title;
  final String subtitle;
  final List<ScreenItem> items;

  factory ScreenSection.fromJson(Map<String, dynamic> json) {
    return ScreenSection(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => ScreenItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
