import 'package:al_rasef/features/Auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:al_rasef/features/Auth/presentation/manger/sign_up_cubit/sign_up_state.dart';
import 'package:al_rasef/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../constent.dart';
import '../../../../../../../core/widget/Dailog_message.dart';
import '../../../../../../../core/widget/custom_button.dart';
import '../../../../../../../core/widget/custom_size_box.dart';
import '../../../../../../../core/widget/custom_text_field.dart';
import '../../../login/login_view.dart';

class SignUpViewBody extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isObscureText = true;
  String? name, phoneNumber, address, email, password;

  bool? isLoading;

  SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showDialog(
              context: context,
              builder: (context) => DialogMassage(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView(),));
                },
                message: state.successMessage,
                imageTitle: Assets.imagesChecked,
              ));

        } else if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpFailure) {
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
      child: ListView(
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
                if (formKey.currentState!.validate()) {
                await  BlocProvider.of<SignUpCubit>(context).signUp(email, password, phoneNumber, name, address);
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
      ),
    );
  }
}
