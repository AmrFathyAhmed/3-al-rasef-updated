import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../constent.dart';

class CustomIndicator extends StatelessWidget
{
  const CustomIndicator({Key? key, this.dotIndex}) : super(key: key);
  final int ? dotIndex;
  @override
  Widget build(BuildContext context) {
    return  DotsIndicator(
      dotsCount: 3,
      position: dotIndex!,
      decorator: DotsDecorator(color: Colors.white,

        activeColor: kPrimaryColor
        ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color: kPrimaryColor)),),
    );
  }
}
