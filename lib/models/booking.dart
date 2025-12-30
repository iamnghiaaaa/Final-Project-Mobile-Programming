class Booking {
  String? id;
  String roomId;
  String customerId;
  String checkIn;
  String checkOut;
  String status;
  double totalPrice;

  Booking({
    this.id,
    required this.roomId,
    required this.customerId,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      "roomId": roomId,
      "customerId": customerId,
      "checkIn": checkIn,
      "checkOut": checkOut,
      "status": status,
      "totalPrice": totalPrice,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id']?.toString(),
      roomId: json['roomId']?.toString() ?? '',
      customerId: json['customerId']?.toString() ?? '',
      checkIn: json['checkIn']?.toString() ?? '',
      checkOut: json['checkOut']?.toString() ?? '',
      status: json['status']?.toString() ?? 'confirmed',
      totalPrice: double.tryParse(json['totalPrice']?.toString() ?? '0') ?? 0.0,
    );
  }
}