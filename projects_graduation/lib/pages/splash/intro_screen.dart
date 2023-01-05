import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/route/router_constans.dart';

import '../../constant/app_assets.dart';
import '../../route/routes.dart';
import '../../widgets/button_app.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('Charity GiveAway'),
      ),
      backgroundColor: const Color(0xff333333),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: -200,
              child: SvgPicture.asset(
                AppAssets.backgroundShape,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                      child: Image.asset(AppAssets.donationIcon),
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    ButtonApp(
                      onPressed: () async {
                        pushNamed(context: context, routeName: charitySignInScreen);
                      },
                      text: 'Charity',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonApp(
                      onPressed: () async {
                        pushNamed(context: context, routeName: loginScreenRoute);
                      },
                      text: 'Donor',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
