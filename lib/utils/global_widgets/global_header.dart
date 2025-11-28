import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/font.dart';

class GlobalHeader extends StatelessWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onBackTap;
  final List<Widget>? rightWidgets;
  final bool useSpaceBetween;

  const GlobalHeader({
    super.key,
    required this.title,
    this.showBack = true,
    this.onBackTap,
    this.rightWidgets,
    this.useSpaceBetween = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget left = showBack
        ? GestureDetector(
            onTap: onBackTap ?? () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColors.fontcolor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.fontcolor,
                size: 24,
              ),
            ),
          )
        : SizedBox(width: 40);

    Widget titleWidget = Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: AppFonts.primaryFont,
          fontWeight: FontWeight.w800,
          fontSize: 32,
          color: AppColors.fontcolor,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );

    Widget right = Row(
      mainAxisSize: MainAxisSize.min,
      children: rightWidgets ?? [SizedBox(width: 40)],
    );

    if (useSpaceBetween) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [left, titleWidget],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [left, titleWidget, Spacer(), right]),
      );
    }
  }
}
