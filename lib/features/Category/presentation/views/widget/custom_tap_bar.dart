import 'package:flutter/material.dart';

import '../../../../../constent.dart';
import '../../../../../core/utils/size_config.dart';
import 'Item_widget.dart';

class CustomTapBar extends StatefulWidget {
  const CustomTapBar({super.key});

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar> {
  List<String> tabs = [
    "كريب",
    "برجر",
    "بيتزا",
    "مكرونة",
    "وافل",
    "سموزي",
    "طواجن",
    "ايس كريم",
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 68;
      case 2:
        return 192;
      case 3:
        return 263;
      case 4:
        return 263;
      case 5:
        return 263;
      case 6:
        return 263;
      case 7:
        return 263;
      case 8:
        return 263;

      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 85;
      case 2:
        return 50;
      case 3:
        return 50;
      case 4:
        return 50;
      case 5:
        return 50;
      case 6:
        return 50;
      case 7:
        return 50;
      case 8:
        return 50;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .75,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            width: size.width,
            height: size.height * 0.05,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.08,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 10 : 23, top: 7),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: current == index ? 24 : 20,
                                  fontWeight: current == index
                                      ? FontWeight.w400
                                      : FontWeight.w300,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.fastLinearToSlowEaseIn,
                  bottom: 0,
                  left: changePositionedOfLine(),
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    width: changeContainerWidth(),
                    height: size.height * 0.008,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.3),
            child: Text(
              "${tabs[current]} Tab Content",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
//========================================================================

class CustomTapBar2 extends StatefulWidget {
  const CustomTapBar2({Key? key}) : super(key: key);

  @override
  State<CustomTapBar2> createState() => _CustomTapBar2State();
}

class _CustomTapBar2State extends State<CustomTapBar2> {
  /// List of Tab Bar Item
  List<String> items = [
    " كريب ",
    "برجر",
    "بيتزا",
    "مكرونة",
    "وافل",
    "سموزي",
    "طواجن",
    "ايس كريم",
  ];

  /// List of body icon

  List<String> image = [
    'lib/asset/image/Items/356632102_202954979387547_885802025837297264_n.jpg',
    'lib/asset/image/Items/356638524_202955166054195_4687078279725212525_n.jpg',
    'lib/asset/image/Items/356621900_202954936054218_8585265942636956181_n.jpg',
    'lib/asset/image/Items/355032016_197184059964639_4443110841761214032_n.jpg',
    'lib/asset/image/Items/358080912_211292688553776_5521892341843121304_n.jpg',
    'lib/asset/image/Category/341024407_776510527379515_1738779234188899610_n.jpg',
    'lib/asset/image/Category/341044546_1389459588296700_6886563202611947963_n.jpg',
    'lib/asset/image/Category/341067093_3354522358195797_1234801291787826013_n.jpg',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          /// CUSTOM TABBAR
          SizedBox(
            width: double.infinity,
            height: SizeConfig.defaultSize! * 6.66666667,
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
                        width: SizeConfig.defaultSize! * 8.88889,
                        height: SizeConfig.defaultSize! * 5,
                        decoration: BoxDecoration(
                          color:
                              current == index ? Colors.white70 : Colors.white,
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
                              color:
                                  current == index ? Colors.black : Colors.grey,
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

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => ItemWidget(
                  image: image[index], // Use image at the current index
                  name: items[index], // Use name at the current index
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//====================================================================
