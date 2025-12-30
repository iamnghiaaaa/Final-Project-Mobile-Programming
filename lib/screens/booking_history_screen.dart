import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/booking.dart';
import '../models/room.dart';
import '../models/user.dart';
import 'add_booking_screen.dart';

class BookingHistoryScreen extends StatefulWidget {
  final String? filterCustomerId;
  BookingHistoryScreen({this.filterCustomerId});
  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistoryScreen> {
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
  List<Booking> _list = [];
  Map<String, String> _rMap = {}, _uMap = {};
  bool _loading = true;

  @override
  void initState() { super.initState(); load(); }

  Future<void> load() async {
    final res = await Future.wait([
      http.get(Uri.parse("$baseUrl/Bookings")),
      http.get(Uri.parse("$baseUrl/Rooms")),
      http.get(Uri.parse("$baseUrl/Users"))
    ]);
    List<Booking> b = (jsonDecode(utf8.decode(res[0].bodyBytes)) as List).map((j)=>Booking.fromJson(j)).toList();
    if (widget.filterCustomerId != null) b = b.where((x) => x.customerId == widget.filterCustomerId).toList();
    b.sort((a,x) => int.parse(x.id??"0").compareTo(int.parse(a.id??"0"))); // Mới nhất lên đầu

    List rList = jsonDecode(utf8.decode(res[1].bodyBytes));
    for (var i in rList) _rMap[i['id']] = i['roomName'];

    List uList = jsonDecode(utf8.decode(res[2].bodyBytes));
    for (var i in uList) _uMap[i['id']] = i['fullName'];

    setState(() { _list = b; _loading = false; });
  }

  Future<void> action(String id, String type) async {
    if (type == 'del') await http.delete(Uri.parse("$baseUrl/Bookings/$id"));
    else await http.put(Uri.parse("$baseUrl/Bookings/$id"), headers: {"Content-Type":"application/json"}, body: jsonEncode({"status":"cancelled"}));
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lịch Sử")),
      body: _loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _list.length,
        itemBuilder: (ctx, i) {
          final b = _list[i];
          bool isCancel = b.status == 'cancelled';
          return Card(
            color: isCancel ? Colors.grey[200] : Colors.white,
            child: ListTile(
              title: Text("Phòng: ${_rMap[b.roomId]??b.roomId}"),
              subtitle: Text("${_uMap[b.customerId]??b.customerId}\n${b.checkIn.split('T')[0]} -> ${b.checkOut.split('T')[0]}\nStatus: ${b.status}"),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                if (!isCancel) IconButton(icon: Icon(Icons.edit, color: Colors.orange), onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (_) => AddBookingScreen(booking: b))); load();
                }),
                if (!isCancel) IconButton(icon: Icon(Icons.cancel, color: Colors.red), onPressed: () => action(b.id!, 'cancel')),
                if (isCancel) IconButton(icon: Icon(Icons.delete, color: Colors.grey), onPressed: () => action(b.id!, 'del')),
              ]),
            ),
          );
        },
      ),
    );
  }
}