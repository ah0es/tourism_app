import 'package:flutter/material.dart';
import 'package:tourism_app/core/component/custom_card_image_tourguide.dart';
import 'package:tourism_app/core/utils/app_images.dart';

class TourguideBody extends StatelessWidget {
  const TourguideBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(children: [
          Flexible(
              child: CustomCardImageTourguide(
            image: AppImages.groupTourguide,
            language1: 'English',
            language2: 'Japanese',
            name: 'Ahmed fathy',
            rate: 1,
            price: 500,
          ),
          ),
          Flexible(
              child: CustomCardImageTourguide(
            image: AppImages.groupTourguide,
            language1: 'English',
            language2: 'Japanese',
            name: 'Ahmed fathy',
            rate: 1,
            price: 500,
          )),
        ]),
        Row(
          children: [
            Flexible(
                child: CustomCardImageTourguide(
              image: AppImages.groupTourguide,
              language1: 'English',
              language2: 'Japanese',
              name: 'Ahmed fathy',
              rate: 1,
              price: 500,
            ),
            ),
            Flexible(
                child: CustomCardImageTourguide(
              image: AppImages.groupTourguide,
              language1: 'English',
              language2: 'Japanese',
              name: 'Ahmed fathy',
              rate: 1,
              price: 500,
            )),
          ],
        ),
        Row(
          children: [
            Flexible(
                child: CustomCardImageTourguide(
              image: AppImages.groupTourguide,
              language1: 'English',
              language2: 'Japanese',
              name: 'Ahmed fathy',
              rate: 1,
              price: 500,
            )),
            Flexible(
                child: CustomCardImageTourguide(
              image: AppImages.groupTourguide,
              language1: 'English',
              language2: 'Japanese',
              name: 'Ahmed fathy',
              rate: 1,
              price: 500,
            )),
          ],
        ),
      ],
    ));
  }
}
