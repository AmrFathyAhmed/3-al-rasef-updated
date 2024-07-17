import 'package:flutter/material.dart';

import '../../../../../constent.dart';
import '../../../../Item_details/presentation/views/item_full_view.dart';


class ItemWidget extends StatelessWidget {
  ItemWidget(
      {Key? key, this.image, this.name, this.price, this.date, this.desc})
      : super(key: key);

  final String? image;
  final String? name;
  final String? desc;
  final int? price;
  var date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 16,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              width: 150,
              height: 130,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage('$image'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$name",
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "$price EGP",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: kSColor),
                    textAlign: TextAlign.right,
                  ),
                  Container(
                    width: 120,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 16,
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: IconButton(
                        icon:
                            Icon(Icons.shopping_cart_outlined, color: kSColor),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemFullView(
                                    price: price,
                                    name: name,
                                    desc: desc,
                                    imageUrl: image),
                              ));
                        },
                      ),
                    ),
                  ),
                SizedBox(height: 10,)],

              ),
            )
          ],
        ),
      ),
    );
  }
}

//====================================================================
class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    Key? key,
    this.image,
    this.name,
    this.price,
    this.date,
    this.desc,
    this.count, this.onDelete,
  }) : super(key: key);

  final String? image;
  final String? name;
  final String? desc;
  final int? count;
  final int? price;
  final void Function()? onDelete;// Change the type to double for price

  var date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 16,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),

        child: Row(
          children: [
            const SizedBox(width: 10),
            Container(
              width: 150,
              height: 130,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("$image"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                    "${name}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "الكمية : ${count}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "${price?.toStringAsFixed(2)} EGP", // Format the double price to a fixed number of decimals
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kSColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: 60,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 16,
                            offset: Offset(0, 10),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: IconButton(
                          icon: Icon(Icons.delete, color: kPrimaryColor),
                          onPressed: onDelete
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
