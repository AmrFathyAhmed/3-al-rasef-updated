import 'package:flutter/material.dart';

import '../../constent.dart';
import '../../features/Cart/presentation/views/cart_view.dart';

class ImageFramWidget extends StatelessWidget
{
  const ImageFramWidget({Key? key, this.image, this.width, this.height}) : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      child: Material(
        elevation: 10,
        shadowColor: kPrimaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            '$image',
            width: width, // Adjust the width as needed
            height: height, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


class ImageFramWidget2 extends StatelessWidget
{
  const ImageFramWidget2({Key? key, this.image, this.width, this.height}) : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(

        children: [
          Material(
            elevation: 10,
            shadowColor: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                '$image',
                width: width, // Adjust the width as needed
                height: height, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(



            children: [Text("Pizza   ",style: TextStyle(fontFamily: 'Cairo',fontWeight:FontWeight.w600,),),Text("100.00 EGP",style: TextStyle(fontFamily: 'Cairo',fontWeight:FontWeight.w600,color: kSColor))],)
        ],
      ),
    );
  }
}
class ImageFramWidget3 extends StatelessWidget
{
  const ImageFramWidget3({Key? key, this.image, this.width, this.height}) : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      child: GestureDetector(
        onTap:(){
         Navigator.push(context, MaterialPageRoute(builder: (context) => CartView(),));
        },
        child: Material(
          elevation: 10,
          shadowColor: kPrimaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              '$image',
              width: width, // Adjust the width as needed
              height: height, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}


class ImageFramWidget4 extends StatelessWidget
{
  const ImageFramWidget4({Key? key, this.image, this.width, this.height}) : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(

        children: [
          Material(
            elevation: 10,
            shadowColor: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network('$image',
              height: height,width: width,
              fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 10),

        ],
      ),
    );
  }
}

