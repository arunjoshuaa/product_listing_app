import 'package:flutter/material.dart';
import 'package:product_listing_app/screens/login_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: 
      
      FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
          ),
          childWidget: SizedBox(
            height: 150,
            child: Image.asset("assets/images/splash_logo.png"),
          ),
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(seconds: 1),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: const LoginScreen(),
        )
      
      ),
    );
  }
}