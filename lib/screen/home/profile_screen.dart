import 'package:flutter/material.dart';
import 'package:lapangankita_user/authentication_service.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatefulWidget {
  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
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
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text("Sign Out"),
          )
        ]),
      ),
    );
  }
}
