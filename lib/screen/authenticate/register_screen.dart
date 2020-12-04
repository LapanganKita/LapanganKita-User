import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/databaseManager/firebase.dart';
import 'package:lapangankita_user/screen/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String error = '';
  String email = '';
  String password = '';
  String retypePassword = '';
  String fullName = '';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formkey,
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
                controller: nameController,
                validator: (val) => val.isEmpty ? 'Enter Your Full Name' : null,
                onChanged: (val) {
                  setState(() => fullName = val.trim());
                },
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: primary_color),
                  labelText: 'Full Name',
                  hintText: "Your Full Name",
                  labelStyle: TextStyle(color: primary_color),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primary_color),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: TextFormField(
                controller: emailController,
                validator: (val) => val.isEmpty ? 'Enter Your Email' : null,
                onChanged: (val) {
                  setState(() => email = val.trim());
                },
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: primary_color),
                  labelText: 'Email',
                  hintText: "Email Address",
                  labelStyle: TextStyle(color: primary_color),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primary_color),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: TextFormField(
                controller: passwordController,
                validator: (val) => val.length < 6
                    ? 'Must contain a minimum of 6 characters'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: !_showPassword,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: primary_color),
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
                    borderSide: BorderSide(color: primary_color),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: TextFormField(
                validator: (val) => val.length < 6
                    ? 'Must contain a minimum of 6 characters'
                    : null,
                onChanged: (val) {
                  setState(() => retypePassword = val);
                },
                obscureText: !_showretypepassword,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: primary_color),
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
                    borderSide: BorderSide(color: primary_color),
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
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.register(email, password);
                      createUser(nameController.text, emailController.text,
                          passwordController.text);
                      if (result == null) {
                        setState(() => error = 'Please enter a valid email');
                      }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontFamily: "Ubuntu", fontSize: 18),
                  ),
                )),
            SizedBox(height: 12),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ],
        ),
      ),
    ));
  }
}
