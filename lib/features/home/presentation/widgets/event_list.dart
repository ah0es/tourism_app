import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/app_images.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  EventListState createState() => EventListState();
}

class EventListState extends State<EventList> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set up PageController with viewportFraction for peeking effect
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.85, // Adjust the fraction to control the peeking size
    );

    // Set up the timer for automatic scrolling
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Restart to the first item
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: PageView.builder(
        padEnds: false,
        pageSnapping: true,
        controller: _pageController,
        itemCount: sliderImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                sliderImages[index],
                fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width * 0.8,
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> sliderImages = [
  AppImages.posterTow,
  AppImages.posterTow,
  AppImages.posterTow,
  // AppImages.posterOne,
  // AppImages.posterThree,
];
