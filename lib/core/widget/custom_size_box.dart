import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class VerticalSizeBox extends StatelessWidget
{
  const VerticalSizeBox({Key? key, this.num}) : super(key: key);
  final double? num;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: SizeConfig.defaultSize! * num!);
  }
}
class HorizintalSizeBox extends StatelessWidget {
  const HorizintalSizeBox({Key? key, required this.num}) : super(key: key);
  final double num;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (SizeConfig.defaultSize ?? 0) * num);
  }
}