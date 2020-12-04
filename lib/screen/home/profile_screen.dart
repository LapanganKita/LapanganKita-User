import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/constant.dart';
import 'package:lapangankita_user/components/custom_tile.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/databaseManager/firebase.dart';
import 'package:lapangankita_user/screen/authenticate/authenticate.dart';
import 'package:lapangankita_user/screen/edit_profile_screen.dart';
import 'package:lapangankita_user/screen/services/auth.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatefulWidget {
  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  void initState() {
    super.initState();
    GetUsername.currentusername();
    GetEmail.currentEmail();
  }

  final AuthService _auth = AuthService();
  bool val = false;

  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  bool turnOnNotification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    color: primary_color,
                    fontSize: 32,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(email),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditProfile();
                          }));
                        },
                        child: Container(
                          height: 25.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: primary_color,
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                              child: Text(
                            "Edit",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontSize: 16.0,
                                color: primary_color),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu",
                  color: primary_color,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomListTile(
                        icon: Icons.computer,
                        text: "My Vouchers",
                      ),
                      Divider(
                        height: 10.0,
                        thickness: 0.4,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CustomListTile(
                          icon: Icons.visibility,
                          text: "Change Password",
                        ),
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      CustomListTile(
                        icon: Icons.shopping_cart,
                        text: "Shipping",
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await _auth.signOut();
                        },
                        child: CustomListTile(
                          icon: Icons.exit_to_app,
                          text: "Logout",
                        ),
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Notifications",
                style: TextStyle(
                  color: primary_color,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "App Notification",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              // print("The value: $value");
                              setState(() {
                                turnOnNotification = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.4,
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
