import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constant/constants.dart';
import '../../../../widgets/button_app.dart';
import '../../../../widgets/textfiled.dart';
import '../../../donor/home/controlles/home_Controller.dart';
import '../../../donor/home/location/location.dart';
import 'controller/profile_controller.dart';
import 'image_profile/image_profile_edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());
  var homeController = Get.put(HomeController());
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetch();
  }

  Future getImage({required ImageSource imageSource}) async {
    final image = await picker.pickImage(source: imageSource);
    if (image == null) return;
    controller.imageFile.value = File(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  controller.logout(context);
                },
                child: const Icon(Icons.logout)),
          )
        ],
      ),
      backgroundColor: const Color(0xff333333),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  getImage(imageSource: ImageSource.gallery);
                },
                child: ProfileImageProfile(
                  height: 80,
                  width: 80,
                  imageProfile: controller.pickedImage.value,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.emailAddress,
                controller: controller.donarEmailController,
                hintText: 'email',
                enabled: false,
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 15,
                onValidator: (val) {
                  //  if (val!.isEmpty) {
                  //   return 'please enter password';
                  // } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(controller.donarEmailController.text.trim())) {
                  //   return 'email invalid';
                  // } else {
                  //   return null;
                  // }
                },
                onChanged: (String? val) {
                  // if (val!.isEmpty) {
                  //   return 'please_enter password ';
                  // } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(controller.donarEmailController.text.trim())) {
                  //   return 'email invalid';
                  // } else {
                  //   return null;
                  // }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.emailAddress,
                controller: controller.donarNameController,
                hintText: 'name',
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 15,
                onValidator: (val) {
                  //  if (val!.isEmpty) {
                  //   return 'please enter password';
                  // } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(controller.donarEmailController.text.trim())) {
                  //   return 'email invalid';
                  // } else {
                  //   return null;
                  // }
                },
                onChanged: (String? val) {
                  // if (val!.isEmpty) {
                  //   return 'please_enter password ';
                  // } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(controller.donarEmailController.text.trim())) {
                  //   return 'email invalid';
                  // } else {
                  //   return null;
                  // }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.emailAddress,
                controller: controller.donarPhoneController,
                hintText: 'phone',
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 15,
                onValidator: (val) {
                  //  if (val!.isEmpty) {
                  //   return 'please enter password';
                  // } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(controller.donarEmailController.text.trim())) {
                  //   return 'email invalid';
                  // } else {
                  //   return null;
                  // }
                },
                onChanged: (String? val) {
                  // if (val!.isEmpty) {
                  //   return 'please_enter password ';
                  // } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(controller.donarEmailController.text.trim())) {
                  //   return 'email invalid';
                  // } else {
                  //   return null;
                  // }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              LocationPicker(),
              const SizedBox(
                height: 40,
              ),
              ButtonApp(
                onPressed: () async {
                  controller.updateUserInfo(
                    context,
                    homeController.locationName.value,
                  );
                },
                text: 'Save',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
