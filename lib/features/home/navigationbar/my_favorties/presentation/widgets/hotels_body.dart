import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/core/component/custom_card_image_hotels.dart';

class HotelsBody extends StatelessWidget {
  const HotelsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCardImageHotels(
            country: 'Egypt',
            governorate: 'Luxor',
            iconData: Icons.location_pin,
            image: 'assets/images/Rectangle1.png',
            name: 'Four Seasons',
            price: 20,
            rate: 3,
          ),
          CustomCardImageHotels(
            country: 'Egypt',
            governorate: 'Luxor',
            iconData: Icons.location_pin,
            image: 'assets/images/Rectangle2.png',
            name: 'Four Seasons',
            price: 20,
            rate: 3,
          ),
          CustomCardImageHotels(
            country: 'Egypt',
            governorate: 'Luxor',
            iconData: Icons.location_pin,
            image: 'assets/images/Rectangle3.png',
            name: 'Four Seasons',
            price: 20,
            rate: 3,
          ),
          CustomCardImageHotels(
            country: 'Egypt',
            governorate: 'Luxor',
            iconData: Icons.location_pin,
            image: 'assets/images/Rectangle4.png',
            name: 'Four Seasons',
            price: 20,
            rate: 3,
          ),
          CustomCardImageHotels(
            country: 'Egypt',
            governorate: 'Luxor',
            iconData: Icons.location_pin,
            image: 'assets/images/Rectangle5.png',
            name: 'Four Seasons',
            price: 20,
            rate: 3,
          )
        ],
      ),
    );
  }
}
