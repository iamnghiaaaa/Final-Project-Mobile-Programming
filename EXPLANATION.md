# GIẢI THÍCH CHI TIẾT TỪNG DÒNG CODE TRONG FOLDER LIB

## 📁 FILE: lib/main.dart

```dart
1| import 'package:flutter/material.dart';
```
**Giải thích:** Import thư viện Flutter Material Design - cung cấp các widget và component cơ bản để xây dựng giao diện người dùng (UI) như AppBar, Scaffold, Button, Text, v.v.

```dart
2| import 'screens/login_screen.dart';
```
**Giải thích:** Import màn hình đăng nhập (LoginScreen) từ thư mục screens để sử dụng làm màn hình khởi động của ứng dụng.

```dart
3| (dòng trống)
```
**Giải thích:** Dòng trống để phân tách các phần code, giúp code dễ đọc hơn.

```dart
4| void main() {
```
**Giải thích:** Định nghĩa hàm `main()` - đây là điểm khởi đầu của mọi ứng dụng Dart/Flutter. Hàm này sẽ được gọi đầu tiên khi ứng dụng chạy.

```dart
5|   runApp(MyApp());
```
**Giải thích:** Gọi hàm `runApp()`` với tham số là một instance của `MyApp()`. Hàm này khởi tạo và chạy ứng dụng Flutter, đưa widget `MyApp` vào cây widget của ứng dụng.

```dart
6| }
```
**Giải thích:** Đóng khối code của hàm `main()`.

```dart
7| (dòng trống)
```
**Giải thích:** Dòng trống để phân tách.

```dart
8| class MyApp extends StatelessWidget {
```
**Giải thích:** Định nghĩa class `MyApp` kế thừa từ `StatelessWidget`. StatelessWidget là widget không thay đổi sau khi được tạo (immutable), phù hợp cho các widget tĩnh như cấu hình app.

```dart
9|   @override
```
**Giải thích:** Annotation `@override` cho biết phương thức bên dưới sẽ ghi đè (override) một phương thức từ class cha (StatelessWidget).

```dart
10|   Widget build(BuildContext context) {
```
**Giải thích:** Định nghĩa phương thức `build()` - phương thức bắt buộc của mọi StatelessWidget. Nhận tham số `context` (BuildContext) để truy cập thông tin về vị trí widget trong cây widget, và trả về một Widget để hiển thị.

```dart
11|     return MaterialApp(
```
**Giải thích:** Trả về widget `MaterialApp` - widget gốc của ứng dụng Material Design, cung cấp các theme, routing, và cấu hình cơ bản cho toàn bộ app.

```dart
12|       debugShowCheckedModeBanner: false,
```
**Giải thích:** Thuộc tính `debugShowCheckedModeBanner` được set là `false` để ẩn banner "DEBUG" màu đỏ ở góc trên bên phải màn hình khi chạy ở chế độ debug.

```dart
13|       title: 'Hotel Manager',
```
**Giải thích:** Thuộc tính `title` đặt tên cho ứng dụng là "Hotel Manager" - tên này được sử dụng bởi hệ điều hành để hiển thị trong task switcher và các nơi khác.

```dart
14|       home: LoginScreen(),
```
**Giải thích:** Thuộc tính `home` chỉ định màn hình đầu tiên (màn hình chính) khi app khởi động là `LoginScreen()` - màn hình đăng nhập.

```dart
15|     );
```
**Giải thích:** Đóng widget `MaterialApp`.

```dart
16|   }
```
**Giải thích:** Đóng phương thức `build()`.

```dart
17| }
```
**Giải thích:** Đóng class `MyApp`.

---

## 📁 FILE: lib/models/booking.dart

```dart
1| class Booking {
```
**Giải thích:** Định nghĩa class `Booking` - class này đại diện cho một đơn đặt phòng (booking) trong hệ thống quản lý khách sạn.

```dart
2|   String? id;
```
**Giải thích:** Khai báo thuộc tính `id` kiểu `String?` (nullable String) - ID duy nhất của booking, có thể null vì khi tạo mới chưa có ID (ID sẽ được server tạo).

```dart
3|   String roomId;
```
**Giải thích:** Khai báo thuộc tính `roomId` kiểu `String` (non-nullable) - ID của phòng được đặt trong booking này.

```dart
4|   String customerId;
```
**Giải thích:** Khai báo thuộc tính `customerId` kiểu `String` - ID của khách hàng thực hiện đặt phòng.

```dart
5|   String checkIn;
```
**Giải thích:** Khai báo thuộc tính `checkIn` kiểu `String` - ngày giờ nhận phòng, được lưu dưới dạng chuỗi (thường là ISO 8601 format).

```dart
6|   String checkOut;
```
**Giải thích:** Khai báo thuộc tính `checkOut` kiểu `String` - ngày giờ trả phòng, được lưu dưới dạng chuỗi.

```dart
7|   String status;
```
**Giải thích:** Khai báo thuộc tính `status` kiểu `String` - trạng thái của booking (ví dụ: "confirmed", "cancelled").

```dart
8|   double totalPrice;
```
**Giải thích:** Khai báo thuộc tính `totalPrice` kiểu `double` - tổng giá tiền của booking.

```dart
9| (dòng trống)
```
**Giải thích:** Dòng trống để phân tách.

```dart
10|   Booking({
```
**Giải thích:** Định nghĩa constructor của class `Booking` với named parameters (tham số có tên).

```dart
11|     this.id,
```
**Giải thích:** Tham số `id` - có thể truyền hoặc không (optional) vì là nullable.

```dart
12|     required this.roomId,
```
**Giải thích:** Tham số `roomId` với từ khóa `required` - bắt buộc phải truyền khi tạo object Booking.

```dart
13|     required this.customerId,
```
**Giải thích:** Tham số `customerId` bắt buộc - ID khách hàng phải được cung cấp.

```dart
14|     required this.checkIn,
```
**Giải thích:** Tham số `checkIn` bắt buộc - ngày nhận phòng phải được cung cấp.

```dart
15|     required this.checkOut,
```
**Giải thích:** Tham số `checkOut` bắt buộc - ngày trả phòng phải được cung cấp.

```dart
16|     required this.status,
```
**Giải thích:** Tham số `status` bắt buộc - trạng thái booking phải được cung cấp.

```dart
17|     required this.totalPrice,
```
**Giải thích:** Tham số `totalPrice` bắt buộc - tổng giá tiền phải được cung cấp.

```dart
18|   });
```
**Giải thích:** Đóng constructor.

```dart
19| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
20|   Map<String, dynamic> toJson() {
```
**Giải thích:** Định nghĩa phương thức `toJson()` trả về `Map<String, dynamic>` - chuyển đổi object Booking thành dạng JSON (Map) để gửi lên server hoặc lưu trữ.

```dart
21|     return {
```
**Giải thích:** Trả về một Map chứa các key-value pairs.

```dart
22|       "roomId": roomId,
```
**Giải thích:** Thêm key "roomId" với giá trị là `roomId` của object hiện tại vào Map.

```dart
23|       "customerId": customerId,
```
**Giải thích:** Thêm key "customerId" với giá trị là `customerId` vào Map.

```dart
24|       "checkIn": checkIn,
```
**Giải thích:** Thêm key "checkIn" với giá trị là `checkIn` vào Map.

```dart
25|       "checkOut": checkOut,
```
**Giải thích:** Thêm key "checkOut" với giá trị là `checkOut` vào Map.

```dart
26|       "status": status,
```
**Giải thích:** Thêm key "status" với giá trị là `status` vào Map.

```dart
27|       "totalPrice": totalPrice,
```
**Giải thích:** Thêm key "totalPrice" với giá trị là `totalPrice` vào Map. Lưu ý: `id` không được thêm vào vì thường do server tự tạo.

```dart
28|     };
```
**Giải thích:** Đóng Map và return.

```dart
29|   }
```
**Giải thích:** Đóng phương thức `toJson()`.

```dart
30| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
31|   factory Booking.fromJson(Map<String, dynamic> json) {
```
**Giải thích:** Định nghĩa factory constructor `fromJson()` - nhận một Map JSON và tạo object Booking từ đó. Factory constructor cho phép tạo object với logic phức tạp hơn constructor thông thường.

```dart
32|     return Booking(
```
**Giải thích:** Trả về một instance mới của Booking được tạo từ dữ liệu JSON.

```dart
33|       id: json['id']?.toString(),
```
**Giải thích:** Lấy giá trị `id` từ Map JSON, nếu null thì giữ nguyên null, nếu không null thì chuyển sang String bằng `toString()`. Toán tử `?.` là null-safe operator.

```dart
34|       roomId: json['roomId']?.toString() ?? '',
```
**Giải thích:** Lấy `roomId` từ JSON, chuyển sang String, nếu null hoặc không tồn tại thì dùng chuỗi rỗng `''` làm giá trị mặc định (toán tử `??` là null-coalescing operator).

```dart
35|       customerId: json['customerId']?.toString() ?? '',
```
**Giải thích:** Lấy `customerId` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
36|       checkIn: json['checkIn']?.toString() ?? '',
```
**Giải thích:** Lấy `checkIn` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
37|       checkOut: json['checkOut']?.toString() ?? '',
```
**Giải thích:** Lấy `checkOut` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
38|       status: json['status']?.toString() ?? 'confirmed',
```
**Giải thích:** Lấy `status` từ JSON, chuyển sang String, nếu null thì dùng giá trị mặc định là `'confirmed'`.

```dart
39|       totalPrice: double.tryParse(json['totalPrice']?.toString() ?? '0') ?? 0.0,
```
**Giải thích:** Lấy `totalPrice` từ JSON, chuyển sang String (nếu null thì dùng '0'), sau đó dùng `double.tryParse()` để chuyển String sang double. Nếu parse thất bại thì dùng 0.0 làm giá trị mặc định.

```dart
40|     );
```
**Giải thích:** Đóng constructor Booking.

```dart
41|   }
```
**Giải thích:** Đóng factory constructor `fromJson()`.

```dart
42| }
```
**Giải thích:** Đóng class `Booking`.

---

## 📁 FILE: lib/models/room.dart

```dart
1| import 'dart:convert';
```
**Giải thích:** Import thư viện `dart:convert` - cung cấp các hàm encode/decode JSON như `jsonEncode()`, `jsonDecode()` để xử lý dữ liệu JSON.

```dart
2| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
3| class Room {
```
**Giải thích:** Định nghĩa class `Room` - đại diện cho một phòng trong khách sạn.

```dart
4|   String id;
```
**Giải thích:** Khai báo thuộc tính `id` kiểu `String` (non-nullable) - ID duy nhất của phòng.

```dart
5|   String roomName;
```
**Giải thích:** Khai báo thuộc tính `roomName` kiểu `String` - tên của phòng (ví dụ: "Phòng 101", "Deluxe Suite A").

```dart
6|   String roomType;
```
**Giải thích:** Khai báo thuộc tính `roomType` kiểu `String` - loại phòng (ví dụ: "Standard", "Deluxe", "Suite").

```dart
7|   double price;
```
**Giải thích:** Khai báo thuộc tính `price` kiểu `double` - giá phòng mỗi đêm.

```dart
8|   String status;
```
**Giải thích:** Khai báo thuộc tính `status` kiểu `String` - trạng thái phòng (ví dụ: "available", "occupied", "maintenance").

```dart
9|   String description;
```
**Giải thích:** Khai báo thuộc tính `description` kiểu `String` - mô tả chi tiết về phòng.

```dart
10|   List<String> images;
```
**Giải thích:** Khai báo thuộc tính `images` kiểu `List<String>` - danh sách các URL ảnh của phòng.

```dart
11| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
12|   Room({
```
**Giải thích:** Định nghĩa constructor của class `Room` với named parameters.

```dart
13|     required this.id,
```
**Giải thích:** Tham số `id` bắt buộc khi tạo object Room.

```dart
14|     required this.roomName,
```
**Giải thích:** Tham số `roomName` bắt buộc.

```dart
15|     required this.roomType,
```
**Giải thích:** Tham số `roomType` bắt buộc.

```dart
16|     required this.price,
```
**Giải thích:** Tham số `price` bắt buộc.

```dart
17|     required this.status,
```
**Giải thích:** Tham số `status` bắt buộc.

```dart
18|     required this.description,
```
**Giải thích:** Tham số `description` bắt buộc.

```dart
19|     required this.images,
```
**Giải thích:** Tham số `images` bắt buộc - danh sách ảnh phải được cung cấp.

```dart
20|   });
```
**Giải thích:** Đóng constructor.

```dart
21| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
22|   Map<String, dynamic> toJson() {
```
**Giải thích:** Định nghĩa phương thức `toJson()` để chuyển đổi object Room thành Map JSON.

```dart
23|     return {
```
**Giải thích:** Trả về một Map.

```dart
24|       "roomName": roomName,
```
**Giải thích:** Thêm key "roomName" với giá trị `roomName` vào Map.

```dart
25|       "roomType": roomType,
```
**Giải thích:** Thêm key "roomType" với giá trị `roomType` vào Map.

```dart
26|       "price": price,
```
**Giải thích:** Thêm key "price" với giá trị `price` vào Map.

```dart
27|       "status": status,
```
**Giải thích:** Thêm key "status" với giá trị `status` vào Map.

```dart
28|       "description": description,
```
**Giải thích:** Thêm key "description" với giá trị `description` vào Map.

```dart
29|       "imgURL": jsonEncode(images), // Lưu list ảnh thành chuỗi JSON
```
**Giải thích:** Thêm key "imgURL" với giá trị là chuỗi JSON được encode từ list `images`. Vì server có thể không hỗ trợ lưu trực tiếp array, nên chuyển list thành chuỗi JSON string. Comment giải thích mục đích.

```dart
30|     };
```
**Giải thích:** Đóng Map và return.

```dart
31|   }
```
**Giải thích:** Đóng phương thức `toJson()`.

```dart
32| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
33|   factory Room.fromJson(Map<String, dynamic> json) {
```
**Giải thích:** Định nghĩa factory constructor `fromJson()` để tạo object Room từ Map JSON.

```dart
34|     List<String> parsedImages = [];
```
**Giải thích:** Khai báo biến `parsedImages` kiểu `List<String>` và khởi tạo là list rỗng - sẽ chứa danh sách URL ảnh sau khi parse từ JSON.

```dart
35|     try {
```
**Giải thích:** Bắt đầu khối try-catch để xử lý lỗi khi parse dữ liệu ảnh (có thể có nhiều định dạng khác nhau).

```dart
36|       var rawImg = json['imgURL'];
```
**Giải thích:** Lấy giá trị của key "imgURL" từ Map JSON và gán vào biến `rawImg` (kiểu `var` - có thể là bất kỳ kiểu nào).

```dart
37|       if (rawImg != null) {
```
**Giải thích:** Kiểm tra nếu `rawImg` không phải null thì mới xử lý.

```dart
38|         String imgString = rawImg.toString();
```
**Giải thích:** Chuyển `rawImg` sang String và gán vào `imgString` để xử lý tiếp.

```dart
39|         if (imgString.startsWith("[")) {
```
**Giải thích:** Kiểm tra nếu chuỗi bắt đầu bằng "[" - đây là dấu hiệu của một JSON array string (ví dụ: "[url1, url2]").

```dart
40|           List<dynamic> decoded = jsonDecode(imgString);
```
**Giải thích:** Nếu là JSON array string, dùng `jsonDecode()` để decode thành `List<dynamic>` (list chứa các phần tử kiểu dynamic).

```dart
41|           parsedImages = decoded.map((e) => e.toString()).toList();
```
**Giải thích:** Chuyển đổi mỗi phần tử trong `decoded` thành String bằng `map()`, sau đó chuyển thành List bằng `toList()`, và gán vào `parsedImages`.

```dart
42|         } else if (imgString.isNotEmpty) {
```
**Giải thích:** Nếu không phải JSON array nhưng chuỗi không rỗng (có thể là một URL đơn lẻ).

```dart
43|           parsedImages.add(imgString);
```
**Giải thích:** Thêm URL đơn lẻ đó vào list `parsedImages`.

```dart
44|         }
```
**Giải thích:** Đóng khối if-else.

```dart
45|       }
```
**Giải thích:** Đóng khối if kiểm tra null.

```dart
46|     } catch (e) { print("Error parsing image: $e"); }
```
**Giải thích:** Khối catch bắt mọi lỗi xảy ra trong khối try, in ra thông báo lỗi với nội dung lỗi `$e` (string interpolation). Nếu có lỗi, `parsedImages` vẫn là list rỗng.

```dart
47| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
48|     if (parsedImages.isEmpty) parsedImages.add("https://via.placeholder.com/300");
```
**Giải thích:** Kiểm tra nếu `parsedImages` rỗng (không có ảnh nào), thì thêm một URL ảnh placeholder mặc định để tránh lỗi khi hiển thị.

```dart
49| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
50|     return Room(
```
**Giải thích:** Trả về một instance mới của Room được tạo từ dữ liệu JSON.

```dart
51|       id: json['id'].toString(),
```
**Giải thích:** Lấy `id` từ JSON và chuyển sang String (không dùng `?.` vì id là required, nhưng vẫn an toàn với `toString()`).

```dart
52|       roomName: json['roomName']?.toString() ?? '',
```
**Giải thích:** Lấy `roomName` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
53|       roomType: json['roomType']?.toString() ?? '',
```
**Giải thích:** Lấy `roomType` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
54|       price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
```
**Giải thích:** Lấy `price` từ JSON, chuyển sang String (mặc định '0' nếu null), sau đó parse sang double, nếu thất bại thì dùng 0.0.

```dart
55|       status: json['status']?.toString() ?? 'available',
```
**Giải thích:** Lấy `status` từ JSON, chuyển sang String, nếu null thì dùng giá trị mặc định 'available'.

```dart
56|       description: json['description']?.toString() ?? '',
```
**Giải thích:** Lấy `description` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
57|       images: parsedImages,
```
**Giải thích:** Gán `parsedImages` (đã được xử lý ở trên) vào thuộc tính `images` của Room.

```dart
58|     );
```
**Giải thích:** Đóng constructor Room.

```dart
59|   }
```
**Giải thích:** Đóng factory constructor `fromJson()`.

```dart
60| }
```
**Giải thích:** Đóng class `Room`.

---

## 📁 FILE: lib/models/user.dart

```dart
1| class User {
```
**Giải thích:** Định nghĩa class `User` - đại diện cho một người dùng trong hệ thống (có thể là admin hoặc customer).

```dart
2|   String id;
```
**Giải thích:** Khai báo thuộc tính `id` kiểu `String` - ID duy nhất của user.

```dart
3|   String username;
```
**Giải thích:** Khai báo thuộc tính `username` kiểu `String` - tên đăng nhập của user.

```dart
4|   String password;
```
**Giải thích:** Khai báo thuộc tính `password` kiểu `String` - mật khẩu của user (lưu ý: trong thực tế nên hash password, không lưu plain text).

```dart
5|   String fullName;
```
**Giải thích:** Khai báo thuộc tính `fullName` kiểu `String` - họ tên đầy đủ của user.

```dart
6|   String phone;
```
**Giải thích:** Khai báo thuộc tính `phone` kiểu `String` - số điện thoại của user.

```dart
7|   String role; // 'admin' hoặc 'customer'
```
**Giải thích:** Khai báo thuộc tính `role` kiểu `String` - vai trò của user. Comment giải thích có thể là 'admin' hoặc 'customer'.

```dart
8| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
9|   User({
```
**Giải thích:** Định nghĩa constructor của class `User` với named parameters.

```dart
10|     required this.id,
```
**Giải thích:** Tham số `id` bắt buộc.

```dart
11|     required this.username,
```
**Giải thích:** Tham số `username` bắt buộc.

```dart
12|     required this.password,
```
**Giải thích:** Tham số `password` bắt buộc.

```dart
13|     required this.fullName,
```
**Giải thích:** Tham số `fullName` bắt buộc.

```dart
14|     required this.phone,
```
**Giải thích:** Tham số `phone` bắt buộc.

```dart
15|     required this.role,
```
**Giải thích:** Tham số `role` bắt buộc.

```dart
16|   });
```
**Giải thích:** Đóng constructor.

```dart
17| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
18|   factory User.fromJson(Map<String, dynamic> json) {
```
**Giải thích:** Định nghĩa factory constructor `fromJson()` để tạo object User từ Map JSON.

```dart
19|     return User(
```
**Giải thích:** Trả về một instance mới của User.

```dart
20|       id: json['id'].toString(),
```
**Giải thích:** Lấy `id` từ JSON và chuyển sang String.

```dart
21|       username: json['username']?.toString() ?? '',
```
**Giải thích:** Lấy `username` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
22|       password: json['password']?.toString() ?? '',
```
**Giải thích:** Lấy `password` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
23|       fullName: json['fullName']?.toString() ?? '',
```
**Giải thích:** Lấy `fullName` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
24|       phone: json['phone']?.toString() ?? '',
```
**Giải thích:** Lấy `phone` từ JSON, chuyển sang String, nếu null thì dùng chuỗi rỗng.

```dart
25|       role: json['role']?.toString() ?? 'customer',
```
**Giải thích:** Lấy `role` từ JSON, chuyển sang String, nếu null thì dùng giá trị mặc định 'customer'.

```dart
26|     );
```
**Giải thích:** Đóng constructor User.

```dart
27|   }
```
**Giải thích:** Đóng factory constructor `fromJson()`.

```dart
28| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
29|   Map<String, dynamic> toJson() {
```
**Giải thích:** Định nghĩa phương thức `toJson()` để chuyển đổi object User thành Map JSON.

```dart
30|     return {
```
**Giải thích:** Trả về một Map.

```dart
31|       "username": username,
```
**Giải thích:** Thêm key "username" với giá trị `username` vào Map.

```dart
32|       "password": password,
```
**Giải thích:** Thêm key "password" với giá trị `password` vào Map.

```dart
33|       "fullName": fullName,
```
**Giải thích:** Thêm key "fullName" với giá trị `fullName` vào Map.

```dart
34|       "phone": phone,
```
**Giải thích:** Thêm key "phone" với giá trị `phone` vào Map.

```dart
35|       "role": role,
```
**Giải thích:** Thêm key "role" với giá trị `role` vào Map. Lưu ý: `id` không được thêm vào vì thường do server tự tạo.

```dart
36|     };
```
**Giải thích:** Đóng Map và return.

```dart
37|   }
```
**Giải thích:** Đóng phương thức `toJson()`.

```dart
38| }
```
**Giải thích:** Đóng class `User`.

---

## 📁 FILE: lib/screens/add_booking_screen.dart

```dart
1| import 'dart:convert';
```
**Giải thích:** Import thư viện `dart:convert` để sử dụng các hàm `jsonEncode()`, `jsonDecode()`, và `utf8.decode()` để xử lý dữ liệu JSON.

```dart
2| import 'package:flutter/material.dart';
```
**Giải thích:** Import thư viện Flutter Material Design để sử dụng các widget UI.

```dart
3| import 'package:http/http.dart' as http;
```
**Giải thích:** Import thư viện `http` với alias `http` để thực hiện các HTTP request (GET, POST, PUT, DELETE) để giao tiếp với API server.

```dart
4| import '../models/booking.dart';
```
**Giải thích:** Import class `Booking` từ thư mục models để sử dụng trong màn hình này.

```dart
5| import '../models/room.dart';
```
**Giải thích:** Import class `Room` từ thư mục models để hiển thị danh sách phòng và thông tin phòng.

```dart
6| import '../models/user.dart';
```
**Giải thích:** Import class `User` từ thư mục models để hiển thị danh sách khách hàng.

```dart
7| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
8| class AddBookingScreen extends StatefulWidget {
```
**Giải thích:** Định nghĩa class `AddBookingScreen` kế thừa từ `StatefulWidget` - widget có thể thay đổi state (trạng thái) trong quá trình sử dụng, phù hợp cho form nhập liệu.

```dart
9|   final Booking? booking;
```
**Giải thích:** Khai báo thuộc tính `booking` kiểu `Booking?` (nullable) - nếu có giá trị thì đây là màn hình chỉnh sửa booking, nếu null thì là màn hình tạo mới.

```dart
10|   final String? preSelectedCustomerId;
```
**Giải thích:** Khai báo thuộc tính `preSelectedCustomerId` kiểu `String?` - ID khách hàng được chọn trước (dùng khi customer tự đặt phòng, không cần chọn khách hàng).

```dart
11|   AddBookingScreen({this.booking, this.preSelectedCustomerId});
```
**Giải thích:** Constructor của `AddBookingScreen` với 2 tham số optional - có thể truyền booking để chỉnh sửa, hoặc preSelectedCustomerId để tự động chọn khách hàng.

```dart
12|   @override
```
**Giải thích:** Annotation `@override` cho phương thức `createState()`.

```dart
13|   _AddBookingState createState() => _AddBookingState();
```
**Giải thích:** Phương thức `createState()` trả về một instance của `_AddBookingState` - class quản lý state của widget này.

```dart
14| }
```
**Giải thích:** Đóng class `AddBookingScreen`.

```dart
15| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
16| class _AddBookingState extends State<AddBookingScreen> {
```
**Giải thích:** Định nghĩa class `_AddBookingState` (private class, bắt đầu bằng `_`) kế thừa từ `State<AddBookingScreen>` - quản lý state và logic của màn hình AddBookingScreen.

```dart
17|   final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
```
**Giải thích:** Khai báo hằng số `baseUrl` chứa URL gốc của API server MockAPI - đây là endpoint để gọi các API.

```dart
18|   String? _roomId, _custId;
```
**Giải thích:** Khai báo 2 biến nullable `_roomId` (ID phòng được chọn) và `_custId` (ID khách hàng được chọn). Dấu `_` ở đầu cho biết đây là private variable.

```dart
19|   DateTime _in = DateTime.now(), _out = DateTime.now().add(Duration(days: 1));
```
**Giải thích:** Khai báo 2 biến `_in` (ngày check-in) và `_out` (ngày check-out). `_in` mặc định là ngày hiện tại, `_out` mặc định là ngày mai (thêm 1 ngày).

```dart
20|   double _price = 0;
```
**Giải thích:** Khai báo biến `_price` kiểu `double` để lưu tổng giá tiền của booking, khởi tạo là 0.

```dart
21|   List<Room> _rooms = [];
```
**Giải thích:** Khai báo list `_rooms` kiểu `List<Room>` để lưu danh sách tất cả phòng, khởi tạo là list rỗng.

```dart
22|   List<User> _customers = [];
```
**Giải thích:** Khai báo list `_customers` kiểu `List<User>` để lưu danh sách khách hàng, khởi tạo là list rỗng.

```dart
23|   List<Booking> _bookings = [];
```
**Giải thích:** Khai báo list `_bookings` kiểu `List<Booking>` để lưu danh sách booking hiện có (dùng để kiểm tra trùng lịch), khởi tạo là list rỗng.

```dart
24|   bool _loading = true;
```
**Giải thích:** Khai báo biến `_loading` kiểu `bool` để theo dõi trạng thái đang tải dữ liệu, khởi tạo là `true` (đang tải).

```dart
25| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
26|   // Biến lưu thông tin phòng đang chọn để hiển thị ảnh
```
**Giải thích:** Comment giải thích mục đích của biến bên dưới.

```dart
27|   Room? _selectedRoom;
```
**Giải thích:** Khai báo biến `_selectedRoom` kiểu `Room?` để lưu thông tin phòng đang được chọn, dùng để hiển thị ảnh và tính giá.

```dart
28| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
29|   @override
```
**Giải thích:** Annotation `@override` cho phương thức `initState()`.

```dart
30|   void initState() { super.initState(); loadData(); }
```
**Giải thích:** Phương thức `initState()` được gọi một lần khi widget được tạo. Gọi `super.initState()` để khởi tạo class cha, sau đó gọi `loadData()` để tải dữ liệu từ server.

```dart
31| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
32|   Future<void> loadData() async {
```
**Giải thích:** Định nghĩa phương thức `loadData()` async (bất đồng bộ) trả về `Future<void>` - phương thức này sẽ tải dữ liệu từ server.

```dart
33|     final res = await Future.wait([
```
**Giải thích:** Sử dụng `Future.wait()` để chờ nhiều Future hoàn thành cùng lúc. `res` sẽ là một list chứa kết quả của các HTTP request. `await` chờ tất cả request hoàn thành.

```dart
34|       http.get(Uri.parse("$baseUrl/Rooms")),
```
**Giải thích:** HTTP GET request đến endpoint `/Rooms` để lấy danh sách phòng. `Uri.parse()` chuyển chuỗi thành đối tượng Uri.

```dart
35|       http.get(Uri.parse("$baseUrl/Users")),
```
**Giải thích:** HTTP GET request đến endpoint `/Users` để lấy danh sách user.

```dart
36|       http.get(Uri.parse("$baseUrl/Bookings"))
```
**Giải thích:** HTTP GET request đến endpoint `/Bookings` để lấy danh sách booking.

```dart
37|     ]);
```
**Giải thích:** Đóng mảng các Future và kết thúc `Future.wait()`.

```dart
38|     setState(() {
```
**Giải thích:** Gọi `setState()` để cập nhật state của widget, trigger rebuild UI với dữ liệu mới.

```dart
39|       _rooms = (jsonDecode(utf8.decode(res[0].bodyBytes)) as List).map((j)=>Room.fromJson(j)).toList();
```
**Giải thích:** Parse response đầu tiên (res[0] - danh sách phòng): `utf8.decode()` decode bytes thành string, `jsonDecode()` parse JSON string thành object, ép kiểu thành `List`, dùng `map()` để chuyển mỗi phần tử thành object `Room` bằng `fromJson()`, cuối cùng `toList()` chuyển thành List.

```dart
40|       _customers = (jsonDecode(utf8.decode(res[1].bodyBytes)) as List).map((j)=>User.fromJson(j)).where((u)=>u.role=='customer').toList();
```
**Giải thích:** Parse response thứ hai (res[1] - danh sách user): tương tự như trên, nhưng thêm `.where()` để lọc chỉ lấy user có role là 'customer' (khách hàng).

```dart
41|       _bookings = (jsonDecode(utf8.decode(res[2].bodyBytes)) as List).map((j)=>Booking.fromJson(j)).toList();
```
**Giải thích:** Parse response thứ ba (res[2] - danh sách booking): chuyển đổi thành list các object `Booking`.

```dart
42| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
43|       if (widget.booking != null) {
```
**Giải thích:** Kiểm tra nếu có booking được truyền vào (đang ở chế độ chỉnh sửa).

```dart
44|         _roomId = widget.booking!.roomId; _custId = widget.booking!.customerId;
```
**Giải thích:** Gán `_roomId` và `_custId` từ booking hiện có. Dấu `!` là null assertion operator - khẳng định `widget.booking` không null.

```dart
45|         _in = DateTime.parse(widget.booking!.checkIn); _out = DateTime.parse(widget.booking!.checkOut);
```
**Giải thích:** Parse chuỗi `checkIn` và `checkOut` thành đối tượng `DateTime` và gán vào `_in` và `_out`.

```dart
46|         _price = widget.booking!.totalPrice;
```
**Giải thích:** Gán giá tiền từ booking hiện có vào `_price`.

```dart
47| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
48|         // Tìm phòng cũ để hiển thị ảnh ngay khi mở form sửa
```
**Giải thích:** Comment giải thích mục đích của đoạn code bên dưới.

```dart
49|         try {
```
**Giải thích:** Bắt đầu khối try-catch để xử lý lỗi khi tìm phòng.

```dart
50|           _selectedRoom = _rooms.firstWhere((r) => r.id == _roomId);
```
**Giải thích:** Dùng `firstWhere()` để tìm phòng đầu tiên trong `_rooms` có `id` trùng với `_roomId` và gán vào `_selectedRoom`.

```dart
51|         } catch (e) {}
```
**Giải thích:** Khối catch rỗng - nếu không tìm thấy phòng thì bỏ qua, `_selectedRoom` vẫn là null.

```dart
52|       }
```
**Giải thích:** Đóng khối if kiểm tra booking.

```dart
53|       _loading = false;
```
**Giải thích:** Set `_loading` thành `false` để báo hiệu đã tải xong dữ liệu.

```dart
54|     });
```
**Giải thích:** Đóng `setState()`.

```dart
55|   }
```
**Giải thích:** Đóng phương thức `loadData()`.

```dart
56| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
57|   bool checkValid() {
```
**Giải thích:** Định nghĩa phương thức `checkValid()` trả về `bool` - kiểm tra xem khoảng thời gian đặt phòng có bị trùng với booking khác không.

```dart
58|     for (var b in _bookings) {
```
**Giải thích:** Duyệt qua từng booking trong `_bookings` với biến `b`.

```dart
59|       if (b.status == 'cancelled' || (widget.booking != null && b.id == widget.booking!.id)) continue;
```
**Giải thích:** Nếu booking đã bị hủy (`cancelled`) hoặc là booking đang được chỉnh sửa (cùng ID), thì bỏ qua (không kiểm tra trùng). `continue` bỏ qua lần lặp hiện tại.

```dart
60|       if (b.roomId == _roomId) {
```
**Giải thích:** Kiểm tra nếu booking này thuộc cùng phòng với phòng đang chọn.

```dart
61|         DateTime s = DateTime.parse(b.checkIn), e = DateTime.parse(b.checkOut);
```
**Giải thích:** Parse ngày check-in và check-out của booking `b` thành đối tượng `DateTime` với tên `s` (start) và `e` (end).

```dart
62|         if (_in.isBefore(e) && _out.isAfter(s)) return false;
```
**Giải thích:** Kiểm tra xem khoảng thời gian mới có trùng với khoảng thời gian cũ không. Nếu ngày check-in mới (`_in`) trước ngày check-out cũ (`e`) VÀ ngày check-out mới (`_out`) sau ngày check-in cũ (`s`), thì có trùng → trả về `false` (không hợp lệ).

```dart
63|       }
```
**Giải thích:** Đóng khối if kiểm tra cùng phòng.

```dart
64|     }
```
**Giải thích:** Đóng vòng lặp for.

```dart
65|     return true;
```
**Giải thích:** Nếu không có trùng lịch nào, trả về `true` (hợp lệ).

```dart
66|   }
```
**Giải thích:** Đóng phương thức `checkValid()`.

```dart
67| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
68|   void save() async {
```
**Giải thích:** Định nghĩa phương thức `save()` async - lưu booking mới hoặc cập nhật booking hiện có.

```dart
69|     if (widget.preSelectedCustomerId != null) _custId = widget.preSelectedCustomerId;
```
**Giải thích:** Nếu có `preSelectedCustomerId` (customer tự đặt), thì gán vào `_custId`.

```dart
70|     if (_roomId == null || _custId == null) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vui lòng chọn đủ thông tin"))); return; }
```
**Giải thích:** Kiểm tra nếu chưa chọn phòng hoặc khách hàng, hiển thị thông báo lỗi bằng `SnackBar` và dừng lại (return).

```dart
71|     if (!checkValid()) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Phòng đã kín lịch trong khoảng thời gian này!"))); return; }
```
**Giải thích:** Kiểm tra trùng lịch bằng `checkValid()`, nếu không hợp lệ thì hiển thị thông báo và dừng lại.

```dart
72| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
73|     Map<String, dynamic> data = {
```
**Giải thích:** Tạo Map `data` chứa dữ liệu booking để gửi lên server.

```dart
74|       "roomId": _roomId, "customerId": _custId,
```
**Giải thích:** Thêm `roomId` và `customerId` vào Map.

```dart
75|       "checkIn": _in.toIso8601String(), "checkOut": _out.toIso8601String(),
```
**Giải thích:** Chuyển `DateTime` thành chuỗi ISO 8601 format (ví dụ: "2024-01-01T00:00:00.000Z") và thêm vào Map.

```dart
76|       "totalPrice": _price, "status": widget.booking?.status ?? "confirmed"
```
**Giải thích:** Thêm `totalPrice` và `status`. Nếu đang chỉnh sửa thì giữ nguyên status cũ, nếu tạo mới thì dùng "confirmed".

```dart
77|     };
```
**Giải thích:** Đóng Map.

```dart
78| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
79|     if (widget.booking == null) {
```
**Giải thích:** Kiểm tra nếu đang tạo mới (không có booking cũ).

```dart
80|       await http.post(Uri.parse("$baseUrl/Bookings"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
```
**Giải thích:** Gửi HTTP POST request để tạo booking mới. `headers` chỉ định content type là JSON, `body` là dữ liệu đã encode thành JSON string.

```dart
81|     } else {
```
**Giải thích:** Nếu đang chỉnh sửa.

```dart
82|       await http.put(Uri.parse("$baseUrl/Bookings/${widget.booking!.id}"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
```
**Giải thích:** Gửi HTTP PUT request để cập nhật booking với ID cụ thể. URL bao gồm ID của booking cần cập nhật.

```dart
83|     }
```
**Giải thích:** Đóng khối if-else.

```dart
84|     Navigator.pop(context, true);
```
**Giải thích:** Đóng màn hình hiện tại và quay về màn hình trước đó. Tham số `true` báo hiệu đã lưu thành công (màn hình trước có thể dùng để refresh dữ liệu).

```dart
85|   }
```
**Giải thích:** Đóng phương thức `save()`.

```dart
86| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
87|   void onRoomChanged(String? v) {
```
**Giải thích:** Định nghĩa phương thức `onRoomChanged()` được gọi khi người dùng chọn phòng khác trong dropdown.

```dart
88|     if (v == null) return;
```
**Giải thích:** Nếu giá trị là null thì dừng lại (không làm gì).

```dart
89|     setState(() {
```
**Giải thích:** Cập nhật state khi phòng thay đổi.

```dart
90|       _roomId = v;
```
**Giải thích:** Gán ID phòng mới vào `_roomId`.

```dart
91|       // Tìm object Room để lấy giá và hình ảnh
```
**Giải thích:** Comment giải thích.

```dart
92|       _selectedRoom = _rooms.firstWhere((r) => r.id == v);
```
**Giải thích:** Tìm phòng có ID trùng với `v` và gán vào `_selectedRoom` để lấy thông tin giá và ảnh.

```dart
93|       _price = _selectedRoom!.price * (_out.difference(_in).inDays == 0 ? 1 : _out.difference(_in).inDays);
```
**Giải thích:** Tính tổng giá: giá phòng nhân với số đêm. `_out.difference(_in).inDays` tính số ngày chênh lệch. Nếu là 0 (cùng ngày) thì tính 1 đêm, nếu không thì tính số ngày thực tế.

```dart
94|     });
```
**Giải thích:** Đóng `setState()`.

```dart
95|   }
```
**Giải thích:** Đóng phương thức `onRoomChanged()`.

```dart
96| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
97|   void updatePriceOnly() {
```
**Giải thích:** Định nghĩa phương thức `updatePriceOnly()` - cập nhật lại giá khi ngày check-in/check-out thay đổi.

```dart
98|     if (_selectedRoom != null) {
```
**Giải thích:** Kiểm tra nếu đã chọn phòng.

```dart
99|       setState(() {
```
**Giải thích:** Cập nhật state.

```dart
100|         _price = _selectedRoom!.price * (_out.difference(_in).inDays == 0 ? 1 : _out.difference(_in).inDays);
```
**Giải thích:** Tính lại giá dựa trên số đêm mới (tương tự dòng 93).

```dart
101|       });
```
**Giải thích:** Đóng `setState()`.

```dart
102|     }
```
**Giải thích:** Đóng khối if.

```dart
103|   }
```
**Giải thích:** Đóng phương thức `updatePriceOnly()`.

```dart
104| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
105|   @override
```
**Giải thích:** Annotation `@override` cho phương thức `build()`.

```dart
106|   Widget build(BuildContext context) {
```
**Giải thích:** Định nghĩa phương thức `build()` trả về Widget - phương thức bắt buộc để xây dựng UI.

```dart
107|     if (_loading) return Scaffold(body: Center(child: CircularProgressIndicator()));
```
**Giải thích:** Nếu đang tải dữ liệu (`_loading == true`), hiển thị màn hình loading với `CircularProgressIndicator` ở giữa màn hình.

```dart
108|     bool isCust = widget.preSelectedCustomerId != null;
```
**Giải thích:** Khai báo biến `isCust` kiểu `bool` để kiểm tra xem có phải customer tự đặt phòng không (có `preSelectedCustomerId`).

```dart
109|     return Scaffold(
```
**Giải thích:** Trả về widget `Scaffold` - widget cơ bản của Material Design, cung cấp cấu trúc màn hình (AppBar, body, v.v.).

```dart
110|       appBar: AppBar(title: Text("Booking")),
```
**Giải thích:** Thêm `AppBar` với tiêu đề "Booking" ở đầu màn hình.

```dart
111|       body: ListView(padding: EdgeInsets.all(16), children: [
```
**Giải thích:** `body` chứa `ListView` với padding 16 pixels tất cả các phía, `children` là mảng các widget con.

```dart
112| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
113|         // 1. CHỌN KHÁCH HÀNG
```
**Giải thích:** Comment đánh dấu phần chọn khách hàng.

```dart
114|         if (!isCust)
```
**Giải thích:** Nếu không phải customer tự đặt (là admin đặt cho khách), hiển thị dropdown chọn khách hàng.

```dart
115|           DropdownButtonFormField(
```
**Giải thích:** Widget dropdown để chọn khách hàng, có thể dùng trong form.

```dart
116|               value: _custId,
```
**Giải thích:** Giá trị hiện tại của dropdown là `_custId` (ID khách hàng đã chọn).

```dart
117|               items: _customers.map((c)=>DropdownMenuItem(value: c.id, child: Text(c.fullName))).toList(),
```
**Giải thích:** Tạo danh sách các option trong dropdown: map mỗi customer thành `DropdownMenuItem` với value là ID và hiển thị tên đầy đủ.

```dart
118|               onChanged: (v){ setState(() => _custId=v.toString()); },
```
**Giải thích:** Callback khi chọn khách hàng khác: cập nhật `_custId` với giá trị mới.

```dart
119|               decoration: InputDecoration(labelText: "Khách Hàng", border: OutlineInputBorder())
```
**Giải thích:** Thiết lập giao diện cho dropdown: label "Khách Hàng" và border viền ngoài.

```dart
120|           )
```
**Giải thích:** Đóng `DropdownButtonFormField`.

```dart
121|         else
```
**Giải thích:** Nếu là customer tự đặt.

```dart
122|           Container(
```
**Giải thích:** Hiển thị một Container thông báo.

```dart
123|             padding: EdgeInsets.all(12),
```
**Giải thích:** Padding 12 pixels tất cả các phía.

```dart
124|             margin: EdgeInsets.only(bottom: 10),
```
**Giải thích:** Margin dưới 10 pixels.

```dart
125|             decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
```
**Giải thích:** Thiết lập decoration: màu nền xanh nhạt và bo góc 8 pixels.

```dart
126|             child: Row(children: [Icon(Icons.person, color: Colors.blue), SizedBox(width: 10), Text("Người đặt: Bạn", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))]),
```
**Giải thích:** Nội dung Container: Row chứa icon người, khoảng cách 10 pixels, và text "Người đặt: Bạn" in đậm màu xanh.

```dart
127|           ),
```
**Giải thích:** Đóng Container.

```dart
128| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
129|         SizedBox(height: 15),
```
**Giải thích:** Widget `SizedBox` tạo khoảng cách dọc 15 pixels.

```dart
130| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
131|         // 2. CHỌN PHÒNG
```
**Giải thích:** Comment đánh dấu phần chọn phòng.

```dart
132|         DropdownButtonFormField(
```
**Giải thích:** Dropdown để chọn phòng.

```dart
133|           isExpanded: true, // QUAN TRỌNG: Dòng này giúp dropdown tự co giãn theo chiều ngang
```
**Giải thích:** `isExpanded: true` cho phép dropdown mở rộng theo chiều ngang để hiển thị đầy đủ text dài. Comment giải thích tầm quan trọng.

```dart
134|           value: _roomId,
```
**Giải thích:** Giá trị hiện tại là `_roomId`.

```dart
135|           items: _rooms.map((r) => DropdownMenuItem(
```
**Giải thích:** Tạo danh sách option từ `_rooms`, map mỗi phòng thành `DropdownMenuItem`.

```dart
136|             value: r.id,
```
**Giải thích:** Value của mỗi item là ID phòng.

```dart
137|             child: Text(
```
**Giải thích:** Widget con hiển thị text.

```dart
138|               "${r.roomName} - \$${r.price} / Đêm",
```
**Giải thích:** Text hiển thị tên phòng, giá và đơn vị "/ Đêm". `\$` là ký tự $ được escape.

```dart
139|               overflow: TextOverflow.ellipsis, // Nếu dài quá thì hiện dấu "..."
```
**Giải thích:** Nếu text quá dài thì cắt và hiển thị dấu "...". Comment giải thích.

```dart
140|               maxLines: 1, // Chỉ hiện trên 1 dòng
```
**Giải thích:** Chỉ hiển thị trên 1 dòng. Comment giải thích.

```dart
141|             ),
```
**Giải thích:** Đóng Text.

```dart
142|           )).toList(),
```
**Giải thích:** Đóng `DropdownMenuItem` và chuyển thành List.

```dart
143|           onChanged: onRoomChanged,
```
**Giải thích:** Khi chọn phòng khác, gọi phương thức `onRoomChanged()`.

```dart
144|           decoration: InputDecoration(
```
**Giải thích:** Thiết lập decoration cho dropdown.

```dart
145|             labelText: "Chọn Phòng",
```
**Giải thích:** Label hiển thị "Chọn Phòng".

```dart
146|             border: OutlineInputBorder(),
```
**Giải thích:** Border viền ngoài.

```dart
147|             contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15), // Căn chỉnh lề cho đẹp
```
**Giải thích:** Padding nội dung: 10 pixels ngang, 15 pixels dọc. Comment giải thích.

```dart
148|           ),
```
**Giải thích:** Đóng `InputDecoration`.

```dart
149|         ),
```
**Giải thích:** Đóng `DropdownButtonFormField`.

```dart
150| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
151|         // --- 3. HIỂN THỊ ẢNH PHÒNG ĐANG CHỌN (MỚI) ---
```
**Giải thích:** Comment đánh dấu phần hiển thị ảnh phòng.

```dart
152|         if (_selectedRoom != null && _selectedRoom!.images.isNotEmpty)
```
**Giải thích:** Nếu đã chọn phòng và phòng có ảnh, hiển thị phần ảnh.

```dart
153|           Padding(
```
**Giải thích:** Widget `Padding` để tạo khoảng cách.

```dart
154|             padding: const EdgeInsets.symmetric(vertical: 15.0),
```
**Giải thích:** Padding dọc 15 pixels.

```dart
155|             child: ClipRRect(
```
**Giải thích:** Widget `ClipRRect` để bo góc cho ảnh.

```dart
156|               borderRadius: BorderRadius.circular(10),
```
**Giải thích:** Bo góc 10 pixels.

```dart
157|               child: Container(
```
**Giải thích:** Container chứa ảnh.

```dart
158|                 height: 200,
```
**Giải thích:** Chiều cao 200 pixels.

```dart
159|                 width: double.infinity,
```
**Giải thích:** Chiều rộng bằng toàn bộ chiều rộng màn hình.

```dart
160|                 decoration: BoxDecoration(color: Colors.grey[200]),
```
**Giải thích:** Màu nền xám nhạt (hiển thị khi ảnh chưa load xong).

```dart
161|                 child: PageView.builder(
```
**Giải thích:** `PageView.builder` tạo slider ảnh có thể vuốt qua lại.

```dart
162|                   itemCount: _selectedRoom!.images.length,
```
**Giải thích:** Số lượng ảnh bằng độ dài của list `images`.

```dart
163|                   itemBuilder: (ctx, index) {
```
**Giải thích:** Hàm builder tạo widget cho mỗi ảnh, nhận `context` và `index`.

```dart
164|                     return Stack(
```
**Giải thích:** `Stack` để xếp chồng các widget (ảnh và số thứ tự).

```dart
165|                       fit: StackFit.expand,
```
**Giải thích:** Stack mở rộng để fill toàn bộ không gian.

```dart
166|                       children: [
```
**Giải thích:** Danh sách widget con.

```dart
167|                         Image.network(
```
**Giải thích:** Widget `Image.network` để load ảnh từ URL.

```dart
168|                           _selectedRoom!.images[index],
```
**Giải thích:** URL ảnh tại vị trí `index`.

```dart
169|                           fit: BoxFit.cover,
```
**Giải thích:** Ảnh sẽ cover toàn bộ không gian, có thể cắt bớt để vừa khung.

```dart
170|                           errorBuilder: (ctx, err, stack) => Center(child: Icon(Icons.broken_image, color: Colors.grey)),
```
**Giải thích:** Nếu load ảnh lỗi, hiển thị icon ảnh bị hỏng màu xám ở giữa.

```dart
171|                         ),
```
**Giải thích:** Đóng `Image.network`.

```dart
172|                         // Số thứ tự ảnh
```
**Giải thích:** Comment giải thích.

```dart
173|                         Positioned(
```
**Giải thích:** Widget `Positioned` để đặt widget ở vị trí cụ thể trong Stack.

```dart
174|                           bottom: 10, right: 10,
```
**Giải thích:** Đặt ở góc dưới bên phải, cách mép 10 pixels.

```dart
175|                           child: Container(
```
**Giải thích:** Container chứa text số thứ tự.

```dart
176|                             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
```
**Giải thích:** Padding 8 pixels ngang, 4 pixels dọc.

```dart
177|                             color: Colors.black54,
```
**Giải thích:** Màu nền đen trong suốt 54%.

```dart
178|                             child: Text("${index + 1}/${_selectedRoom!.images.length}", style: TextStyle(color: Colors.white)),
```
**Giải thích:** Text hiển thị "số ảnh hiện tại / tổng số ảnh" màu trắng.

```dart
179|                           ),
```
**Giải thích:** Đóng Container.

```dart
180|                         )
```
**Giải thích:** Đóng `Positioned`.

```dart
181|                       ],
```
**Giải thích:** Đóng danh sách children của Stack.

```dart
182|                     );
```
**Giải thích:** Đóng return statement.

```dart
183|                   },
```
**Giải thích:** Đóng hàm `itemBuilder`.

```dart
184|                 ),
```
**Giải thích:** Đóng `PageView.builder`.

```dart
185|               ),
```
**Giải thích:** Đóng Container.

```dart
186|             ),
```
**Giải thích:** Đóng `ClipRRect`.

```dart
187|           ),
```
**Giải thích:** Đóng `Padding`.

```dart
188| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
189|         if (_roomId != null && (_selectedRoom == null || _selectedRoom!.images.isEmpty))
```
**Giải thích:** Nếu đã chọn phòng nhưng không có ảnh (phòng null hoặc list ảnh rỗng).

```dart
190|           Padding(
```
**Giải thích:** Padding cho thông báo.

```dart
191|             padding: EdgeInsets.symmetric(vertical: 15),
```
**Giải thích:** Padding dọc 15 pixels.

```dart
192|             child: Text("Phòng này chưa có hình ảnh", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
```
**Giải thích:** Text thông báo màu xám, chữ nghiêng, căn giữa.

```dart
193|           ),
```
**Giải thích:** Đóng `Padding`.

```dart
194|         // ----------------------------------------------
```
**Giải thích:** Comment kết thúc phần ảnh.

```dart
195| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
196|         SizedBox(height: 10),
```
**Giải thích:** Khoảng cách 10 pixels.

```dart
197| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
198|         // 4. CHỌN NGÀY
```
**Giải thích:** Comment đánh dấu phần chọn ngày.

```dart
199|         ListTile(
```
**Giải thích:** Widget `ListTile` để hiển thị một dòng với tiêu đề và nội dung.

```dart
200|             contentPadding: EdgeInsets.zero,
```
**Giải thích:** Không có padding mặc định (set về 0).

```dart
201|             title: Text("Ngày nhận phòng (Check-In)"),
```
**Giải thích:** Tiêu đề "Ngày nhận phòng (Check-In)".

```dart
202|             subtitle: Container(
```
**Giải thích:** Phần phụ đề là một Container.

```dart
203|                 padding: EdgeInsets.all(10),
```
**Giải thích:** Padding 10 pixels tất cả các phía.

```dart
204|                 decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
```
**Giải thích:** Decoration: border màu xám và bo góc 5 pixels.

```dart
205|                 child: Text("${_in.toString().split(' ')[0]}", style: TextStyle(fontSize: 16))
```
**Giải thích:** Hiển thị ngày check-in: chuyển `_in` thành string, tách lấy phần đầu (ngày, bỏ phần giờ), font size 16.

```dart
206|             ),
```
**Giải thích:** Đóng Container.

```dart
207|             onTap: () async {
```
**Giải thích:** Callback khi tap vào ListTile, hàm async để chờ date picker.

```dart
208|               DateTime? d = await showDatePicker(context: context, initialDate: _in, firstDate: DateTime.now(), lastDate: DateTime(2030));
```
**Giải thích:** Hiển thị date picker: ngày ban đầu là `_in`, ngày sớm nhất là hôm nay, ngày muộn nhất là năm 2030. `await` chờ người dùng chọn.

```dart
209|               if(d!=null) setState((){ _in=d; if(_out.isBefore(_in)) _out=_in.add(Duration(days: 1)); updatePriceOnly(); });
```
**Giải thích:** Nếu chọn ngày (không null): cập nhật `_in`, nếu `_out` trước `_in` thì set `_out` là ngày sau `_in` 1 ngày, sau đó cập nhật lại giá.

```dart
210|             }
```
**Giải thích:** Đóng callback `onTap`.

```dart
211|         ),
```
**Giải thích:** Đóng `ListTile`.

```dart
212|         SizedBox(height: 10),
```
**Giải thích:** Khoảng cách 10 pixels.

```dart
213|         ListTile(
```
**Giải thích:** `ListTile` thứ hai cho ngày check-out.

```dart
214|             contentPadding: EdgeInsets.zero,
```
**Giải thích:** Không có padding.

```dart
215|             title: Text("Ngày trả phòng (Check-Out)"),
```
**Giải thích:** Tiêu đề "Ngày trả phòng (Check-Out)".

```dart
216|             subtitle: Container(
```
**Giải thích:** Container hiển thị ngày.

```dart
217|                 padding: EdgeInsets.all(10),
```
**Giải thích:** Padding 10 pixels.

```dart
218|                 decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
```
**Giải thích:** Border xám và bo góc.

```dart
219|                 child: Text("${_out.toString().split(' ')[0]}", style: TextStyle(fontSize: 16))
```
**Giải thích:** Hiển thị ngày check-out (tương tự dòng 205).

```dart
220|             ),
```
**Giải thích:** Đóng Container.

```dart
221|             onTap: () async {
```
**Giải thích:** Callback khi tap.

```dart
222|               DateTime? d = await showDatePicker(context: context, initialDate: _out, firstDate: DateTime.now(), lastDate: DateTime(2030));
```
**Giải thích:** Hiển thị date picker cho ngày check-out.

```dart
223|               if(d!=null) setState((){ _out=d; updatePriceOnly(); });
```
**Giải thích:** Nếu chọn ngày: cập nhật `_out` và tính lại giá.

```dart
224|             }
```
**Giải thích:** Đóng callback.

```dart
225|         ),
```
**Giải thích:** Đóng `ListTile`.

```dart
226| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
227|         SizedBox(height: 20),
```
**Giải thích:** Khoảng cách 20 pixels.

```dart
228| (dòng trống)
```
**Giải thích:** Dòng trống.

```dart
229|         // 5. TỔNG TIỀN & NÚT LƯU
```
**Giải thích:** Comment đánh dấu phần tổng tiền và nút lưu.

```dart
230|         Container(
```
**Giải thích:** Container hiển thị tổng tiền.

```dart
231|           padding: EdgeInsets.all(15),
```
**Giải thích:** Padding 15 pixels.

```dart
232|           decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
```
**Giải thích:** Màu nền xanh nhạt và bo góc 10 pixels.

```dart
233|           child: Row(
```
**Giải thích:** Row để xếp ngang "Tổng cộng" và số tiền.

```dart
234|             mainAxisAlignment: MainAxisAlignment.spaceBetween,
```
**Giải thích:** Căn 2 phần tử ở 2 đầu (trái và phải).

```dart
235|             children: [
```
**Giải thích:** Danh sách widget con.

```dart
236|               Text("Tổng cộng:", style: TextStyle(fontSize: 18)),
```
**Giải thích:** Text "Tổng cộng:" font size 18.

```dart
237|               Text("\$${_price.toStringAsFixed(0)}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[800])),
```
**Giải thích:** Text hiển thị giá tiền: ký tự $, giá trị `_price` làm tròn không có số thập phân, font size 24, in đậm, màu xanh đậm.

```dart
238|             ],
```
**Giải thích:** Đóng danh sách children.

```dart
239|           ),
```
**Giải thích:** Đóng Row.

```dart
240|         ),
```
**Giải thích:** Đóng Container.

```dart
241|         SizedBox(height: 20),
```
**Giải thích:** Khoảng cách 20 pixels.

```dart
242|         SizedBox(
```
**Giải thích:** `SizedBox` để set kích thước cho button.

```dart
243|           height: 50,
```
**Giải thích:** Chiều cao 50 pixels.

```dart
244|           child: ElevatedButton(onPressed: save, child: Text("XÁC NHẬN ĐẶT PHÒNG", style: TextStyle(fontSize: 16))),
```
**Giải thích:** Button "XÁC NHẬN ĐẶT PHÒNG" gọi phương thức `save()` khi nhấn, font size 16.

```dart
245|         )
```
**Giải thích:** Đóng `SizedBox`.

```dart
246|       ]),
```
**Giải thích:** Đóng danh sách children của ListView.

```dart
247|     );
```
**Giải thích:** Đóng Scaffold.

```dart
248|   }
```
**Giải thích:** Đóng phương thức `build()`.

```dart
249| }
```
**Giải thích:** Đóng class `_AddBookingState`.

---

*Tiếp tục với các file screen còn lại...*

