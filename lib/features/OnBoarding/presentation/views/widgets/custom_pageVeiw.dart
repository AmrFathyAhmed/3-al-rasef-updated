import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import 'custom_onBoard_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, this.pageController}) : super(key: key);
final PageController? pageController;
  @override

  Widget build(BuildContext context) {
    return  PageView(
      controller: pageController,
      children: const  [
        CustomOnBoardItem(
          title: "Welcome to 3 el rasef App",
          subTitle: "Explore a world of delicious cuisines and\n mouthwatering dishes",
          image: Assets.imagesPizzaMakerAmico,
        ),
        CustomOnBoardItem(
          title: "Delivery on the way",
          subTitle: "Get your order by speed Delivery ",
          image: Assets.imagesDeliveryAmico,
        ),
      CustomOnBoardItem(
            title: "Fast and Reliable Delivery",
            subTitle: "Order is arrived at your place",
            image: Assets.imagesInNoTimeAmico)
      ],
    );
  }
}
