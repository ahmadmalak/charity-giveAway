import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projects_graduation/firebase/auth_service.dart';

class DonorSignUpController extends GetxController {
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

  Future<void> onClickSignUp(BuildContext context) async {
    BotToast.showLoading();
    await authService.onCreateDonarAccount(
        email: donarEmailController.text,
        password: donarPasswordController.text,
        phone: donarPhoneController.text,
        context: context,
        name: donarNameController.text);
    clearSignUpFields();
    BotToast.closeAllLoading();
  }
}
