
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/Dailog_message.dart';
import 'auth_repo.dart';

class AuthRepoImpl  extends AuthRepo{
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
  Future signUpInformation(String name, String email, String phoneNumber, passWord, address) {
    // TODO: implement signUpInformation
    throw UnimplementedError();
  }
 

}