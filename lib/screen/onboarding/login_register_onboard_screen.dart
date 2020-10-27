import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;

class LoginRegisterOnboard extends StatefulWidget {
  @override
  _LoginRegisterOnboardState createState() => _LoginRegisterOnboardState();
}

class _LoginRegisterOnboardState extends State<LoginRegisterOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 72, left: 8),
              child: Image.asset("assets/images/lapanganKita.png"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80),
                child: Image.asset("assets/images/asset_login_register.png"),
              ),
            ),
            Column(
              children: [Container()],
            )
          ],
        ),
      ),
    );
  }
}
