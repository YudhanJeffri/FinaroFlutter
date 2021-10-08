import 'package:finaro_project/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finaro_project/screens/home.dart';
import 'package:finaro_project/screens/onboarding/slider.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "FinCari",
        description: "Panggil Pedagang terdekat hanya dalam gengganganmu",
        image: "assets/fincari.svg"),
    SliderPage(
        title: "FinTime",
        description:
            "Tak perlu pusing lagi dengan internet perjalananmu aman tercatat",
        image: "assets/fintime.svg"),
    SliderPage(
        title: "FinTips",
        description:
            "Berbagi tips dan aspirasi dari konsumer tingkatkan bisnis",
        image: "assets/fintips.svg"),
    SliderPage(
        title: "FinSubs",
        description: "Berlangganan dengan pedagang favorite kamu",
        image: "assets/finsubs.svg"),
    SliderPage(
        title: "FinBinsis",
        description: "Kelola bisnis keliling kamu hanya dalam genggaman",
        image: "assets/finbisnis.svg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.blue
                                : Colors.blue.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: MaterialButton(
                    child: (_currentPage == (_pages.length - 1))
                        ? Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        : Icon(
                            Icons.navigate_next,
                            size: 50,
                            color: Colors.white,
                          ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
