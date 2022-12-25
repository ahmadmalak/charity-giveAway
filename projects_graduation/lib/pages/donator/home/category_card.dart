import 'package:flutter/material.dart';
import 'package:projects_graduation/constant/app_assets.dart';

import '../../../constant/constants.dart';
import '../../../models/Categories.dart';
import '../../../size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    // It means we have  to add category
    required this.campaign,
  }) : super(key: key);

  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
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
                  color: kGrayColor02,
                ),
                width: defaultSize * 25,
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text('s'),
                    SizedBox(height: defaultSize),
                    Text(
                      "title",
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: AppAssets.charityImg,
                    image: campaign.image,
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

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
