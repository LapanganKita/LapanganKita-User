import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/constant.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/screen/authenticate/authenticate.dart';
import 'package:lapangankita_user/screen/services/auth.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatefulWidget {
  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  final AuthService _auth = AuthService();
  bool val = false;

  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: primary_color,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: EdgeInsets.only(top: 32, left: 32),
            child: Column(children: [
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 32),
                  child: HeadingText.withColor("Profile", 32, Colors.white)),

              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width / 16),
                child: Row(
                  children: [
                    Image.asset("assets/images/blank-profile.png",
                        width: 92, height: 92),
                    Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Column(
                        children: [Text("Nama"), Text("Email")],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Image.asset("assets/images/kalender.png"),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Image.asset("assets/images/edit.png"),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)),
                margin: EdgeInsets.only(
                  right: 32,
                  top: 32
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.3,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 32),
                      child: Row(
                        children: [
                          Image.asset("assets/images/icon notif.png"),
                          Container(
                              width: 160,
                              margin: EdgeInsets.only(left: 16),
                              child: Text(
                                "Notification",
                                style: TextStyle(),
                              )),
                          Container(
                            child: Switch(
                                value: val,
                                onChanged: (newVal) {
                                  onSwitchValueChanged(newVal);
                                }),
                          )
                        ],
                      ),
                    ),
                    Divider(indent: 32, endIndent: 32, thickness: 2),
                    GestureDetector(
                      onTap: () {
                        print("Pressed");
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 35),
                        width: MediaQuery.of(context).size.width - 64,
                        height: 50,
                        child: Row(
                          children: [
                            Image.asset("assets/images/icon payment.png"),
                            Container(
                                width: 180,
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Improvement Box",
                                  style: TextStyle(),
                                )),
                            Container(child: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ),
                    ),
                    Divider(indent: 32, endIndent: 32, thickness: 2),
                    GestureDetector(
                      onTap: () {
                        print("Pressed");
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 35),
                        width: MediaQuery.of(context).size.width - 64,
                        height: 50,
                        child: Row(
                          children: [
                            Image.asset("assets/images/icon contact us.png"),
                            Container(
                                width: 180,
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Contact Us",
                                  style: TextStyle(),
                                )),
                            Container(child: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ),
                    ),
                    Divider(indent: 32, endIndent: 32, thickness: 2),
                    GestureDetector(
                      onTap: () {
                        print("Pressed");
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 35),
                        width: MediaQuery.of(context).size.width - 64,
                        height: 50,
                        child: Row(
                          children: [
                            Image.asset("assets/images/icon logout.png"),
                            Container(
                                width: 180,
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(),
                                )),
                            Container(child: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
              // Text("This is Profile Page"),
              // RaisedButton(
              //   onPressed: () async {
              //     await _auth.signOut();
              //   },
              //   child: Text("Sign Out"),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
