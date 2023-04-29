

import 'dart:convert';

import 'dish.dart';

class Favorite {
  final int id;
  final int userId;
  final int dishId;
  final Dish dish;

  Favorite({
    required this.id,
    required this.userId,
    required this.dishId,
    required this.dish,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      userId: json['userId'],
      dishId: json['dishId'],
      dish: Dish.fromJson(json['dish']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'dishId': dishId,
      'dish': dish.toJson(),
    };
  }

  String toJsonString() => json.encode(toJson());
}