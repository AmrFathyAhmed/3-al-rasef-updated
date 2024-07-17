 import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'features/Auth/presentation/views/login/login_view.dart';
import 'features/Category/presentation/views/category_view.dart';
import 'features/Home/presentation/views/home_veiw.dart';
import 'features/OnBoarding/presentation/views/onBoarding_view.dart';
import 'features/Splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp( DevicePreview(
    enabled: true,
    builder: (context) => const FoodMarket(),
  ),);
}

class FoodMarket extends StatelessWidget {
  const FoodMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        "HomeView": (context) => const HomeView(),
        "LoginView": (context) => const LoginView(),
        "CategoryView": (context) => const CategoryView(),
        "OnBoardView": (context) => const OnBoardingView(),
      },
      theme: ThemeData(fontFamily: "Cairo"),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const HomeView(),
    );
  }
}
