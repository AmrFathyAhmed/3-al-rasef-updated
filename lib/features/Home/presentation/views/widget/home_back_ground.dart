import 'package:flutter/material.dart';

import '../../../../../constent.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../generated/assets.dart';


class HomeBackRoundWidget extends StatelessWidget
{
  const HomeBackRoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return    Container(
      height: 235,
      child: Stack(
        children: [

          Material(
            elevation: 20,
            shadowColor: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.imagesBanner,
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
           bottom: SizeConfig.defaultSize!/19,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 20,
                shadowColor: kPrimaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 100,
                    height: 100,

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
