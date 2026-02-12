class ScreenItem {
  const ScreenItem({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.cta,
    required this.tags,
  });

  final String id;
  final String title;
  final String category;
  final String description;
  final String cta;
  final List<String> tags;

  factory ScreenItem.fromJson(Map<String, dynamic> json) {
    return ScreenItem(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      cta: json['cta'] as String,
      tags: (json['tags'] as List<dynamic>).cast<String>(),
    );
  }
}
