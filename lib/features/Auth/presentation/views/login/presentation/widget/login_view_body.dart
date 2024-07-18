import 'package:al_rasef/features/Auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:al_rasef/features/Auth/presentation/manger/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../../../constent.dart';
import '../../../../../../../core/widget/Dailog_message.dart';
import '../../../../../../../core/widget/custom_button.dart';
import '../../../../../../../core/widget/custom_size_box.dart';
import '../../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../../generated/assets.dart';
import '../../../sign_up/sign_up_view.dart';

class LoginViewBody extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isObscureText = true;

  String? email, password;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool? isLoading;

  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, 'HomeView');
        } else if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginFailure) {
          showDialog(
              context: context,
              builder: (context) => DialogMassage(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    message: state.errorMessage,
                    imageTitle: Assets.imagesCancel,
                  ));
        }
      },
      child: Center(
        child: ListView(
          children: [
            const HorizintalSizeBox(num: 8),
            Center(
              child: Material(
                elevation: 30,
                shadowColor: kPrimaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const HorizintalSizeBox(num: 1),
            const Center(
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 46,
                    fontFamily: 'Cairo'),
              ),
            ),
            const HorizintalSizeBox(num: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                elevation: 16,
                shadowColor: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'البريد الإلكتروني ',
                          iconData: Icons.person,
                          onChanged: (data) {
                            email = data;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Email.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'كلمة المرور',
                          iconData: isObscureText
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                          onChanged: (data) {
                            password = data;
                          },
                          obscureText: isObscureText,
                          onTap: () {
                            // setState(() {
                            //   isObscureText = !isObscureText;
                            // });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const HorizintalSizeBox(
              num: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                  await  BlocProvider.of<LoginCubit>(context).login(email, password);
                  }
                },
                text: 'تسجيل الدخول',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'نسيت كلمه المرور ؟',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        color: kPrimaryColor),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUpView());
                  },
                  child: Text(
                    'مستخدم جديد ؟',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
