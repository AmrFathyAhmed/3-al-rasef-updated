import 'package:al_rasef/features/Splash/presentation/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/Auth/presentation/manger/login_cubit/login_cubit.dart';
import 'features/Auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'features/Auth/presentation/views/login/login_view.dart';
import 'features/Category/presentation/views/category_view.dart';
import 'features/Home/presentation/views/home_veiw.dart';
import 'features/OnBoarding/presentation/views/onBoarding_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const FoodMarket(),
    ),
  );
}

class FoodMarket extends StatelessWidget {
  const FoodMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context) => LoginCubit(),),
      BlocProvider(create: (context) => SignUpCubit(),),

    ] ,
      child: GetMaterialApp(
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
        home: const SplashView(),
      ),
    );
  }
}
