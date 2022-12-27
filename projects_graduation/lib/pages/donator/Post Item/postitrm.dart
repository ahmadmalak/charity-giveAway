import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects_graduation/widgets/confirmbutton.dart';

import '../../../widgets/descriptionfield.dart';
import '../../../widgets/text_view_widget.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  File? _image;

  Future getImage({required ImageSource imageSource}) async {
    final image = await ImagePicker().pickImage(source: imageSource);

    if (image == null) return;

    File imageTemporary = File(image!.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            leadingWidth: 50,
            toolbarHeight: 60,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
                color: Colors.black,
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: regularTextLight(
                text: "Post Item",
                context: context,
                sizeText: 15,
                textColor: Colors.black),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Center(
                child: Positioned(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                          )),
                      width: 300.w,
                      height: 300.h,
                      child: Center(child: Text(""))),
                ),
              ),
              Positioned(
                top: 20.h,
                left: 55.w,
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFE1E9E6),
                          borderRadius: BorderRadius.circular(30.r)),
                      width: 250.w,
                      height: 250.h,
                      child: _image == null
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            )),
                ),
              ),
              Positioned(
                  top: 120.h,
                  left: 125.w,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF4DD4B6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.r),
                          topLeft: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        )),
                    child: _image != null
                        ? IconButton(
                            icon: Icon(Icons.photo),
                            onPressed: () {
                              getImage(imageSource: ImageSource.gallery);
                            },
                          )
                        : Container(),
                  )),
              Positioned(
                  top: 120.h,
                  right: 125.w,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF4DD4B6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.r),
                          topLeft: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        )),
                    child: _image != null
                        ? IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              getImage(imageSource: ImageSource.camera);
                            },
                          )
                        : Container(),
                  )),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Address Detail",
                    style: TextStyle(fontSize: 18.r),
                  ),
                ],
              ),
            ),
            Stack(children: [
              Center(
                child: Positioned(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r),
                          )),
                      width: 300.w,
                      height: 100.h,
                      child: Center(child: Text(""))),
                ),
              ),
              Positioned(
                  left: 45.w,
                  top: 20.h,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFE3EDE9),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.r),
                          topLeft: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        )),
                    child: IconButton(
                      icon: Icon(Icons.location_pin),
                      onPressed: () {},
                    ),
                  )),
              Positioned(
                left: 100.w,
                top: 20.h,
                child: Text("Summerland St"),
              ),
              Positioned(
                left: 100.w,
                top: 50.h,
                child: Text("801 Summerland Batesburg SC \n 381388-14ND USA"),
              ),
              Positioned(
                  right: 30.w,
                  top: 30.h,
                  child: Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xFFE1E9E6),
                      ),
                      onPressed: () {},
                    ),
                  )),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 13.r, color: Color(0xFF767675)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TextFieldDescription(
                fieldColor: Color(0xFFAFAFAF),
                textColor: Colors.white,
                verticalPadding: 10.h,
                onChanged: (value) {},
                horizontalPadding: 0.w,
                onValidator: (value) {},
                textInputType: TextInputType.text,
                hintText: 'Type Your Description Here',
                controller:
                    TextEditingController(text: "Type Your Description Here"),
                height: 20.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ConfirmButton(
              text: "Confirmation",
              onPressed: () {},
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
