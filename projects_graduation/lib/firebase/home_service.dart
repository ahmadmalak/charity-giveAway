import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../constant/constants.dart';
import '../widgets/toastmessag.dart';

class HomeService {
  var database = FirebaseFirestore.instance;

  //fetch donated items
  Stream<QuerySnapshot> fetchDonatedItems() {
    return database.collection('posts').where('userId', isEqualTo: box.read('userId')).snapshots();
  } //fetch list of charities

  Stream<QuerySnapshot> fetchCharities() {
    return database.collection('charities').snapshots();
  }

  Future<DocumentSnapshot> fetchCharity(String charityId) {
    return database.collection('charities').doc(charityId).get();
  }

  Stream<QuerySnapshot> fetchNotification() {
    var userId = box.read('userId');
    return database.collection('notifications').where('donorId', isEqualTo: userId).snapshots();
  }

//post donation item
  Future<void> postItem({
    required BuildContext context,
    required String image,
    required String id,
    required String address,
    required String description,
    required String name,
  }) async {
    var userId = box.read('userId');
    try {
      await database.collection('posts').doc(id).set({
        'postImage': image,
        'id': id,
        'description': description,
        'name': name,
        'address': address,
        'userId': userId,
        "charityCollectedId": '',
        "collected": false,
      });
    } catch (error) {
      showToast(message: error, context: context);
    }
  }

  Future<String> uploadFile(File image, String postId) async {
    var filename = uuid.v4();
    var storageReference = FirebaseStorage.instance.ref('posts').child(postId).child(filename);
    var storageUploadTask = storageReference.putFile(File(image.path));
    var storageTaskSnapshot = await storageUploadTask;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
