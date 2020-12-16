import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lapangankita_user/models/models.dart';
import 'package:lapangankita_user/screen/authenticate/authenticates.dart';
import 'package:lapangankita_user/services/services.dart';
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
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
