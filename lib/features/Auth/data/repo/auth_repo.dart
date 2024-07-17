import 'package:flutter/cupertino.dart';

abstract class AuthRepo{
  Future logInWithGoogle();
  Future logInWithFacebook();
  Future signUpInformation(@required String name ,@required String email,@required String phoneNumber,@required passWord,@required address);
}