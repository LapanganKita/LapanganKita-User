import 'package:flutter/material.dart';
import 'package:lapangankita_user/screen/authenticate/authenticate.dart';
import 'package:lapangankita_user/screen/authenticate/register_screen.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/components/heading_text.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;
import 'package:lapangankita_user/screen/services/auth.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _showPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void _togglevisibilitypassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  String email = '';
  String password = '';
  String error = '';
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
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
                      validator: (val) =>
                          val.isEmpty ? 'Enter Your Email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      controller: emailController,
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
                      validator: (val) => val.length < 6
                          ? 'Must contain a minimum of 6 characters'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      controller: passwordController,
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
                            _showPassword
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
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            dynamic result = await _auth.login(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'Please enter a valid account');
                            }
                          }
                        },
                        child: Text(
                          "Login",
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      }));
                    },
                    child: new Text("Register Now",
                        style: TextStyle(color: primary_color)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
