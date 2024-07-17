
import 'package:al_rasef/features/Auth/presentation/views/sign_up/presentation/widget/sign_up_view_body.dart';
import 'package:flutter/material.dart';


class SignUpView extends StatelessWidget
{
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpViewBody(),
    );
  }
}
