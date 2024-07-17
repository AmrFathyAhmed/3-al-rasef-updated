import 'package:al_rasef/features/Item_details/presentation/views/widget/priceand_count.dart';
import 'package:al_rasef/features/Item_details/presentation/views/widget/three_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/image_fram.dart';
import '../../../../../generated/assets.dart';
import '../../../../Home/presentation/views/Widget/Suggested_food_widget.dart';


class ItemFullViewBody extends StatefulWidget {
  ItemFullViewBody({Key? key, this.name, this.price, this.imageUrl, this.desc, required this.onCountChanged, required this.count})
      : super(key: key);
  final String? name;
  final int? price;
  final int count;
  final String? imageUrl;
  final String? desc;

  final void Function(int) onCountChanged;

  @override
  State<ItemFullViewBody> createState() => _ItemFullViewBodyState();
}

class _ItemFullViewBodyState extends State<ItemFullViewBody> {
 int count=1;
  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig here before using defaultSize
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          SizedBox(height: SizeConfig.defaultSize! * 7),
          ImageFramWidget4(
            height: SizeConfig.defaultSize! * 30,
            width: double.infinity,
            image: '${widget.imageUrl}',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  PriceAndCountItems(
                    price: widget.price!,onCountChanged: widget.onCountChanged
                  ),
                ],
              ),
              Flexible(
                // or Expanded
                flex: 2, // Set the flex value here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const SizedBox(
                          width: 34,
                        ),
                        Image.asset(
                          Assets.imagesStar,
                          height: 24,
                          width: 24,
                        ),
                        Image.asset(
                          Assets.imagesStar,
                          height: 24,
                          width: 24,
                        ),
                        Image.asset(
                          Assets.imagesStar,
                          height: 24,
                          width: 24,
                        ),
                        Image.asset(
                          Assets.imagesStar,
                          height: 24,
                          width: 24,
                        ),
                        Image.asset(
                          Assets.imagesStar,
                          height: 24,
                          width: 24,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          const ThreeButtonWidget(),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          const Text(
            ": الوصف",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
          ),
          Text(
            '${widget.desc}',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(.8)),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          const  Text(
            '  وجبات مقترحة',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontFamily: 'Cairo', fontSize: 18),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SuggestFoodWidget(),
          ),
        ],
      ),
    );
  }
}
