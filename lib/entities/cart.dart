
class CartItem {
  final int? id;
  final String name;
  final String image;
  final int userId;
  final int dishId;
  final String? dishFlavor;
  final int number;
  final double amount;
  final int status;
  bool? isSelected = false;

  CartItem({
    this.id,
    required this.name,
    required this.image,
    required this.userId,
    required this.dishId,
    this.dishFlavor,
    required this.number,
    required this.amount,
    required this.status,
    this.isSelected,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as int?,
      name: json['name'] as String,
      image: json['image'] as String,
      userId: json['userId'] as int,
      dishId: json['dishId'] as int,
      dishFlavor: json['dishFlavor'] as String,
      number: json['number'] as int,
      amount: json['amount'] as double,
      status: json['status'] as int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'user_id': userId,
      'dish_id': dishId,
      'dish_flavor': dishFlavor,
      'number': number,
      'amount': amount,
      'status': status,
    };
  }
}