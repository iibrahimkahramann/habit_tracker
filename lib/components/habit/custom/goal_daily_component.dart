import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class GoalDailyComponent extends StatelessWidget {
  const GoalDailyComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.035,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CustomTheme.accentColor2,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.04),
        child: Row(
          children: [
            Image.asset('assets/icons/clockwise.png', width: width * 0.055),
            SizedBox(width: width * 0.01),
            Text('Daily', style: CustomTheme.textTheme(context).bodySmall),
            SizedBox(width: width * 0.03),
            Image.asset('assets/icons/paper.png', width: width * 0.055),
            SizedBox(width: width * 0.01),
            Text('Every day', style: CustomTheme.textTheme(context).bodySmall),
          ],
        ),
      ),
    );
  }
}
