import 'package:flutter/material.dart';
import 'package:lapangankita_user/models/user.dart';

import 'package:firebase_core/firebase_core.dart';

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
