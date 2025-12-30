import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/room.dart';

class RoomFormScreen extends StatefulWidget {
  final Room? room;
  RoomFormScreen({this.room});
  @override
  _RoomFormScreenState createState() => _RoomFormScreenState();
}

class _RoomFormScreenState extends State<RoomFormScreen> {
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
  final List<String> _types = ["Standard", "Superior", "Deluxe", "Suite"];
  final _nameCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  List<TextEditingController> _imgCtrls = [];
  String _selectedType = "Standard";

  @override
  void initState() {
    super.initState();
    if (widget.room != null) {
      _nameCtrl.text = widget.room!.roomName;
      _priceCtrl.text = widget.room!.price.toString();
      _descCtrl.text = widget.room!.description;
      _selectedType = _types.contains(widget.room!.roomType) ? widget.room!.roomType : "Standard";
      for (var url in widget.room!.images) _imgCtrls.add(TextEditingController(text: url));
    } else {
      _imgCtrls.add(TextEditingController());
    }
  }

  void save() async {
    List<String> images = _imgCtrls.map((c) => c.text.trim()).where((t) => t.isNotEmpty).toList();
    Map<String, dynamic> data = {
      "roomName": _nameCtrl.text, "roomType": _selectedType,
      "price": double.tryParse(_priceCtrl.text) ?? 0,
      "description": _descCtrl.text, "status": "available",
      "imgURL": jsonEncode(images),
    };

    if (widget.room == null) {
      await http.post(Uri.parse("$baseUrl/Rooms"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    } else {
      await http.put(Uri.parse("$baseUrl/Rooms/${widget.room!.id}"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Phòng")),
      body: ListView(padding: EdgeInsets.all(16), children: [
        TextField(controller: _nameCtrl, decoration: InputDecoration(labelText: "Tên Phòng")),
        DropdownButtonFormField(value: _selectedType, items: _types.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(), onChanged: (v) => setState(() => _selectedType = v.toString())),
        TextField(controller: _priceCtrl, decoration: InputDecoration(labelText: "Giá"), keyboardType: TextInputType.number),
        ..._imgCtrls.map((c) => TextField(controller: c, decoration: InputDecoration(labelText: "Link Ảnh"))).toList(),
        TextButton(onPressed: () => setState(() => _imgCtrls.add(TextEditingController())), child: Text("+ Thêm ảnh")),
        TextField(controller: _descCtrl, decoration: InputDecoration(labelText: "Mô tả")),
        SizedBox(height: 20),
        ElevatedButton(onPressed: save, child: Text("LƯU")),
      ]),
    );
  }
}