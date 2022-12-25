import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_graduation/pages/donator/home/body.dart';
import 'package:projects_graduation/widgets/text_view_widget.dart';

import '../../../constant/app_assets.dart';
import '../../../constant/constants.dart';
import '../../../size_config.dart';
import '../../../widgets/image_profile.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "/splash";
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          leadingWidth: 80,
          toolbarHeight: 60,
          centerTitle: true,
          actions: [
            ImageProfile(
              height: 30.h,
              width: 30.w,
              imageProfile: '',
            ),
            SizedBox(
              width: 20.w,
            )
          ],
          backgroundColor: const Color(0x44000000),
          elevation: 0,
          title: regularTextLight(text: "Home", context: context, sizeText: 20),
          leading: GestureDetector(
            onTap: () {/* Write listener code here */},
            child: Transform.translate(
              offset: Offset(-10, 6),
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
