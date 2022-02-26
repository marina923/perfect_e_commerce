
import 'package:flutter/material.dart';
 import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:perfect_e_commerce/modules/login_module/login_screen.dart';
import 'package:perfect_e_commerce/network/local/cashe_helper.dart';


class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Icons.category,
            function: (){
              return CasheHelper.saveData(key: 'onBoarding', value: true);
            },
            nextScreen: LoginScreen(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            backgroundColor: Colors.teal
        )
    );
  }
}