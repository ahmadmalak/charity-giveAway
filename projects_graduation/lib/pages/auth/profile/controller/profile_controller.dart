import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projects_graduation/firebase/auth_service.dart';
import 'package:projects_graduation/route/routes.dart';

import '../../../../constant/constants.dart';
import '../../../../route/router_constans.dart';
import '../../../../widgets/toastmessag.dart';

class ProfileController extends GetxController {
// RxString donarName = ''.obs;
  AuthService authService = AuthService();
  TextEditingController donarNameController = TextEditingController();
  TextEditingController donarPhoneController = TextEditingController();
  TextEditingController donarPasswordController = TextEditingController();
  TextEditingController donarEmailController = TextEditingController();

  clearSignUpFields() {
    donarEmailController.clear();
    donarPasswordController.clear();
    donarPhoneController.clear();
    donarNameController.clear();
  }

  Future<void> onClickSignIn(BuildContext context) async {
    final db = FirebaseFirestore.instance;

    BotToast.showLoading();
    String userId = await authService.signInWithEmailAndPassword(
        email: donarEmailController.text, password: donarPasswordController.text, context: context);
    print(userId);
    if (userId.isNotEmpty) {
      DocumentSnapshot document = await db.collection('users').doc(userId).get();
      if (!document.exists) {
        box.write('isLogged', true);
        pushNamedAndClearStack(context, appRootRoute);
      } else {
        showToast(message: 'user not found', context: context);
      }
    }

    // await authService.onCreateDonarAccount(
    //     email: donarEmailController.text,
    //     password: donarPasswordController.text,
    //     phone: donarPhoneController.text,
    //     context: context,
    //     name: donarNameController.text);
    BotToast.closeAllLoading();
  }
}
