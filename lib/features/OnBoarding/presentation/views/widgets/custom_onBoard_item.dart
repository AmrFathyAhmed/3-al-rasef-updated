import 'package:flutter/material.dart';

import '../../../../../core/widget/custom_size_box.dart';

class CustomOnBoardItem extends StatelessWidget
{
  const CustomOnBoardItem({Key? key, this.subTitle, this.title, this.image}) : super(key: key);
  final String? subTitle;
  final String? title;
  final String? image;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
       const  HorizintalSizeBox(num: 15,),
        Image.asset(image!,),

        Text(title!,style :const TextStyle(fontSize: 20, color: Color(0xff2f1e41),fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,)
        ,
       const  HorizintalSizeBox(num: 1.8,),
        Text(subTitle!,style :const TextStyle(fontSize: 15, color: Color(0xff78787c),fontWeight:FontWeight.w600 ),
          textAlign: TextAlign.center,)
      ],
    );

  }
}
