import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';

class ListItemWidget extends StatelessWidget {
  final String? text;

  const ListItemWidget({super.key, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        height: SizeConfig.defaultSize!*7,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 40,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$text',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,

                fontWeight: FontWeight.w600,
              ),
            ),
           Icon(Icons.arrow_forward_ios_outlined,size:24)
          ],
        ),
      ),
    );
  }
}








class ListItemWidget2 extends StatelessWidget {
  final String? text;

  const ListItemWidget2({super.key, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        width: double.infinity,
        height: SizeConfig.defaultSize!*7,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 40,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$text',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,

                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.logout,size:24)
          ],
        ),
      ),
    );
  }
}


