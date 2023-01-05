import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/constants.dart';
import '../controlles/home_Controller.dart';

class DonationCategory extends StatefulWidget {
  const DonationCategory({Key? key}) : super(key: key);

  @override
  State<DonationCategory> createState() => _DonationCategoryState();
}

class _DonationCategoryState extends State<DonationCategory> {
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [for (int i = 0; i < controller.categoryList.length; i++) category(controller.categoryList[i])],
    );
  }

  Widget category(String text) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.selected.value = text;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 90,
            decoration: BoxDecoration(
              color: controller.selected.value == text ? Colors.green : secondColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
