import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/Dailog_message.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../../../../../generated/assets.dart';

class FinishOrderView extends StatefulWidget {
  const FinishOrderView({Key? key}) : super(key: key);

  @override
  State<FinishOrderView> createState() => _FinishOrderViewState();
}

class _FinishOrderViewState extends State<FinishOrderView> {
  String? _deliveryOption = 'delivery';
  String? _address, _note;
  String? _userName, _userPhone, _userAddress;
  GlobalKey formKey = GlobalKey();

  // =====================================UserInfo==========================================

  Future<Map<String, dynamic>> getUserInfoFromFirebase() async {
    var user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc('${user?.email}')
        .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data;
  }

  @override
  void initState() {
    super.initState();
    _loadUserInfoFromFirebase();
    _loadAddressFromFirebase(); // Call this to load user address
  }

  Future<void> _loadUserInfoFromFirebase() async {
    try {
      Map<String, dynamic> userInfo = await getUserInfoFromFirebase();
      setState(() {
        _userName = userInfo['UserName'];
        _userPhone = userInfo['UserPhone'];
        _userAddress = userInfo['UserAddress'];
      });
    } catch (error) {
      print("Error fetching user info: $error");
    }
  }

  // ======================================Address================================

  Future<String> getAddressFromFirebase() async {
    var user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc('${user?.email}')
        .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data["UserAddress"];
  }

  TextEditingController _addressController = TextEditingController();

  Future<void> _loadAddressFromFirebase() async {
    try {
      String address = await getAddressFromFirebase();
      setState(() {
        _addressController.text =
            address ?? ''; // Default to empty string if address is null
      });
    } catch (error) {
      print("Error fetching address: $error");
    }
  }

  // ==============================================AddInfoToFireStore============================================================

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getAllCartDocuments() async {
    var user = FirebaseAuth.instance.currentUser;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('UsersCart')
        .doc("${user?.email}")
        .collection("orders")
        .get();
    return querySnapshot.docs
        .map((doc) => doc as QueryDocumentSnapshot<Map<String, dynamic>>)
        .toList();
  }


  Future<void> deleteCartDocuments(List<QueryDocumentSnapshot<Map<String, dynamic>>> cartDocuments) async {
    try {
      for (var cartDoc in cartDocuments) {
        await cartDoc.reference.delete();
      }
      print("Cart documents deleted successfully");
    } catch (error) {
      print("Error deleting cart documents: $error");
    }
  }


  // Inside the consolidateCartToAdminOrder method
  Future<void> consolidateCartToAdminOrder(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> cartDocuments) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email != null) {
      String userEmail = user.email!;
      Map<String, dynamic> consolidatedData = {};

      double totalPrice = 0.0;

      for (var cartDoc in cartDocuments) {
        Map<String, dynamic> cartData = cartDoc.data();

        String itemName = cartData['name'];
        int quantity = cartData['amount'];
        int itemPrice = cartData['price'];

        totalPrice += itemPrice * quantity;

        // Merge cart data into consolidatedData
        if (consolidatedData.containsKey(itemName)) {
          consolidatedData[itemName] += quantity;
        } else {
          consolidatedData[itemName] = quantity;
        }
      }

      Map<String, dynamic> orderData = {
        'user_name': _userName,
        'user_phone': _userPhone,
        'user_address': _address == null ? _userAddress : _address,
        'total_price': totalPrice,
        'items': consolidatedData,
        'time': "${DateTime.now().hour}:${DateTime.now().minute}",
        'note': _note == null ? " " : _note,
        'type': _deliveryOption,
      };

      print("Order Data: $orderData"); // Print order data before saving

      try {
        await FirebaseFirestore.instance
            .collection('AdminOrders')
            .doc('${userEmail}_order')
            .set(orderData);
        print("Order data saved successfully in AdminOrders collection");

        // Call deleteCartDocuments after successfully saving the order data
        await deleteCartDocuments(cartDocuments);
        print("Cart documents deleted successfully");
      } catch (error) {
        print("Error saving order data: $error");
      }
    } else {
      print("User is not authenticated or email is null.");
    }
  }

  //======================================================
  // Inside the consolidateCartToAdminOrder method
  Future<void> consolidateCartToAdminOrder2(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> cartDocuments) async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null && user.email != null) {
      String userEmail = user.email!;
      Map<String, dynamic> consolidatedData = {};

      double totalPrice = 0.0;

      for (var cartDoc in cartDocuments) {
        Map<String, dynamic> cartData = cartDoc.data();

        String itemName = cartData['name'];
        int quantity = cartData['amount'];
        int itemPrice = cartData['price'];

        totalPrice += itemPrice * quantity;

        // Merge cart data into consolidatedData
        if (consolidatedData.containsKey(itemName)) {
          consolidatedData[itemName] += quantity;
        } else {
          consolidatedData[itemName] = quantity;
        }
      }

      Map<String, dynamic> orderData = {
        'user_name': _userName,
        'user_phone': _userPhone,
        'total_price': totalPrice,
        'items': consolidatedData,
        'time': "${DateTime.now().hour}:${DateTime.now().minute}",
        'note': _note == null ? " " : _note,
        'type': _deliveryOption,
      };

      print("Order Data: $orderData"); // Print order data before saving

      try {
        await FirebaseFirestore.instance
            .collection('AdminOrders')
            .doc('${userEmail}_order')
            .set(orderData);
        print("Order data saved successfully in AdminOrders collection");

        // Call deleteCartDocuments after successfully saving the order data
        await deleteCartDocuments(cartDocuments);
        print("Cart documents deleted successfully");
      } catch (error) {
        print("Error saving order data: $error");
      }
    } else {
      print("User is not authenticated or email is null.");
    }
  }
  //final connectivityResult =  (Connectivity().checkConnectivity());
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Image.asset(
             Assets.imagesLocationReviewAmico),
          SizedBox(height: SizeConfig.defaultSize! * 4),
          Row(
            children: [
              Flexible(
                child: RadioListTile<String>(
                  title: Text('دليفيري'),
                  value: 'delivery',
                  groupValue: _deliveryOption,
                  onChanged: (value) {
                    setState(() {
                      _deliveryOption = value;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile<String>(
                  title: Text('استلام في المطعم'),
                  value: 'pick_up',
                  groupValue: _deliveryOption,
                  onChanged: (value) {
                    setState(() {
                      _deliveryOption = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _deliveryOption == 'delivery'
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              child: Text(
                                "العنوان",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            )),
                        CustomTextField2(
                          iconData: Icons.location_on_outlined,
                          validator: (data) {
                            if (data == null) {
                              return "this field is required";
                            }
                          },
                          hintText: "العنوان",
                          maxLine: 1,
                          controller: _addressController,
                          onChanged: (data) {
                            _address = data;
                          },
                        ),
                        Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              child: Text(
                                "ملاحظات",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            )),
                        CustomTextField2(
                          maxLine: 4,
                          hintText: 'اكتب اي شئ',
                          onChanged: (data) {
                            _note = data;
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 8,
                        ),
                        CustomButton(
                          onTap: () async {
                            // if (connectivityResult == ConnectivityResult.none) {
                            //   showDialog(
                            //       context: context,
                            //       builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pushReplacementNamed("HomeView");},message: "تحقق من اتصالك بالانترنت...",imageTitle: 'lib/asset/image/Icons/cancel.png',)
                            //
                            //   );
                            // }
                            List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            cartDocuments = await getAllCartDocuments();
                            await consolidateCartToAdminOrder(cartDocuments);
                            showDialog(
                                context: context,
                                builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pushReplacementNamed("HomeView");},message: " تم طلب الاوردر بنحاح\n ستصلك مكالمه بتاكيد طلبك",imageTitle: 'lib/asset/image/Icons/checked.png',)

                            ); },
                          text: 'انهاء الطلب',
                        ),
                        SizedBox(height: SizeConfig.defaultSize! * 4),
                      ],
                    ),
                  ),
                )
              :
              //================================================================================

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              child: Text(
                                "ملاحظات",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            )),
                        CustomTextField2(
                          maxLine: 4,
                          hintText: 'اكتب اي ملاحظة',
                          onSubmit: (data) {
                            _note = data;
                          },
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 8,
                        ),
                        CustomButton(
                          onTap: () async {
                            // if (connectivityResult == ConnectivityResult.none) {
                            //   showDialog(
                            //       context: context,
                            //       builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pushReplacementNamed("HomeView");},message: "تحقق من اتصالك بالانترنت...",imageTitle: 'lib/asset/image/Icons/cancel.png',)
                            //
                            //   );
                            // }
                            List<QueryDocumentSnapshot<Map<String, dynamic>>>
                            cartDocuments = await getAllCartDocuments();
                            await consolidateCartToAdminOrder2(cartDocuments);
                            showDialog(
                                context: context,
                                builder: (context) => DialogMassage(onTap: (){Navigator.of(context).pushReplacementNamed("HomeView");},message: " تم طلب الاوردر بنحاح\n ستصلك مكالمه بتاكيد طلبك",imageTitle: 'lib/asset/image/Icons/checked.png',)

                            );

                          },
                          text: 'انهاء الطلب',
                        ),
                        SizedBox(height: SizeConfig.defaultSize! * 4),
                      ],
                    ),
                  ),
                )
        ]));
  }
}
