import 'dart:async';

import 'package:ele_cart_e_commerce_app/login.dart';
import 'package:ele_cart_e_commerce_app/template.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (box.read('token') != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => const TemplateView()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFC996),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/icon.png',
              height: 100,
            ),
            const SizedBox(height: 40),
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation(Colors.white),
            // )
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xffFFC996)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
