import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_graduation/constant/constants.dart';

import '../../../size_config.dart';
import '../../../widgets/search_widget.dart';
import '../list_of_charities/charites_list.dart';
import 'campaigns/campaign_list.dart';
import 'category/donation_category.dart';

class Body extends StatelessWidget {
  final TextEditingController _searchName = TextEditingController();

  Body({super.key});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: SearchField(
                controller: _searchName,
                hintText: 'product',
                hintColor: Colors.grey,
                height: 40,
                horizontalPadding: 12,
                verticalPadding: 12,
                onChanged: () {},
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const DonationCategory(),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: const Text(
                "Donation  Items",
                style: TextStyle(color: kPrimaryColor, fontSize: 20),
              ),
            ),
            CampaignsList(),
            const Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: const Text(
                "Charities List",
                style: TextStyle(color: kPrimaryColor, fontSize: 20),
              ),
            ),
            const CharitiesList(
                //  campaign: null,
                )
          ],
        ),
      ),
    );
  }
}
