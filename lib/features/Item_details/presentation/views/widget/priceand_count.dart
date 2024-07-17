import 'package:flutter/material.dart';

import '../../../../../constent.dart';


class PriceAndCountItems extends StatefulWidget {

  final int price;
  final void Function(int) onCountChanged;

  PriceAndCountItems({Key? key, required this.price, required this.onCountChanged}) : super(key: key);

  @override
  State<PriceAndCountItems> createState() => _PriceAndCountItemsState();
}

class _PriceAndCountItemsState extends State<PriceAndCountItems> {
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey[400]!),
                      borderRadius: BorderRadius.circular(20)),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (count == 1) {
                          } else {
                            count--;
                          }
                        });
                        widget.onCountChanged(count);
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: AppColor.black)),
                  child: Text(
                   '${count}',
                    style: const TextStyle(
                      height: 1,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            count++;
                          },
                        );
                        widget.onCountChanged(count);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
       const  SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(
              width: 15,
            ),
            Text(
              "${widget.price *count}  ",
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  color: kSColor,
                  fontSize: 28),
            ),
           const  Text("EGP",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14))
          ],
        )
      ],
    );
  }
}
