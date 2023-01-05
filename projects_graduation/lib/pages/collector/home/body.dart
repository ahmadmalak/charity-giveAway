import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/pages/collector/home/campaigns/donated_list.dart';

import '../../../size_config.dart';
import '../../auth/profile/donor/controller/profile_controller.dart';

class Body extends StatelessWidget {
  final TextEditingController _searchName = TextEditingController();
  var controllerProfile = Get.put(ProfileController());
  Body({super.key});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 10.h,
              ),
              //  const DonationCategory(),

              DonatedList(),
              const Divider(height: 5),
              // Padding(
              //   padding: EdgeInsets.all(defaultSize * 2), //20
              //   child: const Text(
              //     "Charities List",
              //     style: TextStyle(color: kPrimaryColor, fontSize: 20),
              //   ),
              // ),
              // CharitiesList(
              //     //  campaign: null,
              //     )
            ],
          ),
        ),
      ),
    );
  }
}
