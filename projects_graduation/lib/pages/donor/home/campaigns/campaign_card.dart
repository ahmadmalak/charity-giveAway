import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import '../../../../constant/constants.dart';
import '../../../../size_config.dart';
import '../checkout/checkout.dart';

class CampaignCard extends StatefulWidget {
  final String image;
  final String title;
  final double progress;
  final int price;
  const CampaignCard({
    Key? key,
    required this.image,
    required this.title,
    required this.progress,
    required this.price,
    // It means we have  to add category
    //  required this.campaign,
  }) : super(key: key);

  @override
  State<CampaignCard> createState() => _CampaignCardState();
}

class _CampaignCardState extends State<CampaignCard> {
  //final Campaign campaign;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        Get.to(CheckoutScreen(
          title: widget.title,
          price: widget.price,
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(defaultSize * 2), //20
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
                  padding: EdgeInsets.all(defaultSize * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 34.h,
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  for (int i = 0; i < 4; ++i)
                                    Positioned(
                                      left: 8.w * i,
                                      child: SizedBox(
                                          width: 18.h,
                                          child: (i == 4)
                                              ? Container(
                                                  height: 34.h,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(0xff767676).withOpacity(.13),
                                                      width: 3.w,
                                                    ),
                                                  ),
                                                  child: const Text('3'),
                                                )
                                              : CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  child: Image.asset(
                                                    AppAssets.personImg,
                                                  ),
                                                )),
                                    )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'people donated',
                            style: TextStyle(fontSize: 12.sp, color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 200,
                        height: 5.h,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: widget.progress,
                            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Target:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${widget.price} Jd",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  right: 5,
                  child: AspectRatio(
                    aspectRatio: 1.80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        widget.image,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
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
