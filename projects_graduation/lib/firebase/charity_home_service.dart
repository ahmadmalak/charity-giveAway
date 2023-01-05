import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../constant/constants.dart';
import '../widgets/toastmessag.dart';

class CharityHomeService {
  var database = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchDonatedItems() {
    return database.collection('posts').snapshots();
  }

  Stream<QuerySnapshot> fetchItemById(String postId) {
    return database.collection('posts').where('id', isEqualTo: postId).snapshots();
  }

  Future<DocumentSnapshot> fetchUserInfo(String id) async {
    return await database.collection('users').doc(id).get();
  }

  Stream<QuerySnapshot> fetchCollectedItems() {
    var id = box.read('charityId');
    return database
        .collection('posts')
        .where('charityCollectedId', isEqualTo: id)
        .where('collected', isEqualTo: true)
        .snapshots();
  }

  Future<void> collectItem(
      {required String postId,
      required BuildContext context,
      required String charityMobileNumber,
      required String donorId}) async {
    var id = box.read('charityId');
    try {
      database.collection('posts').doc(postId).update(
        {
          "charityCollectedId": id,
          "collected": true,
        },
      ).then((value) async {
        await postNotifications(
          donorId: donorId,
          charityMobileNumber: charityMobileNumber,
          context: context,
          postId: postId,
        );
      });
    } catch (error) {
      showToast(message: error.toString(), context: context);
    }
  }

  Future<void> postNotifications(
      {required String charityMobileNumber,
      required String donorId,
      required String postId,
      required BuildContext context}) async {
    var id = box.read('charityId');
    var notificationId = uuid.v4();
    try {
      database.collection('notifications').doc(notificationId).set(
        {
          'id': notificationId,
          "charityCollectedId": id,
          'charityMobileNumber': charityMobileNumber,
          "donorId": donorId,
        },
      );
    } catch (error) {
      showToast(message: error.toString(), context: context);
    }
  }

  Future<void> discardCollectItem(String postId, BuildContext context) async {
    try {
      database.collection('posts').doc(postId).update(
        {
          "charityCollectedId": '',
          "collected": false,
        },
      );
    } catch (error) {
      showToast(message: error.toString(), context: context);
    }
  }
}
