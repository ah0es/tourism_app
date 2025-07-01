import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism_app/core/component/buttons/custom_text_button.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/component/review_dialog.dart';
import 'package:tourism_app/core/network/end_points.dart';
import 'package:tourism_app/core/utils/app_icons.dart';
import 'package:tourism_app/features/home/data/models/plane_model.dart';
import 'package:tourism_app/features/home/data/models/place_mode.dart';
import 'package:tourism_app/features/home/plan/presentation/widgets/plan_gallery.dart';
import 'package:tourism_app/features/home/presentation/home_view.dart';
import 'package:tourism_app/features/tourguide/presentation/tourguide_details_view.dart';

class PlanDetailsView extends StatelessWidget {
  final PlanModel planModel;

  const PlanDetailsView({
    super.key,
    required this.planModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        CustomTextButton(
          width: MediaQuery.sizeOf(context).width,
          borderRadius: 8,
          onPress: () {},
          child: Text(
            'Book Now - \$${planModel.price ?? 0}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(planModel.name ?? 'Plan Details'),
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CacheImage(
                imageUrl: '${EndPoints.domain} ${planModel.thumbnailUrl ?? ''}',
                height: 200,
                width: double.infinity,
                errorColor: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planModel.name ?? 'Unknown Plan',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.schedule, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('${planModel.days ?? 1} day${(planModel.days ?? 1) > 1 ? 's' : ''}'),
                      const SizedBox(width: 16),
                      Icon(Icons.attach_money, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('\$${planModel.price ?? 0}'),
                      if (planModel.tourGuideName != null) ...[
                        const SizedBox(width: 16),
                        Icon(Icons.person, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            planModel.tourGuideName!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (planModel.description != null && planModel.description!.isNotEmpty) ...[
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      planModel.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (planModel.planPlaces != null && planModel.planPlaces!.isNotEmpty) ...[
                    Row(
                      children: [
                        Text(
                          'Plan Places (${planModel.planPlaces!.length})',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'Visit Order',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    PlanPlacesSection(planPlaces: planModel.planPlaces!),
                    const SizedBox(height: 16),
                  ],
                  ReviewingSection(
                    entityName: 'plan',
                    entityId: planModel.id?.toInt() ?? -1,
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
}

class PlanPlacesSection extends StatelessWidget {
  final List<PlanPlaces> planPlaces;

  const PlanPlacesSection({
    super.key,
    required this.planPlaces,
  });

  @override
  Widget build(BuildContext context) {
    // Sort places by order
    final sortedPlaces = List<PlanPlaces>.from(planPlaces);
    sortedPlaces.sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));

    return Column(
      children: [
        // Places Grid (2 columns)
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: sortedPlaces.length,
          itemBuilder: (context, index) {
            final planPlace = sortedPlaces[index];
            return PlanPlaceCard(
              planPlace: planPlace,
              orderNumber: index + 1,
            );
          },
        ),

        // Expandable Details List
        const SizedBox(height: 16),
        ExpansionTile(
          title: Text(
            'Detailed Itinerary',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          children: sortedPlaces.map((planPlace) {
            return PlanPlaceDetailTile(planPlace: planPlace);
          }).toList(),
        ),
      ],
    );
  }
}

class PlanPlaceCard extends StatelessWidget {
  final PlanPlaces planPlace;
  final int orderNumber;

  const PlanPlaceCard({
    super.key,
    required this.planPlace,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    // Convert PlanPlaces to PlaceModel for PlaceCard compatibility
    final placeModel = PlaceModel(
      id: planPlace.placeId?.toInt(),
      name: planPlace.placeName,
      thumbnailUrl: planPlace.thumbnailUrl,
    );

    return Stack(
      children: [
        PlaceCard(
          placeModel: placeModel,
          isHorizontalScroll: false,
        ),
        // Order number badge
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$orderNumber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Duration badge (if available)
        if (planPlace.duration != null && planPlace.duration!.isNotEmpty)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                planPlace.duration!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class PlanPlaceDetailTile extends StatelessWidget {
  final PlanPlaces planPlace;

  const PlanPlaceDetailTile({
    super.key,
    required this.planPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Order indicator
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${planPlace.order ?? 0}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planPlace.placeName ?? 'Unknown Place',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (planPlace.duration != null)
                      Text(
                        'Duration: ${planPlace.duration}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                  ],
                ),
              ),
              if (planPlace.specialPrice != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '\$${planPlace.specialPrice}',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          if (planPlace.additionalDescription != null && planPlace.additionalDescription!.isNotEmpty) ...[
            SizedBox(height: 8),
            Text(
              planPlace.additionalDescription!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ],
      ),
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
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
