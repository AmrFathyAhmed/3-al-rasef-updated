import 'package:flutter/material.dart';

import '../../../../../core/widget/image_fram.dart';
import '../../../../../generated/assets.dart';


class SuggestFoodWidget extends StatelessWidget
{
  const SuggestFoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          ImageFramWidget2(
            height: 150,
            width: MediaQuery.sizeOf(context).width*.42,
            image: Assets.imagesItem1,
          ),
          ImageFramWidget2(
            height: 175,
            width: MediaQuery.sizeOf(context).width*.42,
            image: Assets.imagesItem2,
          ),
          ImageFramWidget2(
            height: 150,
            width: MediaQuery.sizeOf(context).width*.42,
            image: Assets.imagesItem3,
          ),
        ],),
        Column(children: [
          ImageFramWidget2(
            height: 200,
            width: MediaQuery.sizeOf(context).width*.42,
            image: Assets.imagesItem4,
          ),
          ImageFramWidget2(
            height: 150,
            width: MediaQuery.sizeOf(context).width*.42,
            image: Assets.imagesItem5,
          ),
          ImageFramWidget2(
            height: 225,
            width: MediaQuery.sizeOf(context).width*.42,
            image: Assets.imagesItem6,
          ),
        ],),
      ],
    );
  }
}
