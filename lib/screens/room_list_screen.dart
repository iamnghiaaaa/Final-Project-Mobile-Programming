import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/room.dart';
import 'room_form_screen.dart';

class RoomListScreen extends StatefulWidget {
  @override
  _RoomListScreenState createState() => _RoomListScreenState();
}

class _RoomListScreenState extends State<RoomListScreen> {
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
  List<Room> _rooms = [];
  bool _isLoading = true;

  @override
  void initState() { super.initState(); loadRooms(); }

  Future<void> loadRooms() async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/Rooms"));
      if (res.statusCode == 200) {
        List data = jsonDecode(utf8.decode(res.bodyBytes));
        setState(() { _rooms = data.map((j) => Room.fromJson(j)).toList(); _isLoading = false; });
      }
    } catch (e) { setState(() => _isLoading = false); }
  }

  Future<void> deleteRoom(String id) async {
    await http.delete(Uri.parse("$baseUrl/Rooms/$id"));
    loadRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quản Lý Phòng")),
      body: _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _rooms.length,
        itemBuilder: (ctx, i) {
          final room = _rooms[i];
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: PageView(children: room.images.map((img) => Image.network(img, fit: BoxFit.cover)).toList()),
                ),
                ListTile(
                  title: Text(room.roomName, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${room.roomType} - \$${room.price}"),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(icon: Icon(Icons.edit, color: Colors.orange), onPressed: () async {
                      await Navigator.push(context, MaterialPageRoute(builder: (_) => RoomFormScreen(room: room)));
                      loadRooms();
                    }),
                    IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => deleteRoom(room.id)),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => RoomFormScreen()));
          loadRooms();
        },
      ),
    );
  }
}