import 'package:flutter/material.dart';
import 'package:tourism_app/features/bottomNavigationBar/presentation/widget/cusotm_bottom_navigation_bar.dart';
import 'package:tourism_app/features/home/presentation/home_view.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int selectedIndex = 0;

  void onNavBarItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(child: navBarViews[selectedIndex]),
        ),
        Positioned(
          bottom: 10,
          left: 16,
          right: 16,
          child: CustomNavigationBarWidget(
            selectedIndex: selectedIndex,
            onItemSelected: onNavBarItemTapped,
          ),
        )
      ],
    );
  }
}

List<Widget> navBarViews = [
  HomeView(),
  Text('Guides View'),
  Text('Camera View'),
  Text('Plans View'),
  Text('Menu View'),
];
