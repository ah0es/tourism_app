import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/core/component/custom_card_image_restaurant.dart';

class RestaurantCafeBody extends StatelessWidget {
  const RestaurantCafeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: CustomCardImageRestaurant(
                  image: 'assets/images/Rectangle.png',
                  name: 'East and West Banks',
                  governorate: 'Luxor',
                  country: 'Egypt',
                  rate: 4,
                  iconData: Icons.location_pin,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
