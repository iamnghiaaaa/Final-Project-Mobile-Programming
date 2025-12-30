import 'package:flutter/material.dart';
import '../models/user.dart';
import 'add_booking_screen.dart';
import 'booking_history_screen.dart';
import 'login_screen.dart';

class CustomerHomeScreen extends StatelessWidget {
  final User user;
  CustomerHomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chào, ${user.fullName}"),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () =>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen())))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _btn(context, "Đặt Phòng Ngay", Icons.calendar_today, Colors.blue,
                    () => AddBookingScreen(preSelectedCustomerId: user.id)),
            SizedBox(height: 20),
            _btn(context, "Lịch Sử Của Tôi", Icons.history_edu, Colors.orange,
                    () => BookingHistoryScreen(filterCustomerId: user.id)),
          ],
        ),
      ),
    );
  }

  Widget _btn(BuildContext ctx, String title, IconData icon, Color color, Widget Function() page) {
    return GestureDetector(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => page())),
      child: Container(
        height: 100,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 40, color: Colors.white), SizedBox(width: 20),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}