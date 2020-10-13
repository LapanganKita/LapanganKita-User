import 'package:flutter/material.dart';

class scoreScreen extends StatefulWidget {
  @override
  _scoreScreenState createState() => _scoreScreenState();
}

class _scoreScreenState extends State<scoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score Page"),
      ),
      body: Center(
        child: Text("This is Score Page"),
      ),
    );
  }
}
