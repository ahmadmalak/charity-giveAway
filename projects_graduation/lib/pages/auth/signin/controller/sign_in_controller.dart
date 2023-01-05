import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projects_graduation/firebase/auth_service.dart';

import '../../../../constant/constants.dart';
import '../../../../route/router_constans.dart';
import '../../../../route/routes.dart';
import '../../../../widgets/toastmessag.dart';

class SignInController extends GetxController {
// RxString donarName = ''.obs;
  AuthService authService = AuthService();
  TextEditingController donarNameController = TextEditingController();
  TextEditingController donarPhoneController = TextEditingController();
  TextEditingController donarPasswordController = TextEditingController();
  TextEditingController donarEmailController = TextEditingController();

  clearSignInFields() {
    donarEmailController.clear();
    donarPasswordController.clear();
  }

  Future<void> onClickSignIn(BuildContext context) async {
    BotToast.showLoading();
    UserCredential? userCredential = await authService.signInWithEmailAndPassword(
        email: donarEmailController.text, password: donarPasswordController.text, context: context);
    print(userCredential);
    if (userCredential != null) {
      box.write('isLogged', true);
      box.write('userEmail', userCredential.user!.email);
      box.write('userId', userCredential.user!.uid.toString());
      pushNamedAndClearStack(context, appRootRoute);
      clearSignInFields();
    } else {
      showToast(message: 'user not found', context: context);
    }
    BotToast.closeAllLoading();
  }
}
