import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../../../widgets/button_app.dart';
import '../../../widgets/textfiled.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      backgroundColor: const Color(0xff333333),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const SizedBox(
                height: 80,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.emailAddress,
                controller: TextEditingController(text: ''),
                hintText: 'email',
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
              SizedBox(
                height: 20,
              ),
              TextFieldSignUp(
                textInputType: TextInputType.emailAddress,
                controller: TextEditingController(text: ''),
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
                textInputType: TextInputType.text,
                controller: TextEditingController(text: ''),
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
                  // if (_formKey.currentState!.validate()) {
                  //   controller.onClickSignIn(context);
                  // }
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
