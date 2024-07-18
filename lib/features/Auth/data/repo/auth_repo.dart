import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthRepo {
  Future<UserCredential> logIn(@required String email, @required password);

  Future<UserCredential> signUp(
      @required String name,
      @required String email,
      @required String phoneNumber,
      @required password,
      @required address);
}
