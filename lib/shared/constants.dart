import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfect_e_commerce/modules/login_module/login_screen.dart';
import '../network/local/cashe_helper.dart';

ThemeData KlightTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'opensans',
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.grey[300],
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[300],
    ),
    backgroundColor:Colors.teal,
    //elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.teal,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey[300],
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.teal,
    elevation: 20,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor:Colors.teal,
  ),
);

String HOME = '/home';
String LOGIN = '/auth/login';
String REGISTER = '/auth/register';
String? token;
void signOut(context) {
  CasheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  });
}