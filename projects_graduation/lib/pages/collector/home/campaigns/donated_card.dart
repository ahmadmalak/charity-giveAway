import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/widgets/button_app.dart';

import '../../../../constant/constants.dart';
import '../../../../size_config.dart';
import '../../../../widgets/image_profile.dart';
import '../controller/charity_home_controller.dart';
import 'details_campain/details_screen.dart';

class DonatedCard extends StatefulWidget {
  final DocumentSnapshot itemInfo;
  const DonatedCard({Key? key, required this.itemInfo
      // It means we have  to add category
      //  required this.campaign,
      })
      : super(key: key);

  @override
  State<DonatedCard> createState() => _DonatedCardState();
}

class _DonatedCardState extends State<DonatedCard> {
  final controller = Get.put(CharityHomeController());
  //final Campaign campaign;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        if (box.read('charityId') == widget.itemInfo['charityCollectedId']) {
          showItemDetails();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(defaultSize * 2), //20
        child: SizedBox(
          width: defaultSize * 20.5, //205
          child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff303030),
                  ),
                  padding: EdgeInsets.all(defaultSize * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 170,
                        child: Text(
                          widget.itemInfo['name'] ?? '',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: Text(
                          widget.itemInfo['description'] ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder(
                            stream: controller.homeService.fetchItemById(widget.itemInfo['id']),
                            builder: (_, AsyncSnapshot snapshots) {
                              if (!snapshots.hasData || snapshots.connectionState == ConnectionState.waiting) {
                                return ButtonApp(
                                  width: 270.w,
                                  height: 40.h,
                                  text: 'collect',
                                  buttonColor: kPrimaryColor,
                                  onPressed: () {},
                                );
                              } else {
                                List<DocumentSnapshot> itemInfo = snapshots.data.docs;
                                if (itemInfo.isEmpty) {
                                  return ButtonApp(
                                    width: 270.w,
                                    height: 40.h,
                                    text: 'collect',
                                    buttonColor: kPrimaryColor,
                                    onPressed: () {},
                                  );
                                } else {
                                  if (itemInfo.first['collected'] == false) {
                                    return ButtonApp(
                                      width: 270.w,
                                      height: 40.h,
                                      text: 'collect',
                                      buttonColor: kPrimaryColor,
                                      onPressed: () {
                                        controller.collectItem(
                                            postId: widget.itemInfo['id'],
                                            context: context,
                                            charityMobileNumber: box.read('charityMobileNumber'),
                                            donorId: widget.itemInfo['userId']);
                                      },
                                    );
                                  } else {
                                    return ButtonApp(
                                      width: 270.w,
                                      height: 40.h,
                                      text: 'collected',
                                      buttonColor: kGrayColor02,
                                      onPressed: () {
                                        if (box.read('charityId') == widget.itemInfo['charityCollectedId']) {
                                          showAlertDialog(context);
                                        }
                                      },
                                    );
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  right: 5,
                  child: AspectRatio(
                    aspectRatio: 1.80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        widget.itemInfo['postImage'],
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: ImageProfile(
                    height: 40.h,
                    width: 40.w,
                    imageProfile: '',
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.itemInfo['collected'] == false ? const Color(0xff404040) : kPrimaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Details",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showItemDetails() {
    if (widget.itemInfo['collected'] == true) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          isScrollControlled: true,
          context: context,
          builder: (BuildContext bc) {
            return DetailsCampaign(
              userId: widget.itemInfo['userId'],
              image: widget.itemInfo['postImage'],
              id: widget.itemInfo['id'],
              address: widget.itemInfo['address'],
              postName: widget.itemInfo['name'],
              description: widget.itemInfo['description'],
            );
          });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        controller.discardCollectItem(widget.itemInfo['id'], context);
        Get.back();
      },
    );

    // set up the AlertDialog

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text("collect item"),
            content: Text("Are you sure you want to un collect this item"),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        } else {
          return AlertDialog(
            title: Text("collect item"),
            content: Text("Are you sure you want to un collect this item"),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        }
      },
    );
  }
}
