import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BuatThreadPage extends StatefulWidget {
  const BuatThreadPage({Key key}) : super(key: key);

  @override
  _BuatThreadPageState createState() => _BuatThreadPageState();
}

class _BuatThreadPageState extends State<BuatThreadPage> {
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Buat Thread", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(29.0),
        child: Column(
          children: [
            TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                hintText: 'Masukkan Judul Thread',
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'Masukkan Isi Thread',
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: IconButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2025))
                              .then((date) {
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        },
                        icon: Icon(
                          Icons.date_range,
                          color: HexColor("#3080EE"),
                          size: 40,
                        )),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: TextField(
                      enabled: false,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: _dateTime == null
                            ? 'Pilih Tanggal'
                            : _dateTime.toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Buat Thread'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
