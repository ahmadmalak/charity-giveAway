import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/campaigns/donated_card.dart';
import '../home/controller/charity_home_controller.dart';

class CollectedItemsScreen extends StatefulWidget {
  const CollectedItemsScreen({Key? key}) : super(key: key);

  @override
  State<CollectedItemsScreen> createState() => _CollectedItemsScreenState();
}

class _CollectedItemsScreenState extends State<CollectedItemsScreen> {
  var controller = Get.put(CharityHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1B1B),
        elevation: 0,
        centerTitle: true,
        title: const Text('Collected Items'),
      ),
      backgroundColor: const Color(0xff333333),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: controller.homeService.fetchCollectedItems(),
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
                              'there is no donated item yet',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 200),
                      itemCount: itemInfo.length,
                      itemBuilder: (_, index) {
                        return DonatedCard(
                          itemInfo: itemInfo[index],
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
