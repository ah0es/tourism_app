import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CacheImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final bool circle;
  final bool? profileImage;
  final String imageUrl;

  const CacheImage({
    super.key,
    this.width,
    this.height,
    this.boxFit,
    this.circle = false,
    this.profileImage = true,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: circle ? Clip.antiAlias : Clip.none,
      child: !imageUrl.contains('.svg')
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              fit: boxFit ?? BoxFit.cover,
              errorWidget: (context, url, error) => const Center(
                // child: profileImage!
                //     ? SvgPicture.asset(
                //         AppIcons.noImageProfile,
                //         width: width,
                //         height: height,
                //         fit: boxFit ?? BoxFit.cover,
                //       )
                //     : Image.asset(
                //         AppImages.projectsTemporary,
                //         width: width,
                //         height: height,
                //         fit: boxFit ?? BoxFit.cover,
                //       ),
              ),
            )
          : SvgPicture.network(
              imageUrl,
              width: 30,
              height: 30,
              fit: boxFit ?? BoxFit.cover,
              placeholderBuilder: (BuildContext context) => SizedBox(
                width: width ?? 30,
                height: height ?? 30,
                child: const Icon(
                  Icons.error,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }
}
