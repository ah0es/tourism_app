import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardImageTourguide extends StatelessWidget {
  final String image;
  final String name;
  final String language1;
  final String language2;
  final int rate;

  final VoidCallback? onTap;

  const CustomCardImageTourguide(
      {super.key,
      required this.name,
      required this.rate,
      this.onTap,
      required this.image,
      required this.language1,
      required this.language2});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        language1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        language2,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Row(
                        children: [
                          Row(
                            children: List.generate(
                                1,
                                (index) => Icon(
                                      index < rate
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.amber,
                                      size: 16.w,
                                    )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
