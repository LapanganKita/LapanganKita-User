import 'package:flutter/material.dart';

class historyScreen extends StatefulWidget {
  @override
  _historyScreenState createState() => _historyScreenState();
}

class _historyScreenState extends State<historyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History Page"),
      ),
      body: Center(
        child: Text("This is History Page"),
      ),
    );
  }
}
