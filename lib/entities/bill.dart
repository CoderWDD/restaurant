


class BillEntity {
  final int id;
  final int userId;
  final String orderTime;
  final double amount;
  final String userName;
  final int boardId;
  final int storeId;
  final bool isPayed;
  final List<DetailEntity> detailSet;

  BillEntity({
    required this.id,
    required this.userId,
    required this.orderTime,
    required this.amount,
    required this.userName,
    required this.boardId,
    required this.storeId,
    required this.isPayed,
    required this.detailSet,
  });

  factory BillEntity.fromJson(Map<String, dynamic> json) {
    return BillEntity(
      id: json['id'],
      userId: json['userId'],
      orderTime: json['orderTime'],
      amount: json['amount'].toDouble(),
      userName: json['userName'],
      boardId: json['boardId'],
      storeId: json['storeId'],
      isPayed: json['isPayed'],
      detailSet: List<DetailEntity>.from(json['detailSet'].map((x) => DetailEntity.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'orderTime': orderTime,
      'amount': amount,
      'userName': userName,
      'boardId': boardId,
      'storeId': storeId,
      'isPayed': isPayed,
      'detailSet': List<dynamic>.from(detailSet.map((x) => x.toJson())),
    };
  }
}

class DetailEntity {
  final int id;
  final String name;
  final String image;
  final String dishFlavor;
  final int number;
  final double amount;
  final int dishId;

  DetailEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.dishFlavor,
    required this.number,
    required this.amount,
    required this.dishId,
  });

  factory DetailEntity.fromJson(Map<String, dynamic> json) {
    return DetailEntity(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      dishFlavor: json['dishFlavor'],
      number: json['number'],
      amount: json['amount'].toDouble(),
      dishId: json['dishId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'dishFlavor': dishFlavor,
      'number': number,
      'amount': amount,
      'dishId': dishId,
    };
  }
}

