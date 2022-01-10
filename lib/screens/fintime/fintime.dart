import 'package:finaro_project/screens/fintime/terakhirdetail.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FinTimePage extends StatefulWidget {
  const FinTimePage({Key key}) : super(key: key);

  @override
  _FinTimePageState createState() => _FinTimePageState();
}

class _FinTimePageState extends State<FinTimePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: new Text(
          "Terakhir Dilihat",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: new ListView(
          children: [
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
            ListitemTerakhir(),
          ],
        ),
      ),
    );
  }
}

class ListitemTerakhir extends StatefulWidget {
  const ListitemTerakhir({Key key}) : super(key: key);

  @override
  _ListitemTerakhirState createState() => _ListitemTerakhirState();
}

class _ListitemTerakhirState extends State<ListitemTerakhir> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TerakhirDetailPage()),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/tukang.png',
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gerobak Mang OKE",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "0,7 km",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Icon(Icons.star),
                          Text(
                            "4.6 (33)",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          )
                        ],
                      ),
                      Text("Makanan Bakso",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(
                        "Terlihat - 17 Menit yang lalu",
                        style: TextStyle(
                            color: HexColor("#3080EE"),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
