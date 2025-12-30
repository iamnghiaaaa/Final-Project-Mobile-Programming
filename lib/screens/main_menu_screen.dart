import 'package:flutter/material.dart';
import 'room_list_screen.dart';
import 'user_list_screen.dart';
import 'booking_history_screen.dart';
import 'add_booking_screen.dart';
import 'login_screen.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () =>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen())))
        ],
      ),
      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _btn(context, "Đặt Phòng", Icons.add_box, Colors.blue, () => AddBookingScreen()),
          _btn(context, "DS Đặt Phòng", Icons.history, Colors.green, () => BookingHistoryScreen()),
          _btn(context, "Quản Lý Phòng", Icons.bedroom_parent, Colors.orange, () => RoomListScreen()),
          _btn(context, "Quản Lý User", Icons.people, Colors.purple, () => UserListScreen()),
        ],
      ),
    );
  }

  Widget _btn(BuildContext ctx, String title, IconData icon, Color color, Widget Function() page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => page())),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, size: 40, color: Colors.white), SizedBox(height: 10),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
    );
  }
}