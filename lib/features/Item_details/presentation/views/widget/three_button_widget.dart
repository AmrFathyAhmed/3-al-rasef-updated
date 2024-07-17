import 'package:flutter/material.dart';

import '../../../../../constent.dart';
import '../../../../../core/utils/size_config.dart';


class ThreeButtonWidget extends StatefulWidget {
  const ThreeButtonWidget({Key? key}) : super(key: key);

  @override
  State<ThreeButtonWidget> createState() => _ThreeButtonWidgetState();
}
class _ThreeButtonWidgetState extends State<ThreeButtonWidget> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              /// CUSTOM TABBAR
              SizedBox(
                width: double.infinity,
                height: SizeConfig.defaultSize! * 6.66666667,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          current = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: current == 0 ? kPrimaryColor : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            current == 0 ? 15 : 10,
                          ),
                        ),
                        side: BorderSide(
                          color: current == 0 ? kPrimaryColor : Colors.transparent,
                          width: current == 0 ? 4 : 0,
                        ),
                      ),
                      child: Text(
                        "صغير",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: current == 0 ? Colors.white : kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.defaultSize! * 1.11111), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          current = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: current == 1 ? kPrimaryColor : Colors.white, // Fixed the primary color for button 1
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            current == 1 ? 15 : 10,
                          ),
                        ),
                        side: BorderSide(
                          color: current == 1 ? kPrimaryColor : Colors.transparent,
                          width: current == 1 ? 4 : 0,
                        ),
                      ),
                      child: Text(
                        "وسط",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: current == 1 ? Colors.white : kPrimaryColor, // Fixed the text color for button 1
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.defaultSize! * 1.11111), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          current = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: current == 2 ? kPrimaryColor : Colors.white, // Fixed the primary color for button 2
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            current == 2 ? 15 : 10,
                          ),
                        ),
                        side: BorderSide(
                          color: current == 2 ? kPrimaryColor : Colors.transparent,
                          width: current == 2 ? 4 : 0,
                        ),
                      ),
                      child: Text(
                        "كبير",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: current == 2 ? Colors.white : kPrimaryColor, // Fixed the text color for button 2
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
