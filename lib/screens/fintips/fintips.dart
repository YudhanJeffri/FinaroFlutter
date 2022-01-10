import 'package:finaro_project/screens/fintips/buatThread.dart';
import 'package:finaro_project/screens/fintips/fintipsDetail.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FinTipsPage extends StatefulWidget {
  const FinTipsPage({Key key}) : super(key: key);

  @override
  _FinTipsPageState createState() => _FinTipsPageState();
}

class _FinTipsPageState extends State<FinTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuatThreadPage()),
            );
          },
        ),
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: new Text(
            "FinTips",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: HexColor("#C4C4C4"))),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text("Thread Teraktif",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: HexColor("#C4C4C4"))),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text("Thread UKM",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: HexColor("#C4C4C4"))),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text("Thread Bisnis",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: ListView(
                    children: [
                      ListItemThread(),
                      ListItemThread(),
                      ListItemThread(),
                      ListItemThread(),
                      ListItemThread(),
                      ListItemThread(),
                      ListItemThread(),
                      ListItemThread(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ListItemThread extends StatefulWidget {
  const ListItemThread({Key key}) : super(key: key);

  @override
  _ListItemThreadState createState() => _ListItemThreadState();
}

class _ListItemThreadState extends State<ListItemThread> {
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
