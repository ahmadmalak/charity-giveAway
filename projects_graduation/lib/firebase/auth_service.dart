import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../widgets/toastmessag.dart';

class AuthService {
  var database = FirebaseFirestore.instance;
  var firebaseAuth = FirebaseAuth.instance;
  Future<void> onCreateDonarAccount(
      {required String email,
      required String phone,
      required String password,
      required String name,
      required BuildContext context}) async {
    final uuid = const Uuid().v4();
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        addUserToFireStore(context: context, id: uuid, name: name, email: email, phoneNumber: phone, latLng: '');
      });
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

  Future<String> signInWithEmailAndPassword(
      {required String email, required String password, required BuildContext context}) async {
    print(password);
    final uuid = const Uuid().v4();
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        return user.user!.uid.toString();
      } else {
        return '';
      }

      // addUserToFireStore(context: context, id: user.user?.uid);

    } catch (error) {
      if (error.toString().contains('[firebase_auth/wrong-password]')) {
        showToast(message: 'invalid password', context: context);
      } else if (error.toString().contains('[firebase_auth/user-not-found]')) {
        showToast(message: 'invalid email', context: context);
      } else {
        showToast(message: 'oops something went wrong ', context: context);
      }
      debugPrint('Error: $error');
      return '';
    }
  }

  Future<void> addUserToFireStore({
    String? id,
    required String name,
    required String email,
    required String latLng,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    final uuid = const Uuid().v4();
    final db = FirebaseFirestore.instance;
    db.collection('users').doc(id ?? uuid).set({
      'id': id ?? uuid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageProfile': '',
      'address': latLng
    }).then((value) async {
      debugPrint('success addUserToFireStore');
      // setProfileGlobalVariablesByValues(
      //   firstName: firstName,
      //   lastName: lastName,
      //   email: email,
      //   phoneNumber: phoneNumber,
      //   id: id ?? uuid,
      // );
      // // SharedPreferences prefs = await SharedPreferences.getInstance();
      //  prefs.setString('email', email);
      //  prefs.setString('password', password);
      //  prefs.setString('mobileDraft', json.encode({}));
      //  prefs.setString('webDraft', json.encode({}));
      //  prefs.setString('supportDraft', json.encode({}));
      //  prefs.setString('imageProfile', '');
      //  prefs.setBool('isLoggedIn', true);
      //  pushNamedAndClearStack(context, customerRoute);
    }).catchError((error) {
      debugPrint('Error adding profile to db $error');
    });
  }
}
