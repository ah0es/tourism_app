import 'package:flutter/material.dart';
import 'package:tourism_app/core/component/custom_app_bar.dart';
import 'package:tourism_app/core/component/custom_card_image_attractions.dart';
import 'package:tourism_app/core/component/custom_search_bar.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/core/utils/app_images.dart';

class PlanViewBody extends StatelessWidget {
  const PlanViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        title: "Choose Your Plan",
        icon: Icons.arrow_back,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchBar(
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
            ),
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CustomCardImageAttractions(
                      image: AppImages.rectangleAttraction,
                      name: 'East and West Banks',
                      governorate: 'Luxor',
                      country: 'Egypt',
                      rate: 4,
                      iconData: Icons.location_pin,
                      descraption:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                      onTap: () {
                        print('Card Tapped!');
                      },
                    );
                  })),
        ],
      ),
    );
  }
}
