import 'package:al_rasef/features/Item_details/presentation/views/widget/Item_full_view_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../constent.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widget/Dailog_message.dart';
import '../../../../generated/assets.dart';



class ItemFullView extends StatefulWidget {
  const ItemFullView({
    Key? key,
    this.name,
    this.price,
    this.imageUrl,
    this.desc,
  }) : super(key: key);
  final String? name;
  final int? price;
  final String? imageUrl;
  final String? desc;

  @override
  State<ItemFullView> createState() => _ItemFullViewState();
}

class _ItemFullViewState extends State<ItemFullView> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ItemFullViewBody(
        imageUrl: widget.imageUrl,
        desc: widget.desc,
        name: widget.name,
        price: widget.price,
        count: count,
        onCountChanged: (newCount) {
          setState(() {
            count = newCount; // Update the count value when it changes
          });
          print(count);
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 3),
            height: SizeConfig.defaultSize! * 7, // Set the height here
            width: SizeConfig.defaultSize! * 34, // Set the width here
            child: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () async {
                User? user = await FirebaseAuth.instance.currentUser;
                CollectionReference usersRef =
                FirebaseFirestore.instance.collection("UsersCart");
                String orderName = widget.name ?? ""; // Ensure the name is not null

                QuerySnapshot existingOrders = await usersRef
                    .doc("${user?.email}")
                    .collection("orders")
                    .where("name", isEqualTo: orderName)
                    .get();

                if (existingOrders.docs.isNotEmpty) {
                  // If an order with the same name exists, update the existing order
                  DocumentSnapshot existingOrder = existingOrders.docs.first;
                  int currentAmount = existingOrder["amount"] ?? 0;

                  // Calculate the new amount and price
                  int newAmount = count;
                  int newPrice = widget.price! * count;

                  // Update the existing order document with the new amount and price
                  existingOrder.reference.update({
                    "amount": newAmount,
                    "price": newPrice,
                  });
                } else {
                  // If no order with the same name exists, create a new order document
                  String orderId = usersRef.doc("${user?.email}").collection("orders").doc().id;
                  DocumentReference orderRef = usersRef.doc("${user?.email}").collection("orders").doc(orderId);

                  orderRef.set({
                    "name": orderName,
                    "price": widget.price! * count,
                    "amount": count,
                    "ImageUrl": "${widget.imageUrl}",
                    // You can add other order-specific data here if needed
                  });
                }
                 showDialog(
                  context: context,
                  builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pushReplacementNamed("HomeView");},message: "تم اضافة هذا العنصر للسلة",imageTitle: Assets.imagesChecked,)

                );
                 },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // Custom border radius
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(Assets.imagesAddToCart),
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "اضافه للسلة",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
