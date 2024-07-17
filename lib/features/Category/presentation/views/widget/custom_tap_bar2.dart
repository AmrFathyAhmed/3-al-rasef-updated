import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../../../../constent.dart';
import '../../../../../core/utils/size_config.dart';
import 'Item_widget.dart';

class CustomTapBar3 extends StatefulWidget {
  const CustomTapBar3({Key? key}) : super(key: key);

  @override
  State<CustomTapBar3> createState() => _CustomTapBar3State();
}

class _CustomTapBar3State extends State<CustomTapBar3> {
  List<String> items = [
  "كريب",
  "برجر",
  "بيتزا",
  "مكرونة",
  "مشويات",
  "سندوتشات",
  "وجبات",
  "وافل",
  "سموزي",
  "طواجن",
  "ايس كريم",];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: SizeConfig.defaultSize! * 6.666666666667,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: SizeConfig.defaultSize! * 8.888889,
                        height: SizeConfig.defaultSize! * 5,
                        decoration: BoxDecoration(
                          color: current == index ? Colors.white70 : Colors.white,
                          borderRadius: current == index
                              ? BorderRadius.circular(15)
                              : BorderRadius.circular(10),
                          border: current == index
                              ? Border.all(color: kPrimaryColor, width: 4)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: current == index ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: current == index,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: SizeConfig.defaultSize! * 60.85,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("Categories")
                  .doc("Type").collection("${items[current]}")
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return Text('Error: ${snapshot.error}');
                } else {
                  print("Data: ${snapshot.data?.docs}");
                  var documents = snapshot.data?.docs ?? [];
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      var data = documents[index].data();
                      String name = data["name"] ?? "Unknown";
                      String imageUrl = data["imageUrl"] ?? "Unknown";
                      String desc = data["description "] ?? " ";
                      int price = data["price"] ?? 0;

                      // Access the date field from the data (if available).
                      Timestamp? timestamp = data["date"];
                      DateTime? date;
                      if (timestamp != null) {
                        date = timestamp.toDate();
                      }
                      return ItemWidget(
                        image: imageUrl,
                        name: name,
                        price: price,
                        desc:desc,
                        date: date,
                      );
                    },
                  );
                }
              },
            ),
          ),

        ],
      ),
    );
  }

}
