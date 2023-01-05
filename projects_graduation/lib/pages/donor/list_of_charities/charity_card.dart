import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_graduation/constant/app_assets.dart';
import 'package:projects_graduation/constant/constants.dart';

import '../../../size_config.dart';

class CharityCard extends StatelessWidget {
  final DocumentSnapshot charityInfo;
  const CharityCard({
    Key? key,
    required this.charityInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 1), //20
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
                  color: const Color(0xff404040),
                ),
                width: defaultSize * 25,
                padding: EdgeInsets.all(defaultSize * 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      charityInfo['name'],
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "mobile:",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          charityInfo['phoneNumber'],
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.80,
                  child: charityInfo['imageProfile'].isEmpty
                      ? Image.asset(
                          AppAssets.charityImg,
                          height: 120,
                        )
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            charityInfo['imageProfile'],
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
