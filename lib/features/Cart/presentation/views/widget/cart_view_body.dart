import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../constent.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../Category/presentation/views/widget/Item_widget.dart';
import 'finish_order.dart';



class CartViewBody extends StatefulWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  User? user = FirebaseAuth.instance.currentUser;
  double totalCartPrice = 0;

  void deleteItem(String itemId) {
    FirebaseFirestore.instance
        .collection("UsersCart")
        .doc("${user?.email}")
        .collection("orders")
        .doc(itemId)
        .delete();
  }

  // Function to calculate the total cart price
  double calculateTotalPrice(List<QueryDocumentSnapshot<Map<String, dynamic>>> documents) {
    double totalPrice = 0;
    documents.forEach((doc) {
      var data = doc.data();
      int price = data["price"] ?? 0;
      int amount = data["amount"] ?? 0;
      totalPrice += (price );
    });
    return totalPrice;
  }
  //final connectivityResult =  (Connectivity().checkConnectivity());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
              children: [
                SizedBox(height: SizeConfig.defaultSize! * 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Assets.imagesShoppingCart,
                        width: 40,
                        height: 40,
                      ),
                      const Text(
                        "السلة",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection("UsersCart")
                          .doc("${user?.email}")
                          .collection("orders")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          print("Error: ${snapshot.error}");
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Calculate the total cart price inside the builder method
                          var documents = snapshot.data!.docs;
                          totalCartPrice = calculateTotalPrice(documents);
                          if (documents.isEmpty) {
                            // Return a widget indicating that the cart is empty
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(child: ListView(children: [
                                SizedBox(height: SizeConfig.defaultSize!*10,),
                                Image.asset(Assets.imagesBasket),
                                Center(child: Text("!! سلتك فارغه ",style: TextStyle(fontSize: 26),))
                              ],)),
                            );
                          }
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: documents.length,
                                  itemBuilder: (context, index) {
                                    var data = documents[index].data();
                                    String name = data["name"] ?? "Unknown";
                                    String imageUrl = data["ImageUrl"] ?? "Unknown";
                                    int price = data["price"] != null ? data["price"].toInt() : 0;
                                    int amount = data["amount"] ?? 0;

                                    // Get the document ID of the cart item
                                    String itemDocId = documents[index].id;

                                    // Use the CartItemWidget to display each cart item
                                    return CartItemWidget(
                                      price: price,
                                      image: imageUrl,
                                      name: name,
                                      count: amount,
                                      onDelete: () => deleteItem(itemDocId),
                                    );
                                  },
                                ),
                              ),
                              Text(
                                "Total Price: ${totalCartPrice.toStringAsFixed(2)} EGP",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: kSColor,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                                child: CustomButton(onTap: () {
                                  // if (connectivityResult == ConnectivityResult.none) {
                                  //
                                  //     showDialog(
                                  //         context: context,
                                  //         builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pushReplacementNamed("HomeView");},message: "تحقق من اتصالك بالانترنت...",imageTitle: 'lib/asset/image/Icons/cancel.png',)
                                  //
                                  //     );
                                  //
                                  //
                                  // }
                                  // else{
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => FinishOrderView(),));
                                  // }

                                },text: "طلب الاوردر",),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
    );
  }
}


