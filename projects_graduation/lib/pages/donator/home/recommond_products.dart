import 'package:flutter/material.dart';

import '../../../models/Campaign.dart';
import '../../../size_config.dart';
import 'campaign_card.dart';

class RecommendProducts extends StatelessWidget {
  const RecommendProducts({
    Key? key,
    required this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Campaigns> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DetailsScreen(
              //         product: products[index],
              //       ),
              //     ));
            }),
      ),
    );
  }
}
