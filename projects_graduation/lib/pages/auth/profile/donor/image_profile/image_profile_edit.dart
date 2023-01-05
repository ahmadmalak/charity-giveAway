import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import '../controller/profile_controller.dart';

class ProfileImageProfile extends StatelessWidget {
  final String imageProfile;
  final double height;
  final double width;
  ProfileImageProfile({
    Key? key,
    this.imageProfile = '',
    this.height = 50,
    this.width = 50,
  }) : super(key: key);
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: controller.imageFile.value != null
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(controller.imageFile.value!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : imageProfile.isNotEmpty
                ? Image.network(
                    imageProfile,
                  )
                : Image.asset(AppAssets.imageProfile),
      ),
    );
  }
}
