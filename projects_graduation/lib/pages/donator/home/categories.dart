import 'package:flutter/material.dart';

import '../../../models/Categories.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  final List<Campaign> campaign;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          campaign.length,
          (index) => CategoryCard(
            campaign: campaign[index],
          ),
        ),
      ),
    );
  }
}
