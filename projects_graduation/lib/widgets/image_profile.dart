import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import '../pages/auth/profile/donor/controller/profile_controller.dart';

class ImageProfile extends StatelessWidget {
  final String imageProfile;
  final double height;
  final double width;
  ImageProfile({
    Key? key,
    this.imageProfile = '',
    this.height = 50,
    this.width = 50,
  }) : super(key: key);
  var controllerProfile = Get.put(ProfileController());

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
        child: controllerProfile.pickedImage.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(controllerProfile.pickedImage.value),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : Image.asset(
                AppAssets.imageProfile,
              ),
      ),
    );
  }
}
