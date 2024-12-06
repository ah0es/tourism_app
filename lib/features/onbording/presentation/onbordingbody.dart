import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/features/onbording/data/models/onbording_data_model.dart';
import 'package:tourism_app/features/onbording/presentation/widgets/onbording_data_page.dart';

class OnBordingView extends StatefulWidget {
  const OnBordingView({super.key});

  @override
  State<OnBordingView> createState() => _OnBordingViewState();
}

class _OnBordingViewState extends State<OnBordingView> {
  @override
  final PageController pageController = PageController();
  int currentPage = 0;
  final List<OnBordingData> onbordingData = [
    OnBordingData(
        image: 'assets/images/test-select-image.png',
        title: 'Start an Easy Journey through Egypt',
        description:
            'Discover the best hotels, restaurants, and museums in every city with personalized recommendations tailored to your interests.'),
    OnBordingData(
        image: 'assets/images/test-select-image.png',
        title: 'All Information at Your Fingertips',
        description:
            'Take pictures of places to get instant details and history, while avoiding tourist scams by knowing local prices for food, transport, and services.'),
    OnBordingData(
        image: 'assets/images/test-select-image.png',
        title: 'Additional Services to Enhance Your Journey',
        description:
            'Book a trusted tour guide with a single click and use real-time translation to easily communicate with locals.')
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: onbordingData.length,
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                    image: onbordingData[index].image,
                    title: onbordingData[index].title,
                    description: onbordingData[index].description);
              },
            ),
          ),
          Positioned(
            bottom: 110.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CircularPercentIndicator(
                    radius: 38.r,
                    lineWidth: 8.w,
                    percent: (onbordingData.length - currentPage) /
                        onbordingData.length,
                    progressColor: AppColors.scaffoldBackGround,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: onbordingData.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      dotColor: AppColors.appTextColor,
                    ),
                  ),
                ),
                //  SizedBox(width: MediaQuery.of(context).size.width * .3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
