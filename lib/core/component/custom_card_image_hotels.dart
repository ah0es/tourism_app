import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardImageHotels extends StatelessWidget {
  final String image;
  final String name;
  final String governorate;
  final String country;
  final int rate;
  final IconData iconData;
  final int price;
  final VoidCallback? onTap;

  const CustomCardImageHotels(
      {super.key,
      required this.name,
      required this.governorate,
      required this.country,
      required this.rate,
      required this.iconData,
      this.onTap,
      required this.image,
      required this.price});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                image,
                height: 200.h,
                // width: 20.w,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    index < rate
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 16.w,
                                  )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          iconData,
                          color: Colors.grey,
                          size: 20.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          iconData,
                          color: Colors.grey,
                          size: 20.w,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          governorate,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          country,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Starting from $price \$',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
