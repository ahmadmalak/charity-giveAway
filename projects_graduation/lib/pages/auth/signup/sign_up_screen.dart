import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects_graduation/constant/app_assets.dart';
import 'package:projects_graduation/constant/constants.dart';
import 'package:projects_graduation/pages/auth/signup/textfiled.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
        elevation: 0,
        centerTitle: true,
        title: Text('SignUp'),
      ),
      backgroundColor: Color(0xff333333),
      body: Stack(children: [
        Column(
          children: [SvgPicture.asset(AppAssets.backgroundShape)],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 400,
              ),
              const SizedBox(
                height: 80,
              ),
              TextFieldSignUp(
                controller: TextEditingController(text: ''),
                hintText: 'name',
                hintColor: kGrayColor02,
                height: 80,
                horizontalPadding: 17,
                verticalPadding: 15,
                onChanged: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                controller: TextEditingController(text: ''),
                hintText: 'email',
                hintColor: kGrayColor02,
                height: 80,
                horizontalPadding: 17,
                verticalPadding: 15,
                onChanged: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                controller: TextEditingController(text: ''),
                hintText: 'phone',
                hintColor: kGrayColor02,
                height: 80,
                horizontalPadding: 17,
                verticalPadding: 15,
                onChanged: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldSignUp(
                controller: TextEditingController(text: ''),
                hintText: 'password',
                hintColor: kGrayColor02,
                height: 80,
                horizontalPadding: 17,
                verticalPadding: 15,
                onChanged: () {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
