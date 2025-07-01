import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism_app/core/component/buttons/custom_text_button.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/component/review_dialog.dart';
import 'package:tourism_app/core/utils/app_icons.dart';
import 'package:tourism_app/core/utils/app_images.dart';
import 'package:tourism_app/core/utils/navigate.dart';
import 'package:tourism_app/features/home/plan/presentation/plan_details_view.dart';
import 'package:tourism_app/features/home/plan/presentation/widgets/plan_gallery.dart';
import 'package:tourism_app/features/home/presentation/home_view.dart';
import 'package:tourism_app/features/home/restaurant/presentation/restaurants_view_body.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('Place Name'),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pyramids',
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
                        'Description',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Lorem Ipsumis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      PlaceInfo(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(AppImages.mapExample),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        'Near By',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      Text(
                        'View All',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index) {
                      return PlaceCard();
                    }),
                  ),
                ),
                const SizedBox(height: 15),
                RestaurantNearbySection(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        'Reviews On This Place',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => ReviewDialog.show(
                          context: context,
                          entityName: 'place',
                          entityId: 1, // Replace with actual place ID
                          entityTitle: 'Pyramids', // Replace with actual place name
                        ),
                        child: SvgPicture.asset(AppIcons.addReview),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
        // Work Time Section
        InfoRow(
          label: 'work time:',
          icon: Icons.access_time,
          content: 'from 6pm to 5:30am',
          contentColor: Colors.black,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.5),
        ),

        // Category Section
        InfoRow(
          label: 'Category:',
          content: 'Archaeological site',
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.5),
        ),

        // Advantages Section
        InfoRow(
          label: 'Advantages:',
          content: 'Suitable for children, families and groups indoor and outdoor yards',
          contentColor: Colors.black,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.5),
        ),

        // Phone Section
        InfoRow(
          label: 'Phone:',
          content: '00222345787',
          contentColor: Colors.black,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String content;
  final IconData? icon;
  final Color contentColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.content,
    this.icon,
    this.contentColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.blue),
          ),
          const SizedBox(width: 4),
          // Icon (Optional)
          if (icon != null) Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 4),
          // Content
          Expanded(
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: contentColor),
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantNearbySection extends StatelessWidget {
  const RestaurantNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title with 'See All' Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Restaurant&Cafe Nearby',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  context.navigateToPage(RestaurantCafeViewBody());
                },
                child: Text(
                  'View All',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        // Horizontal Scroll List
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: 5, // Number of restaurants (replace with dynamic count)
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return NearbyRestaurantCard(
                imageUrl: '',
                name: 'The Plo',
                location: 'Luxor, Egypt',
                rating: 5.0,
              );
            },
          ),
        ),
      ],
    );
  }
}

class NearbyRestaurantCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String location;
  final double rating;

  const NearbyRestaurantCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
  });

  @override
  _NearbyRestaurantCardState createState() => _NearbyRestaurantCardState();
}

class _NearbyRestaurantCardState extends State<NearbyRestaurantCard> {
  bool isFavorite = false; // To track if the restaurant is marked as favorite

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Card width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background image
            CacheImage(
              boxFit: BoxFit.cover,
              imageUrl: widget.imageUrl,
              errorColor: Colors.grey,
            ),

            // Favorite Icon
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; // Toggle favorite state
                  });
                },
              ),
            ),

            // Details (name, location, rating)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                // width: 150,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Restaurant Name
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Location
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 12, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          widget.location,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),

                    // Rating Stars
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 14,
                          color: index < widget.rating ? Colors.amber : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
