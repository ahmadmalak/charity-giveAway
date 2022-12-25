import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {}

// RxString donarName = ''.obs;
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
