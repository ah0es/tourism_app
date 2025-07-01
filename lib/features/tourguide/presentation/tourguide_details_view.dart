import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/component/app_bar_sharred.dart';
import 'package:tourism_app/core/component/buttons/custom_text_button.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/component/review_dialog.dart';
import 'package:tourism_app/core/network/end_points.dart';
import 'package:tourism_app/features/home/data/models/review_model.dart';
import 'package:tourism_app/features/home/data/models/tourguid_model.dart';
import 'package:tourism_app/features/home/manager/reviews/cubit/reviews_cubit.dart';

class TourGuideDetailsView extends StatefulWidget {
  final TourGuidModel tourGuide;

  const TourGuideDetailsView({
    super.key,
    required this.tourGuide,
  });

  @override
  State<TourGuideDetailsView> createState() => _TourGuideDetailsViewState();
}

class _TourGuideDetailsViewState extends State<TourGuideDetailsView> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.tourGuide.isFavorited ?? false;

    // Load reviews for this tour guide
    if (widget.tourGuide.id != null) {
      ReviewsCubit.of(context).getReviews(
        context: context,
        entityName: 'tourguide',
        entityId: widget.tourGuide.id!.toInt(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shareAppBar(
        context,
        nameAppBar: '${widget.tourGuide.firstName ?? ''} ${widget.tourGuide.lastName ?? ''}'.trim(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  // Profile Image
                  CacheImage(
                    imageUrl: widget.tourGuide.profilePictureUrl != null ? '${EndPoints.domain}${widget.tourGuide.profilePictureUrl}' : '',
                    errorColor: Colors.grey[300]!,
                    width: double.infinity,
                    height: 300,
                    boxFit: BoxFit.cover,
                  ),

                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),

                  // Profile Info Overlay
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${widget.tourGuide.firstName ?? ''} ${widget.tourGuide.lastName ?? ''}'.trim(),
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorited = !isFavorited;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isFavorited ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorited ? Colors.red : Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              widget.tourGuide.city ?? 'Unknown City',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(width: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text(
                              widget.tourGuide.stars?.toStringAsFixed(1) ?? '0.0',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Availability Badge
                  if (widget.tourGuide.isAvailable == true)
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Available',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Details Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Info Cards
                  Row(
                    children: [
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.work_outline,
                          title: 'Experience',
                          value: '${widget.tourGuide.yearsOfExperience ?? 0} years',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.attach_money,
                          title: 'Hourly Rate',
                          value: '\$${widget.tourGuide.hourlyRate ?? 0}/hr',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Languages Section
                  if (widget.tourGuide.languages != null && widget.tourGuide.languages!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Languages',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: widget.tourGuide.languages!.map((language) {
                            return Chip(
                              label: Text(
                                language,
                                style: TextStyle(fontSize: 12),
                              ),
                              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),

                  // Bio Section
                  if (widget.tourGuide.bio != null && widget.tourGuide.bio!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.tourGuide.bio!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                              ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),

                  // Reviews Section
                  Row(
                    children: [
                      Text(
                        'Reviews',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => ReviewDialog.show(
                          context: context,
                          entityName: 'tourguide',
                          entityId: widget.tourGuide.id!.toInt(),
                          entityTitle: '${widget.tourGuide.firstName ?? ''} ${widget.tourGuide.lastName ?? ''}'.trim(),
                          onReviewSubmitted: () async {
                            await ReviewsCubit.of(context).getReviews(
                              context: context,
                              entityName: 'tourguide',
                              entityId: widget.tourGuide.id!.toInt(),
                            );
                          },
                        ),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Add Review',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // Reviews List
                  BlocBuilder<ReviewsCubit, ReviewsState>(
                    builder: (context, state) {
                      if (state is ReviewsLoading) {
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is ReviewsGetError) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red[200]!),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Error loading reviews',
                                style: TextStyle(color: Colors.red[700]),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  if (widget.tourGuide.id != null) {
                                    ReviewsCubit.of(context).getReviews(
                                      context: context,
                                      entityName: 'tourguide',
                                      entityId: widget.tourGuide.id!.toInt(),
                                    );
                                  }
                                },
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      } else if (state is ReviewsGetSuccess) {
                        final reviews = state.reviews;
                        final reviewCount = reviews.data?.length ?? 0;
                        final averageRating = ReviewsCubit.of(context).averageRating;

                        if (reviewCount == 0) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'No reviews yet. Be the first to leave a review!',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          );
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Reviews Summary
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '${averageRating.toStringAsFixed(1)} ($reviewCount review${reviewCount > 1 ? 's' : ''})',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),

                            // Reviews List
                            ...reviews.data!.map((review) => _ReviewCard(review: review)),
                          ],
                        );
                      }

                      return Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'No reviews yet. Be the first to leave a review!',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 100), // Space for bottom button
                ],
              ),
            ),
          ],
        ),
      ),

      // Book Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: CustomTextButton(
          width: double.infinity,
          onPress: () {},
          child: Text(
            'Book Now - \$${widget.tourGuide.hourlyRate ?? 0}/hr',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final ReviewData review;

  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // User Profile Picture
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: review.profilePictureUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CacheImage(
                          imageUrl: '${EndPoints.domain}${review.profilePictureUrl}',
                          width: 40,
                          height: 40,
                          boxFit: BoxFit.cover,
                          errorColor: Colors.grey[300]!,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        color: Colors.grey[600],
                        size: 24,
                      ),
              ),
              SizedBox(width: 12),

              // User Name and Rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName ?? 'Anonymous',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 16,
                            color: index < (review.rating ?? 0) ? Colors.amber : Colors.grey[300],
                          );
                        }),
                        SizedBox(width: 8),
                        Text(
                          '${review.rating ?? 0}/5',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Date
              Text(
                review.createdAt != null ? _formatDate(review.createdAt!) : '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[500],
                    ),
              ),
            ],
          ),
          if (review.comment != null && review.comment!.isNotEmpty) ...[
            SizedBox(height: 12),
            Text(
              review.comment!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.4,
                  ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return dateString;
    }
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
