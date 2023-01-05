import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/pages/collector/home/controller/charity_home_controller.dart';

import 'donated_card.dart';

class DonatedList extends StatefulWidget {
  DonatedList({
    Key? key,
  }) : super(key: key);

  @override
  State<DonatedList> createState() => _DonatedListState();
}

class _DonatedListState extends State<DonatedList> {
  final controller = Get.put(CharityHomeController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.homeService.fetchDonatedItems(),
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
              return SizedBox(
                height: Get.height,
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 400),
                    shrinkWrap: true,
                    itemCount: itemInfo.length,
                    itemBuilder: (_, index) {
                      return DonatedCard(
                        itemInfo: itemInfo[index],
                      );
                    }),
              );
            }
          }
        });
  }

  void _filterModalBottomSheet(context) {}
}
