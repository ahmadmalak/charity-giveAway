import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projects_graduation/firebase/auth_service.dart';

import '../../../../../constant/constants.dart';

class CharitySignUpController extends GetxController {
// RxString donarName = ''.obs;
  AuthService authService = AuthService();
  RxString locationName = ''.obs;
  TextEditingController charityNameController = TextEditingController();
  TextEditingController charityPhoneController = TextEditingController();
  TextEditingController charityPasswordController = TextEditingController();
  TextEditingController charityEmailController = TextEditingController();
  var imageFile = Rxn<File>();
  clearSignUpFields() {
    charityEmailController.clear();
    charityPasswordController.clear();
    charityPhoneController.clear();
    charityNameController.clear();
    locationName.value = '';
    imageFile.value = null;
  }

  Future<void> onClickSignUp(BuildContext context) async {
    var filename = uuid.v4();
    BotToast.showLoading();
    var firebaseDatabase = FirebaseFirestore.instance;
    await authService
        .onCreateCharityAccount(
            email: charityEmailController.text,
            password: charityPasswordController.text,
            phone: charityPhoneController.text,
            context: context,
            name: charityNameController.text,
            document: '',
            address: locationName.value)
        .then((value) async {
      var documentUrl = await uploadFile(imageFile.value!, filename);
      firebaseDatabase.collection('charities').doc(value?.user?.uid).update({'document': documentUrl});
    });
    clearSignUpFields();
    BotToast.closeAllLoading();
  }

  Future<String> uploadFile(File image, String postId) async {
    var filename = uuid.v4();
    var storageReference = FirebaseStorage.instance.ref('documents').child(postId).child(filename);
    var storageUploadTask = storageReference.putFile(File(image.path));
    var storageTaskSnapshot = await storageUploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
