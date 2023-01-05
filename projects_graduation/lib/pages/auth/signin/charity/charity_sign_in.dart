import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/route/router_constans.dart';
import 'package:projects_graduation/route/routes.dart';

import '../../../../constant/app_assets.dart';
import '../../../../constant/constants.dart';
import '../../../../widgets/button_app.dart';
import '../../../../widgets/textfiled.dart';
import 'controller/controller.dart';

class CharitySignInScreen extends StatefulWidget {
  static String signInRoute = "/";

  const CharitySignInScreen({Key? key}) : super(key: key);

  @override
  State<CharitySignInScreen> createState() => _CharitySignInScreenState();
}

class _CharitySignInScreenState extends State<CharitySignInScreen> {
  var controller = Get.put(CharitySignInController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('SignIn'),
      ),
      backgroundColor: const Color(0xff333333),
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
                  SizedBox(
                    height: 150.h,
                    child: Image.asset(AppAssets.donationIcon),
                  ),
                  SizedBox(
                    height: 120.h,
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
                        return 'please enter password';
                      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(controller.charityEmailController.text.trim())) {
                        return 'email invalid';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (String? val) {
                      if (val!.isEmpty) {
                        return 'please_enter password ';
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
                    obscureText: true,
                    textInputType: TextInputType.text,
                    controller: controller.charityPasswordController,
                    hintText: 'password',
                    hintColor: kGrayColor02,
                    height: 17,
                    horizontalPadding: 17,
                    verticalPadding: 15,
                    onValidator: (String? val) {
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
                        controller.onClickSignIn(context);
                      }
                    },
                    text: 'Sign In',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        const Text(
                          'Need An Charity Account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            pushNamed(context: context, routeName: charitySignUpScreenRoute);
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: kGreenColor, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
