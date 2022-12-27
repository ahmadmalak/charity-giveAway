import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projects_graduation/constant/app_assets.dart';
import 'package:projects_graduation/route/router_constans.dart';
import 'package:projects_graduation/route/routes.dart';

import '../../constant/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _splashTimer() async {
    bool isLogged = await box.read('isLogged')??false;
    Timer(const Duration(seconds: 3), () {
      if (isLogged) {
        pushNamedAndClearStack(context, appRootRoute);
      } else {
        pushNamedAndClearStack(context, loginScreenRoute);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.logoApp),
      ),
    );
  }
}
