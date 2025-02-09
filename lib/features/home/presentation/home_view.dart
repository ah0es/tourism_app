import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism_app/core/component/buttons/favorite_icon.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/utils/app_icons.dart';
import 'package:tourism_app/core/utils/navigate.dart';
import 'package:tourism_app/features/city/persentaiton/city_details_view.dart';
import 'package:tourism_app/features/city/persentaiton/place_details_view.dart';
import 'package:tourism_app/features/home/plan/presentation/plan_view_body.dart';
import 'package:tourism_app/features/home/plan/presentation/widgets/plane_card.dart';
import 'package:tourism_app/features/home/presentation/widgets/event_list.dart';
import 'package:tourism_app/features/home/presentation/widgets/header_page.dart';

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return PlaceCard();
                  }),
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
  const PlaceCard({
    super.key,
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
                  imageUrl: '',
                  errorColor: Colors.grey,
                ),
                Positioned(
                  bottom: 7,
                  left: 5,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Text(
                        'Egypt,Cairo',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
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
                        'Pyramids',
                        style: Theme.of(context).textTheme.bodyMedium,
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
