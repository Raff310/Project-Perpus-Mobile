import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:perpus_mobile/auth/login.dart';

class MySplashScreen extends StatelessWidget {
  MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F3ED),
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          backgroundColor: Color(0xFFF8F3ED),
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/images/velook_logo.jpg"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: LoginPage(),
        ),
      ),
    );
  }
}