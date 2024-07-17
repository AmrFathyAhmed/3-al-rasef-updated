import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../generated/assets.dart';


class PersonalViewCard extends StatefulWidget {
  @override
  State<PersonalViewCard> createState() => _PersonalViewCardState();
}

class _PersonalViewCardState extends State<PersonalViewCard> {
  String name = "Unknown";
  String email = "Unknown";
  String phoneNumber = "Unknown";
  String address = "Unknown";

  Future<void> getData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    CollectionReference userInfo =
    FirebaseFirestore.instance.collection("Users");
    QuerySnapshot querySnapshot = await userInfo
        .where("UserEmail", isEqualTo: "${currentUser?.email}")
        .get();

    if (querySnapshot.size > 0) {
      var data = querySnapshot.docs[0].data() as Map<String, dynamic>;
      setState(() {
        name = data["UserName"] ?? "Unknown";
        email = data["UserEmail"] ?? "Unknown";
        phoneNumber = data["UserPhone"] ?? "Unknown";
        address = data["UserAddress"] ?? "Unknown";
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: SizeConfig.defaultSize!*22,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: SizeConfig.defaultSize!*11,
            height: SizeConfig.defaultSize!*11.5,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  Assets.imagesAvater,
                ),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Opacity(
                opacity: 0.50,
                child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Opacity(
                opacity: 0.5,
                child: Container(
                  width: SizeConfig.defaultSize!*19.5,
                  decoration:const  ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Opacity(
                opacity: 0.50,
                child: Text(
                  phoneNumber,
                  style:const  TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Opacity(
                opacity: 0.5,
                child: Container(
                  width: SizeConfig.defaultSize!*19.5,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Opacity(
                opacity: 0.50,
                child: Text(
                  address,
                  style: const  TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
