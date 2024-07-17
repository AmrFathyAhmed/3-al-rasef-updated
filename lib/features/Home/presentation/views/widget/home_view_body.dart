import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../../core/widget/custom_size_box.dart';
import '../../../../../core/widget/image_fram.dart';
import '../../../../../generated/assets.dart';
import 'Suggested_food_widget.dart';
import 'home_back_ground.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  Timer? _timer;
  final List<double> itemHeights = [150, 200, 250, 180, 220, 160];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_currentPageIndex < 5) {
        // Replace 10 with the actual number of items
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(children: [
      const HomeBackRoundWidget(),
      const HorizintalSizeBox(num: 4),
      SizedBox(
        height: 230,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, _) => ImageFramWidget(
                height: 225,
                width: MediaQuery.of(context).size.width*.9,
                image: Assets.imagesPageView,
              ),
            );
          },
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 24, bottom: 8),
        child: Text(
          '  وجبات مقترحة',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontFamily: 'Cairo', fontSize: 18),
          textAlign: TextAlign.right,
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SuggestFoodWidget(),
          ],
        ),
      )
    ]);
  }
}
