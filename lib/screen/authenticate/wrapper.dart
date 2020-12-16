part of 'authenticates.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);

    // return home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return NavBar();
    }
  }
}
