import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/widgets/event_list.dart';
import 'package:tourism_app/features/home/presentation/widgets/header_page.dart';
import 'package:tourism_app/features/home/presentation/widgets/category_list.dart'; // Import the new category list widget

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              HeaderHomePage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      'Events',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              EventList(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: CategoryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
