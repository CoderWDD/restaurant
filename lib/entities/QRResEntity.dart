

class QRResEntity {
  final int canteenId;
  final int tableId;
  final String canteenName;

  QRResEntity({
    required this.canteenId,
    required this.tableId,
    required this.canteenName
  });

  factory QRResEntity.fromJson(Map<String, dynamic> json) {
    return QRResEntity(
      canteenId: json['canteenId'],
      tableId: json['tableId'],
      canteenName: json['canteenName']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['canteenId'] = canteenId;
    data['tableId'] = tableId;
    data['canteenName'] = canteenName;
    return data;
  }
}

