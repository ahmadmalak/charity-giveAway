import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/widgets/text_view_widget.dart';

import '../../../constant/app_assets.dart';
import '../../../constant/constants.dart';
import '../../../size_config.dart';
import '../../auth/profile/donor/controller/profile_controller.dart';
import 'body.dart';

class CharityHomePage extends StatefulWidget {
  const CharityHomePage({Key? key}) : super(key: key);
  @override
  _CharityHomePageState createState() => _CharityHomePageState();
}

class _CharityHomePageState extends State<CharityHomePage> {
  late int currentIndex;
  var controllerProfile = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerProfile.fetch();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leadingWidth: 80,
          toolbarHeight: 60,
          centerTitle: true,
          actions: [
            SizedBox(
              width: 20.w,
            ),
          ],
          backgroundColor: const Color(0x44000000),
          elevation: 0,
          title: regularTextLight(text: "Home", context: context, sizeText: 20),
          leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Transform.translate(
              offset: const Offset(-10, 6),
              child: Transform.scale(
                scale: 1.8,
                child: Image.asset(
                  AppAssets.logoApp,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: mainColor,
      body: Body(),
    );
  }
}
