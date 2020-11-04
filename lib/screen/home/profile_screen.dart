import 'package:flutter/material.dart';
import 'package:lapangankita_user/screen/authenticate/authenticate.dart';
import 'package:lapangankita_user/screen/services/auth.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatefulWidget {
  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Center(
        child: Column(children: [
          Text("This is Profile Page"),
          RaisedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text("Sign Out"),
          )
        ]),
      ),
    );
  }
}
