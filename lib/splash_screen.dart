import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone_app/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 2200),
    () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage())));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'lib/assets/ezgif-4-638399623c.gif',
          width: double.maxFinite,
        ),
      )
    );
  }
}