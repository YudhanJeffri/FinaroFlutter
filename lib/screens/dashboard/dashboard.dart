import 'package:carousel_slider/carousel_slider.dart';
import 'package:finaro_project/screens/dashboard/CarouselWithDotsPage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final List<String> imgList = [
  'assets/images/banner.png',
  'assets/images/splashscreen.png',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
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
            ],
          ),
        ),
      ),
    );
  }
}
