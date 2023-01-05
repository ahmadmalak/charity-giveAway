import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/controlles/home_Controller.dart';
import 'charity_card.dart';

class CharitiesList extends StatefulWidget {
  const CharitiesList({Key? key}) : super(key: key);

  @override
  State<CharitiesList> createState() => _CharitiesListState();
}

class _CharitiesListState extends State<CharitiesList> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.service.fetchCharities(),
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
                width: 400,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //  padding: const EdgeInsets.only(bottom: 400),
                    shrinkWrap: true,
                    itemCount: itemInfo.length,
                    itemBuilder: (_, index) {
                      return CharityCard(
                        charityInfo: itemInfo[index],
                      );
                    }),
              );
            }
          }
        });
  }
}
