import 'package:flutter/material.dart';

import '../../features/Auth/presentation/views/login/login_view.dart';

class EmailVerificationDialog extends StatelessWidget {
  const EmailVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const  Text(
                'اثبات ملكية الحساب',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const   SizedBox(height: 20),
             const  Text(
                'تم إنشاء حسابك بنجاح\nيرجى التحقق من بريدك الإلكتروني قبل المتابعة',
                textAlign: TextAlign.center,
              ),
            const   SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ));
                },
                child: const Text('ok',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//=======================================================================

class DialogMassage extends StatelessWidget {

  const DialogMassage({super.key, this.message, this.imageTitle,this.onTap});
  final String? message;
  final String? imageTitle;
   final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("$imageTitle",width: 50,height: 50,),
             const  SizedBox(height: 20),
              Text(
                '$message',
                textAlign: TextAlign.center,
              ),
             const  SizedBox(height: 20),
              GestureDetector(
                onTap:onTap,
                child: const Text(' تمام',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.left,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
