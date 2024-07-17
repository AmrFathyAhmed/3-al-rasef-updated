
import 'package:al_rasef/features/Auth/presentation/views/login/presentation/widget/login_view_body.dart';
import 'package:flutter/material.dart';


class LoginView extends StatelessWidget
{
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
