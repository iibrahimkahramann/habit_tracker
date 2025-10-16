import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class ReadyHabitContainerComponent extends StatelessWidget {
  const ReadyHabitContainerComponent({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.title,
    required this.sub,
    required this.image,
  });

  final double width;
  final double height;
  final Color color;
  final String title;
  final String sub;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.3,
      height: height * 0.125,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: width * 0.04,
          top: height * 0.015,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.11,
              height: height * 0.047,
              decoration: BoxDecoration(
                color: CustomTheme.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: height * 0.01),
                child: image,
              ),
            ),
            SizedBox(height: height * 0.005),
            Text(title.tr(), style: CustomTheme.textTheme(context).bodyMedium),
            SizedBox(height: height * 0.001),
            Text(
              sub.tr(),
              style: CustomTheme.textTheme(
                context,
              ).bodySmall?.copyWith(fontSize: height * 0.014),
            ),
          ],
        ),
      ),
    );
  }
}
