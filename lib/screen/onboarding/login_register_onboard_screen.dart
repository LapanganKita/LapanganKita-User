import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/screen/authenticate/login_screen.dart';
import 'package:lapangankita_user/screen/authenticate/register_screen.dart';

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
              margin: EdgeInsets.only(top: 72, left: 24),
              child: Image.asset("assets/images/lapanganKita.png"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80, right: 24),
                child: Image.asset("assets/images/asset_login_register.png"),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 96, left: 24),
                      child: Text(
                        "Welcome to LapanganKita!",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24, top: 16),
                    child: Text(
                        "Are you ready to enjoy a whole new life without limit? Let's go!  ",
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            color: Colors.black)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 24, top: 40),
                            width: 154,
                            height: 56,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              color: primary_color,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return loginScreen();
                                }));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontFamily: "Ubuntu", fontSize: 18),
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 24, top: 40),
                            width: 154,
                            height: 56,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)),
                              color: primary_color,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterScreen();
                                }));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontFamily: "Ubuntu", fontSize: 18),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 24, left: 24),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "By logging in or interesting, you agree to our",
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return RegisterScreen();
                              // }));
                            },
                            child: new Text(" Terms of Service",
                                maxLines: 2,
                                style: TextStyle(color: primary_color)),
                          ),
                          Text(" and"),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return RegisterScreen();
                              // }));
                            },
                            child: new Text(
                              "Service",
                              style: TextStyle(color: primary_color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
