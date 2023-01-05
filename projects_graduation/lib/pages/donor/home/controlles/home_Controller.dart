import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/firebase/home_service.dart';

import '../../../../constant/constants.dart';
import '../../../../widgets/toastmessag.dart';

class HomeController extends GetxController {
  HomeService service = HomeService();
  RxString locationName = ''.obs;
  RxString selected = ''.obs;
  RxString pickedImage = ''.obs;
  var imageFile = Rxn<File>();
  TextEditingController postDescriptionController = TextEditingController();
  TextEditingController postNameController = TextEditingController();
  List<String> categoryList = ['education', 'health', 'orphans'];

  void clearPostFields() {
    postDescriptionController.clear();
    postNameController.clear();
    pickedImage.value = '';
    locationName.value = '';
    imageFile.value = null;
  }

  Future<void> postItem({
    required BuildContext context,
  }) async {
    var id = uuid.v4();
    BotToast.showLoading();
    String imageLink = await uploadFile(imageFile.value!, id);
    await service
        .postItem(
      id: id,
      name: postNameController.text,
      context: context,
      image: imageLink,
      address: locationName.value,
      description: postDescriptionController.text,
    )
        .whenComplete(() {
      BotToast.closeAllLoading();
      showToast(message: 'posted Successfully', context: context);
      Get.back();
      clearPostFields();
    });
  }

  Future<String> uploadFile(File image, String postId) async {
    var filename = uuid.v4();
    var storageReference = FirebaseStorage.instance.ref('posts').child(postId).child(filename);
    var storageUploadTask = storageReference.putFile(File(image.path));
    var storageTaskSnapshot = await storageUploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
