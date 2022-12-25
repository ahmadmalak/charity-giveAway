import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects_graduation/constant/app_assets.dart';

class ImageProfile extends StatelessWidget {
  final String imageProfile;
  final double height;
  final double width;
  const ImageProfile({Key? key, this.imageProfile = '', this.height = 50, this.width = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: imageProfile.isNotEmpty ? Image.network(imageProfile) : Image.asset(AppAssets.imageProfile),
    );
  }
}
