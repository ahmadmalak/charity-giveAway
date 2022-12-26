import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/constant/app_assets.dart';
import 'package:projects_graduation/constant/constants.dart';
import 'package:projects_graduation/pages/auth/signin/sign_in_screen.dart';
import 'package:projects_graduation/widgets/textfiled.dart';

import '../../../widgets/button_app.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  static String signUpRoute = "/signUp";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var controller = Get.put(SignUpController());
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
        child: Stack(children: [
          Positioned(
            top: -200,
            child: SvgPicture.asset(
              AppAssets.backgroundShape,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextFieldSignUp(
                    textInputType: TextInputType.text,
                    controller: controller.donarNameController,
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
                    controller: controller.donarEmailController,
                    hintText: 'email',
                    hintColor: kGrayColor02,
                    height: 17,
                    horizontalPadding: 17,
                    verticalPadding: 15,
                    onValidator: (val) {
                      if (val!.isEmpty) {
                        return 'please enter email';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(controller.donarEmailController.text.trim())) {
                        return 'email invalid';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (String? val) {
                      if (val!.isEmpty) {
                        return 'please_enter email ';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(controller.donarEmailController.text.trim())) {
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
                    controller: controller.donarPhoneController,
                    hintText: 'phone',
                    hintColor: kGrayColor02,
                    height: 17,
                    horizontalPadding: 17,
                    verticalPadding: 10,
                    onValidator: (val) {
                      if (val!.isEmpty) {
                        return 'please enter phone';
                      } else if (controller.donarPhoneController.text.length != 10) {
                        return 'invalid phone number';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (String? val) {
                      if (val!.isEmpty) {
                        return 'please enter phone number';
                      } else if (controller.donarPhoneController.text.length != 10) {
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
                    controller: controller.donarPasswordController,
                    hintText: 'password',
                    hintColor: kGrayColor02,
                    height: 17,
                    horizontalPadding: 17,
                    verticalPadding: 15,
                    onValidator: (val) {
                      if (val!.isEmpty) {
                        return 'please enter password';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (String? val) {
                      if (val!.isEmpty) {
                        return 'please enter password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonApp(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        controller.onClickSignUp(context).then((value) => Get.toNamed(SignInScreen.signInRoute));
                      }
                    },
                    text: 'Sign Up',
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
