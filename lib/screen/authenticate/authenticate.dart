import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lapangankita_user/screen/authenticate/login_screen.dart';
import 'package:lapangankita_user/screen/authenticate/register_screen.dart';
import 'package:lapangankita_user/screen/onboarding/login_register_onboard_screen.dart';
import 'package:lapangankita_user/screen/onboarding/onboard.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Onboarding());
  }
}
