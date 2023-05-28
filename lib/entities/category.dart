
import 'dish.dart';

class Category {
  final String name;
  final int id;
  final int storeId;
  final List<Dish> dishSet;

  Category({
    required this.name,
    required this.id,
    required this.storeId,
    required this.dishSet
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      id: json['id'] as int,
      storeId: json['storeId'] as int,
      dishSet: List<Dish>.from(json['dishSet'].map((x) => Dish.fromJson(x)))
      // dishSet: Set<Dish>.from(json['dishSet'].map((x) => Dish.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'storeId': storeId,
      'dishSet': dishSet
    };
  }
}
