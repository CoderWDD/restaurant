
class Dish {
  final String image;
  final double price;
  final String name;
  final String description;
  final int id;
  final int categoryId;
  final int status;

  Dish({
    required this.image,
    required this.price,
    required this.name,
    required this.description,
    required this.id,
    required this.categoryId,
    required this.status,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      description: json['description'] as String,
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'price': price,
      'name': name,
      'description': description,
      'id': id,
      'categoryId': categoryId,
      'status': status,
    };
  }
}
