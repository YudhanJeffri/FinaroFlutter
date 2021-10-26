import 'package:carousel_slider/carousel_slider.dart';
import 'package:finaro_project/screens/dashboard/CarouselWithDotsPage.dart';
import 'package:finaro_project/screens/dashboard/terdekat/terdekat.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final List<String> imgList = [
  'https://raw.githubusercontent.com/YudhanJeffri/FinaroFlutter/main/assets/images/banner.png',
  'https://raw.githubusercontent.com/YudhanJeffri/FinaroFlutter/main/assets/images/banner_2.png',
  'https://raw.githubusercontent.com/YudhanJeffri/FinaroFlutter/main/assets/images/banner_3.png',
];

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                  IconButton(
                      icon: Image.asset('assets/images/profile.png'),
                      onPressed: () {}),
                ],
              ),
              Text.rich(
                TextSpan(
                    text: 'Selamat Pagi,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    children: [
                      TextSpan(
                        text: '\nHartanto',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                    ]),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    "Lokasi Kamu",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/arrow_down.png',
                      scale: 2,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Text("Unnamed Road",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(Icons.search, size: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Lokasi Kamu',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CarouselWithDotsPage(imgList: imgList),
              Row(
                children: [
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TerdekatPage()),
                      );
                    },
                    child: new Container(
                      child: Column(
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/map_icon_test4.png')),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x0c000000),
                                  blurRadius: 20,
                                  offset: Offset(3, 3),
                                ),
                                BoxShadow(
                                  color: Color(0x0c000000),
                                  blurRadius: 2,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Terdekat",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  new GestureDetector(
                    onTap: () {
                      print("Container clicked2");
                    },
                    child: new Container(
                      child: Column(
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/top_rated_icon1.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x0c000000),
                                  blurRadius: 20,
                                  offset: Offset(3, 3),
                                ),
                                BoxShadow(
                                  color: Color(0x0c000000),
                                  blurRadius: 2,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Terlaris",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
