import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/booking.dart';
import '../models/room.dart';
import '../models/user.dart';

class AddBookingScreen extends StatefulWidget {
  final Booking? booking;
  final String? preSelectedCustomerId;
  AddBookingScreen({this.booking, this.preSelectedCustomerId});
  @override
  _AddBookingState createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBookingScreen> {
  final String baseUrl = "https://695222553b3c518fca118a57.mockapi.io";
  String? _roomId, _custId;
  DateTime _in = DateTime.now(), _out = DateTime.now().add(Duration(days: 1));
  double _price = 0;
  List<Room> _rooms = [];
  List<User> _customers = [];
  List<Booking> _bookings = [];
  bool _loading = true;

  // Biến lưu thông tin phòng đang chọn để hiển thị ảnh
  Room? _selectedRoom;

  @override
  void initState() { super.initState(); loadData(); }

  Future<void> loadData() async {
    final res = await Future.wait([
      http.get(Uri.parse("$baseUrl/Rooms")),
      http.get(Uri.parse("$baseUrl/Users")),
      http.get(Uri.parse("$baseUrl/Bookings"))
    ]);
    setState(() {
      _rooms = (jsonDecode(utf8.decode(res[0].bodyBytes)) as List).map((j)=>Room.fromJson(j)).toList();
      _customers = (jsonDecode(utf8.decode(res[1].bodyBytes)) as List).map((j)=>User.fromJson(j)).where((u)=>u.role=='customer').toList();
      _bookings = (jsonDecode(utf8.decode(res[2].bodyBytes)) as List).map((j)=>Booking.fromJson(j)).toList();

      if (widget.booking != null) {
        _roomId = widget.booking!.roomId; _custId = widget.booking!.customerId;
        _in = DateTime.parse(widget.booking!.checkIn); _out = DateTime.parse(widget.booking!.checkOut);
        _price = widget.booking!.totalPrice;

        // Tìm phòng cũ để hiển thị ảnh ngay khi mở form sửa
        try {
          _selectedRoom = _rooms.firstWhere((r) => r.id == _roomId);
        } catch (e) {}
      }
      _loading = false;
    });
  }

  bool checkValid() {
    for (var b in _bookings) {
      if (b.status == 'cancelled' || (widget.booking != null && b.id == widget.booking!.id)) continue;
      if (b.roomId == _roomId) {
        DateTime s = DateTime.parse(b.checkIn), e = DateTime.parse(b.checkOut);
        if (_in.isBefore(e) && _out.isAfter(s)) return false;
      }
    }
    return true;
  }

  void save() async {
    if (widget.preSelectedCustomerId != null) _custId = widget.preSelectedCustomerId;
    if (_roomId == null || _custId == null) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vui lòng chọn đủ thông tin"))); return; }
    if (!checkValid()) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Phòng đã kín lịch trong khoảng thời gian này!"))); return; }

    Map<String, dynamic> data = {
      "roomId": _roomId, "customerId": _custId,
      "checkIn": _in.toIso8601String(), "checkOut": _out.toIso8601String(),
      "totalPrice": _price, "status": widget.booking?.status ?? "confirmed"
    };

    if (widget.booking == null) {
      await http.post(Uri.parse("$baseUrl/Bookings"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    } else {
      await http.put(Uri.parse("$baseUrl/Bookings/${widget.booking!.id}"), headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    }
    Navigator.pop(context, true);
  }

  void onRoomChanged(String? v) {
    if (v == null) return;
    setState(() {
      _roomId = v;
      // Tìm object Room để lấy giá và hình ảnh
      _selectedRoom = _rooms.firstWhere((r) => r.id == v);
      _price = _selectedRoom!.price * (_out.difference(_in).inDays == 0 ? 1 : _out.difference(_in).inDays);
    });
  }

  void updatePriceOnly() {
    if (_selectedRoom != null) {
      setState(() {
        _price = _selectedRoom!.price * (_out.difference(_in).inDays == 0 ? 1 : _out.difference(_in).inDays);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return Scaffold(body: Center(child: CircularProgressIndicator()));
    bool isCust = widget.preSelectedCustomerId != null;
    return Scaffold(
      appBar: AppBar(title: Text("Booking")),
      body: ListView(padding: EdgeInsets.all(16), children: [

        // 1. CHỌN KHÁCH HÀNG
        if (!isCust)
          DropdownButtonFormField(
              value: _custId,
              items: _customers.map((c)=>DropdownMenuItem(value: c.id, child: Text(c.fullName))).toList(),
              onChanged: (v){ setState(() => _custId=v.toString()); },
              decoration: InputDecoration(labelText: "Khách Hàng", border: OutlineInputBorder())
          )
        else
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
            child: Row(children: [Icon(Icons.person, color: Colors.blue), SizedBox(width: 10), Text("Người đặt: Bạn", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))]),
          ),

        SizedBox(height: 15),

        // 2. CHỌN PHÒNG
        DropdownButtonFormField(
          isExpanded: true, // QUAN TRỌNG: Dòng này giúp dropdown tự co giãn theo chiều ngang
          value: _roomId,
          items: _rooms.map((r) => DropdownMenuItem(
            value: r.id,
            child: Text(
              "${r.roomName} - \$${r.price} / Đêm",
              overflow: TextOverflow.ellipsis, // Nếu dài quá thì hiện dấu "..."
              maxLines: 1, // Chỉ hiện trên 1 dòng
            ),
          )).toList(),
          onChanged: onRoomChanged,
          decoration: InputDecoration(
            labelText: "Chọn Phòng",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15), // Căn chỉnh lề cho đẹp
          ),
        ),

        // --- 3. HIỂN THỊ ẢNH PHÒNG ĐANG CHỌN (MỚI) ---
        if (_selectedRoom != null && _selectedRoom!.images.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: PageView.builder(
                  itemCount: _selectedRoom!.images.length,
                  itemBuilder: (ctx, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          _selectedRoom!.images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, stack) => Center(child: Icon(Icons.broken_image, color: Colors.grey)),
                        ),
                        // Số thứ tự ảnh
                        Positioned(
                          bottom: 10, right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            color: Colors.black54,
                            child: Text("${index + 1}/${_selectedRoom!.images.length}", style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

        if (_roomId != null && (_selectedRoom == null || _selectedRoom!.images.isEmpty))
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text("Phòng này chưa có hình ảnh", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
          ),
        // ----------------------------------------------

        SizedBox(height: 10),

        // 4. CHỌN NGÀY
        ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text("Ngày nhận phòng (Check-In)"),
            subtitle: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
                child: Text("${_in.toString().split(' ')[0]}", style: TextStyle(fontSize: 16))
            ),
            onTap: () async {
              DateTime? d = await showDatePicker(context: context, initialDate: _in, firstDate: DateTime.now(), lastDate: DateTime(2030));
              if(d!=null) setState((){ _in=d; if(_out.isBefore(_in)) _out=_in.add(Duration(days: 1)); updatePriceOnly(); });
            }
        ),
        SizedBox(height: 10),
        ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text("Ngày trả phòng (Check-Out)"),
            subtitle: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
                child: Text("${_out.toString().split(' ')[0]}", style: TextStyle(fontSize: 16))
            ),
            onTap: () async {
              DateTime? d = await showDatePicker(context: context, initialDate: _out, firstDate: DateTime.now(), lastDate: DateTime(2030));
              if(d!=null) setState((){ _out=d; updatePriceOnly(); });
            }
        ),

        SizedBox(height: 20),

        // 5. TỔNG TIỀN & NÚT LƯU
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tổng cộng:", style: TextStyle(fontSize: 18)),
              Text("\$${_price.toStringAsFixed(0)}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[800])),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ElevatedButton(onPressed: save, child: Text("XÁC NHẬN ĐẶT PHÒNG", style: TextStyle(fontSize: 16))),
        )
      ]),
    );
  }
}