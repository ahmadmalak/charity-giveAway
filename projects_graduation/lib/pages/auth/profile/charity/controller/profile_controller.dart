import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projects_graduation/firebase/auth_service.dart';
import 'package:projects_graduation/route/routes.dart';

import '../../../../../constant/constants.dart';
import '../../../../../route/router_constans.dart';
import '../../../../../widgets/toastmessag.dart';

class CharityProfileController extends GetxController {
// RxString donarName = ''.obs;

  AuthService authService = AuthService();
  TextEditingController charityNameController = TextEditingController();
  TextEditingController charityPhoneController = TextEditingController();
  TextEditingController charityPasswordController = TextEditingController();
  TextEditingController charityEmailController = TextEditingController();
  RxString pickedImage = ''.obs;
  var imageFile = Rxn<File>();
  clearSignUpFields() {
    charityEmailController.clear();
    charityPasswordController.clear();
    charityPhoneController.clear();
    charityNameController.clear();
  }

  clearSignInFields() {
    charityEmailController.clear();
    charityPasswordController.clear();
  }

  Future<void> updateCharityInfo(BuildContext context, String address) async {
    var imageUrl = '';
    BotToast.showLoading();
    if (imageFile.value != null) {
      imageUrl = await uploadFile(imageFile.value!, box.read('charityId'));
    }
    await authService
        .updateCharityInfo(
      imageProfile: imageUrl,
      name: charityNameController.text,
      phoneNumber: charityPhoneController.text,
      address: address,
    )
        .then((value) {
      BotToast.closeAllLoading();
      showToast(
        message: 'edit successfully',
        context: context,
      );
    });
  }

  Future<void> fetchCharityInfo() async {
    DocumentSnapshot snapshot = await authService.fetchCharityInfo();
    if (snapshot.exists) {
      charityNameController.text = snapshot['name'];
      charityPhoneController.text = snapshot['phoneNumber'];
      charityEmailController.text = snapshot['email'];
      pickedImage.value = snapshot['imageProfile'];
    }
  }

  Future<void> logout(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    box.write('charityEmail', '');
    box.write('charityId', '');
    box.write('isCharityLogged', true);
    pushNamedAndClearStack(context, introScreenRoute);
  }

  Future<String> uploadFile(File image, String userId) async {
    var filename = uuid.v4();
    var storageReference = FirebaseStorage.instance.ref('charity').child(userId).child(filename);
    var storageUploadTask = storageReference.putFile(File(image.path));
    var storageTaskSnapshot = await storageUploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
