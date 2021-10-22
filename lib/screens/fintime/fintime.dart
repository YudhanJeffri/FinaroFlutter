import 'package:flutter/material.dart';

class FinTimePage extends StatefulWidget {
  const FinTimePage({ Key key }) : super(key: key);

  @override
  _FinTimePageState createState() => _FinTimePageState();
}

class _FinTimePageState extends State<FinTimePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("FinTime"),
      ),
    );
  }
}