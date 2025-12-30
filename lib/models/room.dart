import 'dart:convert';

class Room {
  String id;
  String roomName;
  String roomType;
  double price;
  String status;
  String description;
  List<String> images;

  Room({
    required this.id,
    required this.roomName,
    required this.roomType,
    required this.price,
    required this.status,
    required this.description,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      "roomName": roomName,
      "roomType": roomType,
      "price": price,
      "status": status,
      "description": description,
      "imgURL": jsonEncode(images), // Lưu list ảnh thành chuỗi JSON
    };
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    List<String> parsedImages = [];
    try {
      var rawImg = json['imgURL'];
      if (rawImg != null) {
        String imgString = rawImg.toString();
        if (imgString.startsWith("[")) {
          List<dynamic> decoded = jsonDecode(imgString);
          parsedImages = decoded.map((e) => e.toString()).toList();
        } else if (imgString.isNotEmpty) {
          parsedImages.add(imgString);
        }
      }
    } catch (e) { print("Error parsing image: $e"); }

    if (parsedImages.isEmpty) parsedImages.add("https://via.placeholder.com/300");

    return Room(
      id: json['id'].toString(),
      roomName: json['roomName']?.toString() ?? '',
      roomType: json['roomType']?.toString() ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      status: json['status']?.toString() ?? 'available',
      description: json['description']?.toString() ?? '',
      images: parsedImages,
    );
  }
}