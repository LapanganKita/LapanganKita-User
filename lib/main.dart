import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/models/user.dart';
import 'package:lapangankita_user/screen/authenticate/authenticate.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/screen/authenticate/login_screen.dart';
import 'package:lapangankita_user/screen/authenticate/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lapangankita_user/screen/onboarding/login_register_onboard_screen.dart';
import 'package:lapangankita_user/screen/onboarding/onboard.dart';
import 'package:lapangankita_user/screen/services/auth.dart';
import 'package:lapangankita_user/screen/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
