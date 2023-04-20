
class Category {
  final String name;
  final int id;
  final int storeId;

  Category({
    required this.name,
    required this.id,
    required this.storeId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      id: json['id'] as int,
      storeId: json['storeId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'storeId': storeId,
    };
  }
}
