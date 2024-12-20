import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardImageTourguide extends StatefulWidget {
  final String image;
  final String name;
  final String language1;
  final String language2;
  final double rate;
  final double price;

  final VoidCallback? onTap;

  const CustomCardImageTourguide({
    super.key,
    required this.name,
    required this.rate,
    this.onTap,
    required this.image,
    required this.language1,
    required this.language2,
    required this.price,
  });

  @override
  _CustomCardImageTourguideState createState() =>
      _CustomCardImageTourguideState();
}

class _CustomCardImageTourguideState extends State<CustomCardImageTourguide> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.image,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                    },
                    child: Icon(
                      isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavourite ? Colors.red : Colors.black,
                      size: 24.sp,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1.h,
                  right: 1.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "${widget.price.toStringAsFixed(0)} EGP/Hr",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.grey,
                        size: 16.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        "${widget.language1}, ${widget.language2}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        widget.rate.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
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
