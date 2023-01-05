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
  void _splashTimer() {
    bool isDonorLogged = box.read('isLogged') ?? false;
    bool isCharityLogged = box.read('isCharityLogged') ?? false;
    Timer(const Duration(seconds: 3), () {
      if (isDonorLogged) {
        pushNamedAndClearStack(context, appRootRoute);
      } else if (isCharityLogged) {
        pushNamedAndClearStack(context, charityAppRootRoute);
      } else {
        pushNamedAndClearStack(context, introScreenRoute);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppAssets.splashLogo,
              height: 170,
              width: 170,
            ),
          ),
        ],
      ),
    );
  }
}
