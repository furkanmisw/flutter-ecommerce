import 'dart:convert';

class CategoriesModel {
  final int id;
  final String title;
  final String iconUrl;
  CategoriesModel({
    required this.id,
    required this.title,
    required this.iconUrl,
  });

  CategoriesModel copyWith({
    int? id,
    String? title,
    String? iconUrl,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'iconUrl': iconUrl,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'] as int,
      title: map['title'] as String,
      iconUrl: map['iconUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoriesModel(id: $id, title: $title, iconUrl: $iconUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesModel &&
        other.id == id &&
        other.title == title &&
        other.iconUrl == iconUrl;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ iconUrl.hashCode;
}
