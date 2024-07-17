import 'package:al_rasef/generated/assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constent.dart';
import '../../../../../../../core/widget/Dailog_message.dart';
import '../../../../../../../core/widget/custom_button.dart';
import '../../../../../../../core/widget/custom_size_box.dart';
import '../../../../../../../core/widget/custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  SignUpViewBody({Key? key}) : super(key: key);

  @override
  _SignUpViewBodyState createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isObscureText = true;
  String? name, phoneNumber, address, email, password;

  Future<UserCredential?> signUp() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      formData.save();

      try {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );

        // User created successfully, now send the verification email
        if (!userCredential.user!.emailVerified) {
          await userCredential.user!.sendEmailVerification();
          print('Verification email sent to ${userCredential.user!.email}');

          showDialog(
            context: context,
            builder: (context) => EmailVerificationDialog(),
          );
        }
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          showDialog(
              context: context,
              builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pop();},message: "The password provided is too weak.",imageTitle: 'lib/asset/image/Icons/cancel.png',));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          showDialog(
              context: context,
              builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pop();},message: "هذا الحساب مستخدم بالفعل !!",imageTitle: 'lib/asset/image/Icons/cancel.png',));

        }
        // Return null in case of any FirebaseAuthException
        return null;
      } catch (e) {
        print(e);
        // Return null in case of any other exception
        return null;
      }
    } else {
      print("Form not validated");
    }
    // Return null if form validation fails
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HorizintalSizeBox(num: 4),
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
        const HorizintalSizeBox(num: 4),
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
                      hintText: 'الاسم',
                      iconData: Icons.person,
                      onChanged: (data) {
                        name = data;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'البريد الإلكتروني ',
                      iconData: Icons.mail,
                      onChanged: (data) {
                        email = data;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email.';
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
                        setState(() {
                          isObscureText = !isObscureText;
                        });
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
                    CustomTextField(
                      hintText: 'رقم الهاتف ',
                      iconData: Icons.phone,
                      onChanged: (data) {
                        phoneNumber = data;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'العنوان',
                      iconData: Icons.home,
                      onChanged: (data) {
                        address = data;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address.';
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
        HorizintalSizeBox(
          num: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            onTap: () async {
              UserCredential? response = await signUp();
              if (response != null) {
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
            },
            text: 'تسجيل مستخدم جديد',
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'لديك حساب بالفعل ؟',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

