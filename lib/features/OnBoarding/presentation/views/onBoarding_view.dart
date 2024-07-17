import 'package:al_rasef/features/OnBoarding/presentation/views/widgets/onBoarding_view_body.dart';
import 'package:flutter/material.dart';


class OnBoardingView extends StatelessWidget
{
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}
