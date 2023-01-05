import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:projects_graduation/constant/constants.dart';
import 'package:uuid/uuid.dart';

import '../widgets/toastmessag.dart';

class AuthService {
  var database = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance;

  Future<DocumentSnapshot> fetchUserInfo() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    return await database.collection('users').doc(id).get();
  }

  Future<DocumentSnapshot> fetchCharityInfo() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    return await database.collection('charities').doc(id).get();
  }

  Future<void> onCreateDonarAccount(
      {required String email,
      required String phone,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        database.collection('users').doc(userCredential.user?.uid).set({
          'id': userCredential.user?.uid,
          'name': name,
          'email': userCredential.user?.email,
          'phoneNumber': phone,
          'imageProfile': '',
          'address': '',
        }).then((value) async {
          debugPrint('success addUserToFireStore');
        }).catchError((error) {
          debugPrint('Error adding profile to db $error');
        });
        box.write('userEmail', userCredential.user!.email);
        box.write('userId', userCredential.user!.uid.toString());
      }
    } catch (error) {
      if (error.toString().contains('[firebase_auth/wrong-password]')) {
        showToast(message: 'invalid password', context: context);
      } else if (error.toString().contains('[firebase_auth/user-not-found]')) {
        showToast(message: 'invalid email', context: context);
      } else {
        showToast(message: 'oops something went wrong ', context: context);
      }
      debugPrint('Error: $error');
    }
  }

  Future<UserCredential?> onCreateCharityAccount(
      {required String email,
      required String phone,
      required String password,
      required String name,
      required String document,
      required String address,
      required BuildContext context}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        database.collection('charities').doc(userCredential.user?.uid).set({
          'id': userCredential.user?.uid,
          'name': name,
          'email': userCredential.user?.email,
          'document': document,
          'phoneNumber': phone,
          'imageProfile': '',
          'address': address,
        }).then((value) async {
          database.collection('charities').doc(userCredential.user?.uid).update({});
          debugPrint('success addUserToFireStore');
        }).catchError((error) {
          debugPrint('Error adding profile to db $error');
        });
        box.write('charityEmail', userCredential.user!.email);
        box.write('charityMobileNumber', userCredential.user!.email);
        box.write('charityAddress', address);
        box.write('charityId', userCredential.user!.uid.toString());
      }
      return userCredential;
    } catch (error) {
      if (error.toString().contains('[firebase_auth/wrong-password]')) {
        showToast(message: 'invalid password', context: context);
      } else if (error.toString().contains('[firebase_auth/user-not-found]')) {
        showToast(message: 'invalid email', context: context);
      } else {
        showToast(message: 'oops something went wrong ', context: context);
      }
      debugPrint('Error: $error');
      return null;
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password, required BuildContext context}) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (error) {
      if (error.toString().contains('[firebase_auth/wrong-password]')) {
        showToast(message: 'invalid password', context: context);
      } else if (error.toString().contains('[firebase_auth/user-not-found]')) {
        showToast(message: 'invalid email', context: context);
      } else {
        showToast(message: 'oops something went wrong ', context: context);
      }
      debugPrint('Error: $error');
      return null;
    }
  }

  Future<void> updateDonorInfo(
      {required String name,
      required String phoneNumber,
      required String address,
      required String imageProfile}) async {
    var userId = box.read('userId');

    await database.collection('users').doc(userId).update({
      'address': address,
      'name': name,
      'phoneNumber': phoneNumber,
      'imageProfile': imageProfile,
    });
  }

  Future<void> updateCharityInfo(
      {required String name,
      required String phoneNumber,
      required String address,
      required String imageProfile}) async {
    var userId = box.read('charityId');

    await database.collection('charities').doc(userId).update({
      'address': address,
      'name': name,
      'phoneNumber': phoneNumber,
      'imageProfile': imageProfile,
    });
  }

  Future<void> addUserToFireStore({
    required String id,
    required String name,
    required String email,
    required String latLng,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    final uuid = const Uuid().v4();
    final db = FirebaseFirestore.instance;
    box.write('userId', id);
    db.collection('users').doc(id ?? uuid).set({
      'id': id ?? uuid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageProfile': '',
      'address': latLng
    });
  }
}
