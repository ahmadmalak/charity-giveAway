import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import '../controller/sign_up_controller.dart';

class UploadDocument extends StatelessWidget {
  UploadDocument({Key? key}) : super(key: key);

  final picker = ImagePicker();
  var controller = Get.put(CharitySignUpController());
  Future getImage({required ImageSource imageSource}) async {
    final image = await picker.pickImage(source: imageSource);
    if (image == null) return;
    controller.imageFile.value = File(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImage(imageSource: ImageSource.gallery);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Row(
                children: [
                  controller.imageFile.value == null
                      ? Image.asset(
                          AppAssets.uploadDocumentIcon,
                          height: 50,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(
                            controller.imageFile.value!,
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    controller.imageFile.value == null ? 'Upload Document' : 'Document Uploaded',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
