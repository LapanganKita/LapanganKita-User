import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;
  bool _showretypepassword = false;
  void _togglevisibilitypassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _togglevisibilityretype() {
    setState(() {
      _showretypepassword = !_showretypepassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 60, left: 24),
            child: HeadingText.withColor(
              "REGISTER",
              36,
              primary_color,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 48, left: 24, right: 24),
            child: TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: primary_color),
                labelText: 'Full Name',
                hintText: "Your Full Name",
                labelStyle: TextStyle(color: primary_color),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: primary_color),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.email, color: primary_color),
                labelText: 'Email',
                hintText: "Email Address",
                labelStyle: TextStyle(color: primary_color),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: primary_color),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: TextFormField(
              obscureText: !_showPassword,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.lock, color: primary_color),
                labelText: 'Password',
                hintText: "Type your Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglevisibilitypassword();
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                    color: primary_color,
                  ),
                ),
                labelStyle: TextStyle(color: primary_color),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: primary_color),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: TextFormField(
              obscureText: !_showretypepassword,
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: primary_color),
                labelText: 'Re-Type Password',
                hintText: "Re-Type your Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglevisibilityretype();
                  },
                  child: Icon(
                    _showretypepassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: primary_color,
                  ),
                ),
                labelStyle: TextStyle(color: primary_color),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: primary_color),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 56),
              width: 300,
              height: 56,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                color: primary_color,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return navBar();
                  }));
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontFamily: "Ubuntu", fontSize: 18),
                ),
              ))
        ],
      ),
    ));
  }
}
