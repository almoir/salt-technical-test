import 'dart:async';
import 'package:flutter/material.dart';
import 'package:salt_technical_test/presentation/pages/login_page.dart';
import '../../config/theme.dart';
import '../../config/value.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, LoginPage.routeName, (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: mainColors,
        ),
        child: Center(
          child: Image.asset("$assetImagePath/logo.png"),
        ),
      ),
    );
  }
}
