
class Canteen {
  final String address;
  final String name;
  final String description;
  final int employeeId;
  final int id;
  String? image;

  Canteen({
    required this.address,
    required this.name,
    required this.description,
    required this.employeeId,
    required this.id,
    this.image,
  });

  factory Canteen.fromJson(Map<String, dynamic> json) {
    return Canteen(
      address: json['address'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      employeeId: json['employeeId'] as int,
      id: json['id'] as int,
      image: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'description': description,
      'employeeId': employeeId,
      'id': id,
      'image': image ?? ''
    };
  }
}
