import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects_graduation/constant/constants.dart';
import 'package:projects_graduation/pages/donor/home/controlles/home_Controller.dart';

import '../../../widgets/button_app.dart';
import '../../../widgets/description_field.dart';
import '../home/location/location.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final picker = ImagePicker();
  var controller = Get.put(HomeController());
  Future getImage({required ImageSource imageSource}) async {
    final image = await picker.pickImage(source: imageSource);
    if (image != null) {
      controller.imageFile.value = File(image!.path);
    }
  }

  @override
  void dispose() {
    controller.clearPostFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1B1B),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('Post Item'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(children: [
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(color: Color(0xFFE1E9E6), borderRadius: BorderRadius.circular(30.r)),
                      width: 250.w,
                      height: 180.h,
                      child: controller.imageFile.value == null
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Image.file(
                                controller.imageFile.value!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                      top: 80.h,
                      right: 70.w,
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF4DD4B6),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                topLeft: Radius.circular(15.r),
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              )),
                          child: IconButton(
                            icon: const Icon(Icons.photo),
                            onPressed: () {
                              getImage(imageSource: ImageSource.gallery);
                            },
                          ))),
                  Positioned(
                    top: 80.h,
                    left: 70.w,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF4DD4B6),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          )),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          getImage(imageSource: ImageSource.camera);
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Address Detail",
                      style: TextStyle(fontSize: 13.r, color: Colors.white),
                    ),
                  ],
                ),
              ),
              LocationPicker(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Post Name",
                      style: TextStyle(fontSize: 13.r, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextFieldDescription(
                  fieldColor: Colors.white,
                  textColor: Colors.black,
                  verticalPadding: 10.h,
                  onChanged: (value) {
                    if (value!.isNotEmpty) {
                      return 'please enter post name';
                    } else {
                      return null;
                    }
                  },
                  horizontalPadding: 0.w,
                  onValidator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'please enter post name';
                    }
                  },
                  textInputType: TextInputType.text,
                  hintText: 'Type your name here',
                  controller: controller.postNameController,
                  height: 20.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(fontSize: 13.r, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: TextFieldDescription(
                  fieldColor: Colors.white,
                  textColor: Colors.black,
                  verticalPadding: 10.h,
                  onChanged: (value) {
                    if (value!.isNotEmpty) {
                      return 'please enter description';
                    } else {
                      return null;
                    }
                  },
                  horizontalPadding: 0.w,
                  onValidator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'please enter description';
                    }
                  },
                  textInputType: TextInputType.text,
                  hintText: 'Type your description here',
                  controller: controller.postDescriptionController,
                  height: 20.h,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ButtonApp(
                text: "Post",
                buttonColor: kPrimaryColor,
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      controller.imageFile.value != null &&
                      controller.locationName.isNotEmpty) {
                    await controller.postItem(context: context);
                  } else {
                    print('error');
                  }
                },
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
