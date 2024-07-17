import 'package:al_rasef/features/Setings/presentation/views/widget/acount_view_body.dart';
import 'package:flutter/material.dart';

class AcountView extends StatelessWidget
{
  const AcountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xfff5f5f7)),
      child: ListView(
        children: [
            AcountViewBody(),
        ],
      ),
    );
  }
}
