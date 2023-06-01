
class Order {
  final int dishId;
  final String dishFlavor;
  final int number;
  final int boardId = 1;

  Order({
    required this.dishId,
    required this.dishFlavor,
    required this.number,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      dishId: json['dishId'] as int,
      dishFlavor: json['dishFlavor'] as String,
      number: json['number'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dishId': dishId,
      'dishFlavor': dishFlavor,
      'number': number,
      'boardId': boardId,
    };
  }
}
