import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/firebase/auth_service.dart';
import 'package:projects_graduation/route/routes.dart';

import '../../../../../constant/constants.dart';
import '../../../../../route/router_constans.dart';
import '../../../../../widgets/toastmessag.dart';

class ProfileController extends GetxController {
// RxString donarName = ''.obs;

  AuthService authService = AuthService();
  TextEditingController donarNameController = TextEditingController();
  TextEditingController donarPhoneController = TextEditingController();
  TextEditingController donarPasswordController = TextEditingController();
  TextEditingController donarEmailController = TextEditingController();
  RxString locationName = ''.obs;
  RxString pickedImage = ''.obs;
  var imageFile = Rxn<File>();
  clearSignUpFields() {
    donarEmailController.clear();
    donarPasswordController.clear();
    donarPhoneController.clear();
    donarNameController.clear();
  }

  clearSignInFields() {
    donarEmailController.clear();
    donarPasswordController.clear();
  }

  Future<void> fetch() async {
    DocumentSnapshot snapshot = await authService.fetchUserInfo();
    if (snapshot.exists) {
      print('ture');
      donarNameController.text = snapshot['name'];
      donarPhoneController.text = snapshot['phoneNumber'];
      donarEmailController.text = snapshot['email'];
      pickedImage.value = snapshot['imageProfile'];
    }
  }

  Future<void> updateUserInfo(BuildContext context, String address) async {
    box.read('userId');
    var imageUrl = '';
    BotToast.showLoading();
    if (imageFile.value != null) {
      imageUrl = await uploadFile(imageFile.value!, box.read('userId'));
    }
    await authService
        .updateDonorInfo(
      name: donarNameController.text,
      phoneNumber: donarPhoneController.text,
      address: address,
      imageProfile: imageUrl,
    )
        .then((value) {
      BotToast.closeAllLoading();
      showToast(
        message: 'edit successfully',
        context: context,
      );
    });
  }

  Future<String> uploadFile(File image, String userId) async {
    var filename = uuid.v4();
    var storageReference = FirebaseStorage.instance.ref('donorProfile').child(userId).child(filename);
    var storageUploadTask = storageReference.putFile(File(image.path));
    var storageTaskSnapshot = await storageUploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> logout(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    box.write("isLogged", false);
    box.write('userId', '');
    pushNamedAndClearStack(context, introScreenRoute);
  }
}
