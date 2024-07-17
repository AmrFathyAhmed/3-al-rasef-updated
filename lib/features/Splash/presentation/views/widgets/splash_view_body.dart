import 'package:al_rasef/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController);
    animationController.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: FadeTransition(
            opacity: fadingAnimation,
            child: Image.asset(
       Assets.imagesLogo,
            ),
          ),
        ),
      ],
    );
  }
  bool? isLogin;
  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      var user= FirebaseAuth.instance.currentUser;
     // if(user==null){
     // isLogin =false;
   // }else{
    //    isLogin=true;
     // }
      Navigator.pushReplacementNamed(context, isLogin ==false?"OnBoardView":"HomeView", );
      //Get.to(() => isLogin==false ?const OnBoardingView():HomeView(),transition:Transition.fade );
    });
  }
}
