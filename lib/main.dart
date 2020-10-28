import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/authentication_service.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/screen/authenticate/login_screen.dart';
import 'package:lapangankita_user/screen/authenticate/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthenticationWrapper(),
        ));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null) {
      return navBar();
    }
    return loginScreen();
  }
}
// vincen
