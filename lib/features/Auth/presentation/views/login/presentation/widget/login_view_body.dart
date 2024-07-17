import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../../../constent.dart';
import '../../../../../../../core/widget/Dailog_message.dart';
import '../../../../../../../core/widget/custom_button.dart';
import '../../../../../../../core/widget/custom_size_box.dart';
import '../../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../../generated/assets.dart';
import '../../../sign_up/sign_up_view.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isObscureText = true;

  String? email, password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      formData.save();

      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );

        if (userCredential.user != null && !userCredential.user!.emailVerified) {
          await userCredential.user!.sendEmailVerification();
          print('Verification email sent to ${userCredential.user!.email}');
          showDialog(
            context: context,
            builder: (context) => EmailVerificationDialog(),
          );
        } else {
          // Email is verified or user is not required to verify
          print('User logged in successfully.');
          Navigator.pushReplacementNamed(context, 'HomeView');

        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          showDialog(
              context: context,
              builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pop();},message: "No user found for that email.",imageTitle: 'lib/asset/image/Icons/cancel.png',));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          showDialog(
              context: context,
              builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pop();},message: "Wrong password provided for that user..",imageTitle: 'lib/asset/image/Icons/cancel.png',));
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Form not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                fontWeight: FontWeight.bold, fontSize: 46, fontFamily: 'Cairo'),
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
                        // You can add more email validation rules if needed
                        return null;
                      },
                    ),
                   const  SizedBox(
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
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password.';
                        }
                        // You can add more password validation rules if needed
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
            // await login();
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
    );
  }
}
