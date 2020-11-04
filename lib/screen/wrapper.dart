import 'package:flutter/material.dart';
import 'package:lapangankita_user/components/navbar.dart';
import 'package:lapangankita_user/models/user.dart';
import 'package:lapangankita_user/screen/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    // return home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return navBar();
    }
  }
}
