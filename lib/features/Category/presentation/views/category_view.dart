import 'package:al_rasef/features/Category/presentation/views/widget/custom_tap_bar2.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Container(
        color: const Color(0xfff5f5f7),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
            const   Padding(
                padding:  EdgeInsets.only(left: 16.0),
                child: Text("Category", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
              ),
             const  CustomTapBar3(),
              Container(height: 8,color: Colors.transparent,)
            ],
          ),
        ),
      
    );
  }
}