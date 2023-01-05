import 'package:flutter/material.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import 'campaign_card.dart';

class CampaignsList extends StatelessWidget {
  CampaignsList({
    Key? key,
  }) : super(key: key);
  List<Widget> campaigns = [
    CampaignCard(
      title: 'food',
      image: AppAssets.donationImg,
      progress: 5.3,
      price: 500,
    ),
    CampaignCard(
      title: 'schools',
      image: AppAssets.donation2Img,
      progress: 3.7,
      price: 1200,
    ),
    CampaignCard(
      title: 'orphans',
      image: AppAssets.charityImg,
      progress: 8.4,
      price: 10000,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) => campaigns[index]),
      ),
    );
  }
}
