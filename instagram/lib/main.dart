import 'package:flutter/material.dart';
import 'package:instagram/screen/bottom_navigation_screen.dart';
import 'package:instagram/screen/home_main_screen.dart';
import 'package:instagram/screen/login_screen.dart';
import 'package:instagram/screen/register/register_complete_screen.dart';
import 'package:instagram/screen/register/register_email_screen.dart';
import 'package:instagram/screen/register/register_name_screen.dart';
import 'package:instagram/screen/register/register_password_screen.dart';
import 'package:instagram/screen/register/register_username_screen.dart';

void main() {
  runApp(
    MaterialApp(
      color: Colors.white,
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterEmailScreen(),
        '/register/name': (context) => RegisterNameScreen(),
        '/register/password': (context) => RegisterPasswordScreen(),
        '/register/username': (context) => RegisterUsernameScreen(),
        '/register/complete': (context) => RegisterCompleteScreen(),
        '/main': (context) => BottomNavigationScreen(),
      },
    ),
  );
}
