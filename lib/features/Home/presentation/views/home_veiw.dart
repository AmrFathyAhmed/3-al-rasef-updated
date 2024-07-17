import 'package:flutter/material.dart';

import '../../../../constent.dart';
import '../../../../generated/assets.dart';
import '../../../Cart/presentation/views/cart_view.dart';
import '../../../Category/presentation/views/category_view.dart';
import '../../../Setings/presentation/views/acount_view.dart';
import 'Widget/home_view_body.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 3;
  List<Widget> body = const [
    AcountView(),
    CartView(),
    CategoryView(),
    HomeViewBody()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(

          iconSize: 26,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          selectedItemColor: kSColor,
          unselectedItemColor: kPrimaryColor,
          selectedIconTheme: IconThemeData(size: 40),
          showUnselectedLabels: false,

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '',),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: ''),
            BottomNavigationBarItem(icon: ImageIcon(
                AssetImage(Assets.imagesCategory)), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          ]),
    );
  }
}
