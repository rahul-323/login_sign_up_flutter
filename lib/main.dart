
import 'package:flutter/material.dart';
import 'package:login_signup_app_flutter/login.dart';
import 'package:login_signup_app_flutter/sign_up_page.dart';
import 'package:login_signup_app_flutter/welcome_page.dart';

import 'forgot_password.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'login',
    debugShowCheckedModeBanner: false,
    routes: {
      'login': (context) => const LoginPage(),
      'sign_up_page': (context) => const SignUpPage(),
      'forgot_password': (context)=> const ForgotPass(),
      'welcome_page' : (context)=> const WelcomePage(),
    },
  )
  );
}





