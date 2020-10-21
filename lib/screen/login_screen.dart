import 'package:flutter/material.dart';
import 'package:lapangankita_user/screen/register_screen.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _showPassword = false;
  void _togglevisibilitypassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 60, left: 24),
                child: HeadingText.withColor(
                  "LOGIN",
                  36,
                  primary_color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 64, left: 24, right: 24),
                child: TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,
                        color: primary_color),
                    labelText: 'Email',
                    hintText: "Email Address",
                    labelStyle:
                        TextStyle(color: primary_color),
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
                    prefixIcon: Icon(Icons.lock,
                        color: primary_color),
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
                    labelStyle:
                        TextStyle(color: primary_color),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: primary_color),
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 40, right: 24),
                  child: GestureDetector(
                    onTap: () {
                      print("asd");
                    },
                    child: new Text("Forgot Password"),
                  )),
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
                      "Login",
                      style: TextStyle(fontFamily: "Ubuntu", fontSize: 18),
                    ),
                  )),
            ],
          ),
          Align(
            alignment: Alignment(0.5, 0.95),
            child: Container(
              //margin: EdgeInsets.only(top: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      }));
                    },
                    child: new Text("Register Now",
                        style:
                            TextStyle(color: primary_color)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
