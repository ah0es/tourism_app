import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism_app/core/component/buttons/custom_text_button.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/component/custom_text_form_field.dart';
import 'package:tourism_app/core/utils/app_icons.dart';
import 'package:tourism_app/features/home/plan/presentation/widgets/plan_gallery.dart';

class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        CustomTextButton(
            width: MediaQuery.sizeOf(context).width,
            borderRadius: 8,
            onPress: () {},
            child: Text(
              'Book Now',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
            )),
      ],
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('1 Day Plan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: PlanGallery(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Egypt Through The Ages',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('Giza, Egypt'),
                      const SizedBox(width: 16),
                      Icon(Icons.star, color: Colors.yellow[700]),
                      const SizedBox(width: 4),
                      Text('5.0'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discover the wonders of ancient Egyptian civilization with an exciting day trip to the Pyramids of Giza. This journey offers the chance to marvel at the Great Pyramid of Khufu and the Sphinx.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tour Duration',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text('10:30 Hours (Starting At 8:00 AM, Ending At 6:30 PM)'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Plan Stations',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  PlanSections(),
                  const SizedBox(height: 8),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Reviews On This Plan',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(onTap: () => showReviewDialog(context), child: SvgPicture.asset(AppIcons.addReview))
                    ],
                  ),
                  const SizedBox(height: 8),
                  ReviewCard(
                    reviewerName: "Marwa Ahmed",
                    rating: 5.0,
                    date: "1 day ago",
                    reviewText:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
                    imageUrl: 'https://via.placeholder.com/150', // Example image URL
                  ),
                  const SizedBox(height: 8),
                  ReviewCard(
                    reviewerName: "John Doe",
                    rating: 4.5,
                    date: "3 days ago",
                    reviewText: "A great tour with insightful guides and spectacular sites. I really enjoyed the Pyramids!",
                    imageUrl: 'https://via.placeholder.com/150', // Example image URL
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showReviewDialog(BuildContext context) {
    double rating = 3.0; // Initial rating value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Write a Review'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Score:'),
                  const SizedBox(height: 8),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rating = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                      contentPadding: EdgeInsets.all(5),
                      maxLines: 6,
                      outPadding: EdgeInsets.zero,
                      controller: TextEditingController(),
                      hintText: 'Review')
                ],
              ),
              actions: <Widget>[
                CustomTextButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Post',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                    ))
              ],
            );
          },
        );
      },
    );
  }




}

class PlanSections extends StatelessWidget {
  const PlanSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlanStationTile(
          title: '1 - The Giza Pyramids and the Great Sphinx',
          time: '8:00 AM - 11:00 AM',
          description: 'Start your day early and head straight to the Giza Plateau, about 30 minutes from Central Cairo.',
          activities: ['Visit the Great Pyramid of Khufu', 'Marvel at the Great Sphinx', 'Explore the Pyramid of Khafre'],
          imageUrl: '',
        ),
        PlanStationTile(
          title: '2 - Egyptian Museum Visit',
          time: '12:00 PM - 2:00 PM',
          description: 'Explore the treasures of the Egyptian Museum, including the famous Tutankhamun exhibit.',
          activities: ['Admire the Tutankhamun artifacts', 'Explore the ancient statues', 'Visit the mummies section'],
          imageUrl: '',
        ),
        PlanStationTile(
          title: '3 - Lunch by the Nile',
          time: '2:30 PM - 4:00 PM',
          description: 'Enjoy a relaxing lunch by the Nile River at one of the local restaurants.',
          activities: ['Enjoy traditional Egyptian cuisine', 'Relax with a view of the Nile', 'Take a short Nile boat ride'],
          imageUrl: '',
        ),
      ],
    );
  }
}

class PlanStationTile extends StatelessWidget {
  final String title;
  final String time;
  final String description;
  final List<String> activities;
  final String imageUrl;

  const PlanStationTile({
    super.key,
    required this.title,
    required this.time,
    required this.description,
    required this.activities,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        '$title ($time)',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                'What to see:',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                children: activities.map((activity) {
                  return Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.all(3),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          activity,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 5),
              CacheImage(
                imageUrl: imageUrl,
                errorColor: Colors.grey,
                height: 170,
                width: MediaQuery.sizeOf(context).width,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final double rating;
  final String date;
  final String reviewText;
  final String imageUrl;

  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.rating,
    required this.date,
    required this.reviewText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CacheImage(
              circle: true,
              imageUrl: imageUrl,
              errorColor: Colors.grey,
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        reviewerName,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700], size: 16),
                          const SizedBox(width: 4),
                          Text(rating.toString()),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    reviewText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
