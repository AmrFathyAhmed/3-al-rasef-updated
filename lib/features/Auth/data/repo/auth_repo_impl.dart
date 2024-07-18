import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<UserCredential> logIn(String email, password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    return userCredential;
  }

  @override
  Future<UserCredential> signUp(
      String name, String email, String phoneNumber, password, address) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

    if (userCredential != null) {


      await FirebaseFirestore.instance
          .collection("Users")
          .doc("${email}")
          .set({
        "UserName": "$name",
        "UserEmail": "$email",
        "UserPassword": "$password",
        "UserPhone": "$phoneNumber",
        "UserAddress": "$address",
      });
  }
    return userCredential;
}}
