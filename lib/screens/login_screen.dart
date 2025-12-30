import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'main_menu_screen.dart';
import 'customer_home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool _isLoading = false;

  // !!! THAY LINK CỦA BẠN VÀO ĐÂY !!!
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";

  Future<void> login() async {
    if (_userController.text.isEmpty || _passController.text.isEmpty) return;
    setState(() => _isLoading = true);

    try {
      final res = await http.get(Uri.parse("$baseUrl/Users"));
      if (res.statusCode == 200) {
        List data = jsonDecode(utf8.decode(res.bodyBytes));
        List<User> users = data.map((j) => User.fromJson(j)).toList();

        try {
          User u = users.firstWhere((user) =>
          user.username == _userController.text && user.password == _passController.text
          );

          if (u.role == 'admin') {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainMenuScreen()));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CustomerHomeScreen(user: u)));
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sai tài khoản/mật khẩu")));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lỗi kết nối")));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("HOTEL MANAGER", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(controller: _userController, decoration: InputDecoration(labelText: "Username", border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextField(controller: _passController, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _isLoading ? null : login, child: Text("ĐĂNG NHẬP")),
            ],
          ),
        ),
      ),
    );
  }
}