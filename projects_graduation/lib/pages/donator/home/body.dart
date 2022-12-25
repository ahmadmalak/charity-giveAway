import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects_graduation/pages/donator/home/recommond_products.dart';

import '../../../services/fetchProducts.dart';
import '../../../size_config.dart';
import '../../../widgets/search_widget.dart';
import 'donation_category.dart';

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
              ),
            ),
            // FutureBuilder(
            //   future: fetchCategories(),
            //   builder: (context, snapshot) =>
            //       snapshot.hasData ? Campaign(campaign: snapshot.data!) : Center(child: Container()),
            // ),
            const Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: const Text("Charities List"),
            ),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData ? RecommendProducts(products: snapshot.data!) : Center(child: Container());
              },
            ),
          ],
        ),
      ),
    );
  }
}
