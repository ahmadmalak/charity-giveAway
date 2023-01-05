import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/constant/constants.dart';
import 'package:projects_graduation/pages/donor/home/controlles/home_Controller.dart';

import 'donated_card.dart';

class DonatedItemsScreen extends StatefulWidget {
  const DonatedItemsScreen({Key? key}) : super(key: key);

  @override
  State<DonatedItemsScreen> createState() => _DonatedItemsScreenState();
}

class _DonatedItemsScreenState extends State<DonatedItemsScreen> {
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
        body: StreamBuilder(
            stream: controller.service.fetchDonatedItems(),
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
                      padding: EdgeInsets.only(bottom: 100),
                      shrinkWrap: true,
                      itemCount: itemInfo.length,
                      itemBuilder: (_, index) {
                        return ItemCard(
                          itemInfo: itemInfo[index],
                        );
                      });
                }
              }
            }));
  }
}
