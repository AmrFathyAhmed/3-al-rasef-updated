import 'package:flutter/material.dart';

import '../../constent.dart';
import '../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.text, required this.onTap})
      : super(key: key);
  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Text(
          "$text",
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {Key? key, this.text, required this.onTap, this.icon, this.color})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth!/2.25,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Color(0xff707070)
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: color,),
              Text(
                "  $text",
                style: TextStyle(

                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
      ),
    );
  }
}
