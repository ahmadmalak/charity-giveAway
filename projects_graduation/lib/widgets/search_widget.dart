import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import '../constant/constants.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double height;
  final double verticalPadding;
  final double horizontalPadding;
  final Color hintColor;
  final double hintSize;
  final Function onChanged;

  const SearchField({
    this.hintSize = 15,
    this.hintColor = Colors.black,
    required this.hintText,
    required this.controller,
    required this.height,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 12.w,
        vertical: verticalPadding ?? 12.h,
      ),
      decoration: BoxDecoration(
        color: secondColor,
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(minWidth: 0.w),
          prefixIconConstraints: BoxConstraints(minWidth: 9.w),
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 12.0.h),
            child: SvgPicture.asset(
              AppAssets.searchIcon,
              color: kGrayColor01,
            ),
          ),
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(
            fontSize: hintSize,
            color: hintColor,
            fontFamily: "Poppins-Regular",
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorStyle: const TextStyle(height: 0.5),
        ),
      ),
    );
  }
}
