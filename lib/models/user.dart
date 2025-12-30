class User {
  String id;
  String username;
  String password;
  String fullName;
  String phone;
  String role; // 'admin' hoặc 'customer'

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.fullName,
    required this.phone,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      username: json['username']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      role: json['role']?.toString() ?? 'customer',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "fullName": fullName,
      "phone": phone,
      "role": role,
    };
  }
}