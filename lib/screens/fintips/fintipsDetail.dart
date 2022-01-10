import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FintipsDetailPage extends StatefulWidget {
  const FintipsDetailPage({Key key}) : super(key: key);

  @override
  _FintipsDetailPageState createState() => _FintipsDetailPageState();
}

class _FintipsDetailPageState extends State<FintipsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("FinTips", style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    ItemPertanyaan(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Jawaban (10)",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    ItemJawaban(),
                    ItemJawaban(),
                    ItemJawaban(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemJawaban extends StatefulWidget {
  const ItemJawaban({Key key}) : super(key: key);

  @override
  _ItemJawabanState createState() => _ItemJawabanState();
}

class _ItemJawabanState extends State<ItemJawaban> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FintipsDetailPage()),
            );
          },
          child: SizedBox(
              child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Yoga -",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "19-03-2021 22:20",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 17.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15.0, right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('assets/images/profile.png',
                            height: 40, width: 34),
                      ),
                    ),
                    Flexible(
                      child: Text(
                          "Saya sudah jualan cilok hampir 5 tahun, profitnya lumayan, yang penting cari tempat strategis saja."),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    Text(
                      "21",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Icon(Icons.message)),
                    Text("0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                    ),
                  ],
                ),
              )
            ]),
          )),
        ),
      ),
    );
  }
}

class ItemPertanyaan extends StatefulWidget {
  const ItemPertanyaan({Key key}) : super(key: key);

  @override
  _ItemPertanyaanState createState() => _ItemPertanyaanState();
}

class _ItemPertanyaanState extends State<ItemPertanyaan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FintipsDetailPage()),
            );
          },
          child: SizedBox(
              child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Yuskiah -",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "19-03-2021 22:20",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 17.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15.0, right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('assets/images/cewe.png',
                            height: 40, width: 34),
                      ),
                    ),
                    Flexible(
                      child: Text(
                          "Ada yang pernah jualan cilok? boleh dong bagi tips nya, aku mau jualan cilok nih"),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward),
                    Text("21"),
                    Icon(Icons.arrow_downward),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.remove_red_eye_sharp),
                    ),
                    Text("105k"),
                    Container(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(
                        "Beri Jawaban",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: HexColor("#3080EE")),
                      ),
                    )
                  ],
                ),
              )
            ]),
          )),
        ),
      ),
    );
  }
}
