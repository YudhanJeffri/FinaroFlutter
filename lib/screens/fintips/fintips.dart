import 'package:flutter/material.dart';
class FinTipsPage extends StatefulWidget {
  const FinTipsPage({ Key key }) : super(key: key);

  @override
  _FinTipsPageState createState() => _FinTipsPageState();
}

class _FinTipsPageState extends State<FinTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("FinTips"),
      ),
    );
  }
}