import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourism_app/core/themes/colors.dart';

class CustomCardImageHotels extends StatefulWidget {
  final String image;
  final String name;
  final String governorate;
  final String country;
  final double rate;
  final IconData iconData;
  final double price;
  final VoidCallback? onTap;

  const CustomCardImageHotels({
    super.key,
    required this.name,
    required this.governorate,
    required this.country,
    required this.rate,
    required this.iconData,
    this.onTap,
    required this.image,
    required this.price,
  });

  @override
  State<CustomCardImageHotels> createState() => _CustomCardImageHotelsState();
}

class _CustomCardImageHotelsState extends State<CustomCardImageHotels> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    widget.image,
                    height: 200.h,
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
                          widget.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  index < widget.rate
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 16.w,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.rate.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(
                              widget.iconData,
                              color: Colors.grey,
                              size: 20.w,
                            ),
                            SizedBox(width: 3),
                            Text(
                              widget.governorate,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              ', ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              widget.country,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Starting from ',
                                style: TextStyle(
                                  color: AppColors.appTextColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.price}\$',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; 
                  });
                },
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border, 
                  color:
                      isFavorite ? Colors.red : Colors.grey, 
                  size: 26.w, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
