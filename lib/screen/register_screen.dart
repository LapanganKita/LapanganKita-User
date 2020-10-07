import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 60, left: 24),
              child: Text(
                "REGISTER",
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 29, 97, 252)),
              )),
          Container(
            margin: EdgeInsets.only(top: 48, left: 24, right: 24),
            child: TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: Color.fromARGB(255, 29, 97, 252)),
                labelText: 'Full Name',
                hintText: "Your Full Name",
                labelStyle: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 29, 97, 252)),
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
                    Icon(Icons.email, color: Color.fromARGB(255, 29, 97, 252)),
                labelText: 'Email',
                hintText: "Email Address",
                labelStyle: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 29, 97, 252)),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: TextFormField(
              obscureText: true,
              cursorColor: Theme.of(context).cursorColor,
              maxLength: 20,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.lock, color: Color.fromARGB(255, 29, 97, 252)),
                labelText: 'Password',
                hintText: "Type your Password",
                labelStyle: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 29, 97, 252)),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: TextFormField(
              obscureText: true,
              cursorColor: Theme.of(context).cursorColor,
              maxLength: 20,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: Color.fromARGB(255, 29, 97, 252)),
                labelText: 'Re-Type Password',
                hintText: "Re-Type your Password",
                labelStyle: TextStyle(color: Color.fromARGB(255, 29, 97, 252)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 29, 97, 252)),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
