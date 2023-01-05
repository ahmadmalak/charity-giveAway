import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constants.dart';
import '../home/controlles/home_Controller.dart';
import 'notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Donated Items'),
      ),
      backgroundColor: mainColor,
      body: Column(
        children: [
          StreamBuilder(
            stream: controller.service.fetchNotification(),
            builder: (_, AsyncSnapshot snapshots) {
              if (!snapshots.hasData || snapshots.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                );
              } else {
                List<DocumentSnapshot> itemInfo = snapshots.data.docs;
                if (itemInfo.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'there is no Notification  yet',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: itemInfo.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: NotificationCard(
                          notificationInfo: itemInfo[index],
                        ),
                      );
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
