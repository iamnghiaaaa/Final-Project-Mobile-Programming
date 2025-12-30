import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
  List<User> _users = [];

  @override
  void initState() { super.initState(); loadUsers(); }

  Future<void> loadUsers() async {
    final res = await http.get(Uri.parse("$baseUrl/Users"));
    if (res.statusCode == 200) {
      List data = jsonDecode(utf8.decode(res.bodyBytes));
      setState(() => _users = data.map((j) => User.fromJson(j)).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quản Lý User")),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(_users[i].fullName),
          subtitle: Text("${_users[i].role} - ${_users[i].username}"),
          trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () async {
            await http.delete(Uri.parse("$baseUrl/Users/${_users[i].id}"));
            loadUsers();
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => UserFormScreen()));
          loadUsers();
        },
      ),
    );
  }
}