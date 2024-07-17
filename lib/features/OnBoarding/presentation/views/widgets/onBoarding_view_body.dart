import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_button.dart';
import 'custom_indicator.dart';
import 'custom_pageVeiw.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  @override
  void initState() {


    pageController=PageController(initialPage: 0)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(pageController: pageController),
        Positioned(
            bottom: SizeConfig.defaultSize! * 12,
            left: SizeConfig.defaultSize! * 10,
            right: SizeConfig.defaultSize! * 10,
            child:CustomIndicator(
              dotIndex: pageController!.hasClients ? pageController!.page?.toInt():0
    ),
        ),
        Positioned(
            top: SizeConfig.screenHeight! * .1,
            right: 32,
            child: Visibility(
              visible: pageController!.hasClients ? (pageController?.page==2 ?false :true):true
              ,child: GestureDetector(
              onTap: (){Navigator.pushReplacementNamed(context, "LoginView");},
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 14, color: Color(0xff898989)),
                  textAlign: TextAlign.left,
                ),
              ),
            )),
        Positioned(
            right: SizeConfig.defaultSize! * 10,
            left: SizeConfig.defaultSize! * 10,
            bottom: SizeConfig.defaultSize! * 5,
            child: CustomButton(
              text: pageController!.hasClients ? (pageController?.page == 2 ? 'Get Start' : 'Next') : 'Next',
               onTap: (){
                if(pageController!.page!<2){
                  pageController?.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                }
                else{
                  Navigator.pushReplacementNamed(context, "LoginView");

                  //Get.to(()=>LoginView(),transition: Transition.rightToLeft,duration:const  Duration(milliseconds: 400));
                }

               },
            ))
      ],
    );
  }
}
