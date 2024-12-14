import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tourism_app/core/component/buttons/arrow_back_button.dart';
import 'package:tourism_app/core/themes/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Container(
          color: AppColors.backgroundColor,
          child: Row(
            children: [
              const ArrowBackButton(
                borderColor: Colors.black,
                iconColor: Colors.black,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 10),
              Center(
                child: Text(
                  title.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
