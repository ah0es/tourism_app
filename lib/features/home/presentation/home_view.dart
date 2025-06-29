import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism_app/core/component/buttons/favorite_icon.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/utils/app_icons.dart';
import 'package:tourism_app/core/utils/navigate.dart';
import 'package:tourism_app/features/city/persentaiton/city_details_view.dart';
import 'package:tourism_app/features/city/persentaiton/place_details_view.dart';
import 'package:tourism_app/features/home/data/models/place_mode.dart';
import 'package:tourism_app/features/home/data/models/plane_model.dart';
import 'package:tourism_app/features/home/manager/places/cubit/place_cubit.dart';
import 'package:tourism_app/features/home/plan/presentation/plan_view_body.dart';
import 'package:tourism_app/features/home/plan/presentation/widgets/plane_card.dart';
import 'package:tourism_app/features/home/presentation/widgets/event_list.dart';
import 'package:tourism_app/features/home/presentation/widgets/header_page.dart';
import 'package:tourism_app/features/home/presentation/widgets/place_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Initialize places data when the page loads
    PlaceCubit.of(context).getPlaces(context: context);
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              //   child: CategoryList(),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Popular',
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
              PlaceSection(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Cites',
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
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: List.generate(10, (index) {
                      return CityCard();
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      'Plans',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => context.navigateToPage(PlanViewBody()),
                      child: Text(
                        'View All',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: List.generate(5, (index) {
                      return PlanCardHorizontal();
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => context.navigateToPage(CityDetailsView()),
            child: CacheImage(
              height: 130,
              width: 300,
              imageUrl: '',
              errorColor: Colors.grey,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              'Egypt',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final PlaceModel? placeModel;

  const PlaceCard({
    super.key,
    this.placeModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateToPage(PlaceDetailsView()),
      child: Container(
        width: 150,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(10),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CacheImage(
                  height: 150,
                  width: 130,
                  imageUrl: placeModel?.thumbnailUrl ?? placeModel?.thumbnail ?? '',
                  errorColor: Colors.grey,
                ),
                Positioned(
                  bottom: 7,
                  left: 5,
                  right: 5,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          placeModel != null ? '${placeModel!.country ?? ''}, ${placeModel!.city ?? ''}' : 'Egypt,Cairo',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        placeModel?.name ?? 'Pyramids',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SvgPicture.asset(AppIcons.starList),
                    ],
                  ),
                ),
                FavoriteIcon()
              ],
            )
          ],
        ),
      ),
    );
  }
}
