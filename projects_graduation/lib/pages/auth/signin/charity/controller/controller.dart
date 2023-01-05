import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projects_graduation/firebase/auth_service.dart';

import '../../../../../constant/constants.dart';
import '../../../../../route/router_constans.dart';
import '../../../../../route/routes.dart';
import '../../../../../widgets/toastmessag.dart';

class CharitySignInController extends GetxController {
  AuthService authService = AuthService();
  TextEditingController charityPasswordController = TextEditingController();
  TextEditingController charityEmailController = TextEditingController();

  clearSignInFields() {
    charityEmailController.clear();
    charityPasswordController.clear();
  }

  Future<void> onClickSignIn(BuildContext context) async {
    BotToast.showLoading();
    UserCredential? userCredential = await authService.signInWithEmailAndPassword(
        email: charityEmailController.text, password: charityPasswordController.text, context: context);
    if (userCredential != null) {
      DocumentSnapshot doc = await authService.fetchCharityInfo();
      if (doc.exists) {
        box.write('charityMobileNumber', doc['phoneNumber']);
        box.write('charityAddress', doc['address']);
      }
      box.write('charityId', userCredential.user!.uid.toString());
      box.write('isCharityLogged', true);
      pushNamedAndClearStack(context, charityAppRootRoute);
      clearSignInFields();
    } else {
      showToast(message: 'user not found', context: context);
    }
    BotToast.closeAllLoading();
  }
}
