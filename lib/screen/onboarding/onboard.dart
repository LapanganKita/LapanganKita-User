import 'package:flutter/material.dart';
import 'package:lapangankita_user/screen/authenticate/register_screen.dart';
import 'package:lapangankita_user/screen/onboarding/login_register_onboard_screen.dart';
import 'package:lapangankita_user/screen/onboarding/slider.dart';
import 'package:lapangankita_user/components/constant.dart' show primary_color;

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentpage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Booking Lapangan",
      description:
          "ndksndksndksndksnksdsdmskdskdssklfnklsdnfklsdnflsdknfklsdfnklsdnfklsnfklsnfkls",
      image: "assets/images/asset_login_register.png",
    ),
    SliderPage(
      title: "Booking Lapangan",
      description:
          "ndksndksndksndksnksdsdmskdskdsfskjfksdjfksdjfklsdfklsjfklsfsdsfdsfsdfsdfsd",
      image: "assets/images/asset_login_register.png",
    ),
    SliderPage(
      title: "Booking Lapangan",
      description:
          "ndksndksndksndksnksdsdmskdskdfsdfsdfsfsfsfsfsdfsfsfsfsfsdfsdfsfsdfsdfsfsds",
      image: "assets/images/asset_login_register.png",
    )
  ];

  _onChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      height: 10,
                      width: (index == _currentpage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentpage)
                              ? primary_color
                              : primary_color.withOpacity(0.5)),
                    );
                  }),
                ),
                InkWell(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                        Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginRegisterOnboard();
                  }));
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      alignment: Alignment.center,
                      width: (_currentpage == (_pages.length - 1)) ? 200 : 70,
                      decoration: BoxDecoration(
                        color: primary_color,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: (_currentpage == (_pages.length - 1))
                          ? Text(
                              "Get Started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          : Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                              size: 50,
                            )),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
