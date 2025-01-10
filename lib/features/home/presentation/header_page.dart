import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/component/cache_image.dart';
import 'package:tourism_app/core/component/notification_icon.dart';
import 'package:tourism_app/core/themes/colors.dart';
import 'package:tourism_app/core/utils/constants.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CacheImage(
          imageUrl: 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
          circle: true,
          width: 40,
          height: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi,'.tr(), style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.textColor)),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(Constants.unKnown, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black)),
              ),
            ],
          ),
        ),
        const Spacer(),
        const NotificationIcon(),
      ],
    );
  }
}
