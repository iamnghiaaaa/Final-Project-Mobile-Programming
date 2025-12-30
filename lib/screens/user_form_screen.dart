import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserFormScreen extends StatelessWidget {
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
  final _name = TextEditingController();
  final _user = TextEditingController();
  final _pass = TextEditingController();
  final _phone = TextEditingController();

  void save(BuildContext context) async {
    Map<String, dynamic> data = {
      "fullName": _name.text, "username": _user.text,
      "password": _pass.text, "phone": _phone.text, "role": "customer"
    };
    await http.post(Uri.parse("$baseUrl/Users"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thêm User")),
      body: ListView(padding: EdgeInsets.all(16), children: [
        TextField(controller: _name, decoration: InputDecoration(labelText: "Họ tên")),
        TextField(controller: _user, decoration: InputDecoration(labelText: "Username")),
        TextField(controller: _pass, decoration: InputDecoration(labelText: "Password")),
        TextField(controller: _phone, decoration: InputDecoration(labelText: "SĐT")),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () => save(context), child: Text("LƯU")),
      ]),
    );
  }
}