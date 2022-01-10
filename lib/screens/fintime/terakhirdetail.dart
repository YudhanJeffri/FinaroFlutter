import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TerakhirDetailPage extends StatefulWidget {
  const TerakhirDetailPage({Key key}) : super(key: key);

  @override
  _TerakhirDetailPageState createState() => _TerakhirDetailPageState();
}

class _TerakhirDetailPageState extends State<TerakhirDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: new Text(
          "Terakhir Dilihat",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () => showModalBottomSheet(
            context: context, builder: (context) => detailSheet()),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/terakhir_detail.png')),
          ),
        ),
      ),
    );
  }

  Widget detailSheet() => Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Icon(Icons.star),
                Text(
                  "4.6 (33)",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
            Text("Makanan Bakso",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
              "Terlihat - 17 Menit yang lalu",
              style: TextStyle(
                  color: HexColor("#3080EE"),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(170, 40), shape: StadiumBorder()),
                  child: Text(
                    "Chat",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      fixedSize: const Size(170, 40),
                      shape: StadiumBorder()),
                  child: Text(
                    "Lihat Detail",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
