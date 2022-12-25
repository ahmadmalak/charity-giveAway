import 'package:flutter/material.dart';

import '../../../constant/constants.dart';
import '../../../models/Campaign.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Campaigns product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: defaultSize * 14.5, //145
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: const Text('title1'),
              ),
              SizedBox(height: defaultSize / 2),
              const Text("title"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
