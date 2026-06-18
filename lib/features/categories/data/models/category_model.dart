class CategoryModel {
  final String slug;
  final String name;
  final String url;

  CategoryModel({required this.slug, required this.name, required this.url});

  factory CategoryModel.fromJson(dynamic json) {
    if (json is String) {
      return CategoryModel(slug: json, name: _formatName(json), url: '');
    }

    return CategoryModel(
      slug: json['slug'],
      name: json['name'] ?? _formatName(json['slug']),
      url: json['url'] ?? '',
    );
  }

  static String _formatName(String value) {
    return value
        .split('-')
        .map(
          (word) => word.isEmpty
              ? word
              : '${word[0].toUpperCase()}${word.substring(1)}',
        )
        .join(' ');
  }
}
