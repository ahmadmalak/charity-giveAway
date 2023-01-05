import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

import '../controlles/home_Controller.dart';

class LocationPicker extends StatelessWidget {
  LocationPicker({Key? key}) : super(key: key);
  var controller = Get.put(HomeController());
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlacePicker(
              apiKey: Platform.isAndroid
                  ? "AIzaSyAeJUAKtyMzOK1Tv8tFHNqZb1IVl5znugI"
                  : "AIzaSyCGFiOjcCnLJKHDcgpoAh99rPZrYrBQQXM",
              onPlacePicked: (result) {
                Get.back();
                controller.locationName.value = result.formattedAddress!;
              },
              initialPosition: kInitialPosition,
              useCurrentLocation: true,
              resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 170,
                  child: Obx(
                    () => Text(
                      controller.locationName.value.isEmpty ? 'place location' : controller.locationName.value,
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
}
