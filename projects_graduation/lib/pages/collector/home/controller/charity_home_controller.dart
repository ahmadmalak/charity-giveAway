import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projects_graduation/firebase/charity_home_service.dart';

class CharityHomeController extends GetxController {
  CharityHomeService homeService = CharityHomeService();

  Future<void> collectItem({
    required String charityMobileNumber,
    required String donorId,
    required String postId,
    required BuildContext context,
  }) async {
    await homeService.collectItem(
      postId: postId,
      context: context,
      charityMobileNumber: charityMobileNumber,
      donorId: donorId,
    );
  }

  Future<void> discardCollectItem(String postId, BuildContext context) async {
    await homeService.discardCollectItem(postId, context);
  }
}
