import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    //currentLocation();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    timer = Timer(
      const Duration(seconds: 3),
      () {
        // if (onBoardingValue) {
        //   //   runAnimation = true;
        //   setState(() {});
        //   //context.navigateToPage(const OnBoardingScreen());
        // } else {
        //   // context.navigateToPageWithClearStack(
        //   //   userCacheValue?.data == null ? const AddPasswordScreen() : const NavBArScreens(),
        //   // );
        //   context.navigateToPage(const BottomNavBarScreen());
        // }
        //  Utils.setStatusAndNavigationBarMethod(context);
        //     : const LoginScreen());
        // if (Constants.user) {
        //   context.navigateToPage(const SignUpView());

        //   // context.navigateToPage(const BottomNavBarScreen());
        // } else {
        //   //  context.navigateToPage(const NavBArScreens());
        // }

        //  userCache?.put(onBoardingKey, false);
      },
    );
  }

/*  String? long;
  String? lat;

  void currentLocation() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      try {
        final Position position = await Geolocator.getCurrentPosition();
        lat = position.latitude.toString();
        long = position.longitude.toString();
        appCacheBox!.put(latCacheName, lat);
        appCacheBox!.put(longCacheName, long);
        latCache = lat;
        longCache = long;
      } catch (e) {
        return;
      }
    } else {}
  }*/

  @override
  void dispose() {
    controller.dispose(); // Dispose the AnimationController
    timer.cancel(); // Cancel the Timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                AppImages.logo,
                height: 200,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
