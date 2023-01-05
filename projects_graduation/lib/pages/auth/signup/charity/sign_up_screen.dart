import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/constant/constants.dart';
import 'package:projects_graduation/pages/auth/signup/charity/controller/sign_up_controller.dart';
import 'package:projects_graduation/widgets/textfiled.dart';

import '../../../../widgets/button_app.dart';
import 'document/upload_document.dart';
import 'location/location.dart';

class CharitySignUpScreen extends StatefulWidget {
  static String signUpRoute = "/signUp";
  const CharitySignUpScreen({Key? key}) : super(key: key);

  @override
  State<CharitySignUpScreen> createState() => _CharitySignUpScreenState();
}

class _CharitySignUpScreenState extends State<CharitySignUpScreen> {
  var controller = Get.put(CharitySignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('SignUp'),
      ),
      backgroundColor: Color(0xff333333),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldSignUp(
                textInputType: TextInputType.text,
                controller: controller.charityNameController,
                hintText: 'name',
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 15,
                onValidator: (String? val) {
                  if (val!.isEmpty) {
                    return 'please enter name';
                  } else {
                    return null;
                  }
                },
                onChanged: (String? val) {
                  if (val!.isEmpty) {
                    return 'please enter name ';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.emailAddress,
                controller: controller.charityEmailController,
                hintText: 'email',
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 15,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return 'please enter email';
                  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(controller.charityEmailController.text.trim())) {
                    return 'email invalid';
                  } else {
                    return null;
                  }
                },
                onChanged: (String? val) {
                  if (val!.isEmpty) {
                    return 'please_enter email ';
                  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(controller.charityEmailController.text.trim())) {
                    return 'email invalid';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.number,
                controller: controller.charityPhoneController,
                hintText: 'phone',
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 10,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return 'please enter phone';
                  } else if (controller.charityPhoneController.text.length != 10) {
                    return 'invalid phone number';
                  } else {
                    return null;
                  }
                },
                onChanged: (String? val) {
                  if (val!.isEmpty) {
                    return 'please enter phone number';
                  } else if (controller.charityPhoneController.text.length != 10) {
                    return 'invalid phone number';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.text,
                controller: controller.charityPasswordController,
                hintText: 'password',
                hintColor: kGrayColor02,
                height: 17,
                horizontalPadding: 17,
                verticalPadding: 15,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return 'please enter password';
                  } else if (val.length < 6) {
                    return 'password should be at least 8 digits';
                  } else {
                    return null;
                  }
                },
                onChanged: (String? val) {
                  if (val!.isEmpty) {
                    return 'please enter password';
                  } else if (val.length < 6) {
                    return 'password should be at least 8 digits';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              LocationPicker(),
              const SizedBox(
                height: 10,
              ),
              UploadDocument(),
              const SizedBox(
                height: 50,
              ),
              ButtonApp(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.onClickSignUp(context).then((value) => Get.back());
                  }
                },
                text: 'Sign Up',
              )
            ],
          ),
        ),
      )),
    );
  }
}
