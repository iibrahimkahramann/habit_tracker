import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit/custom/goal_daily_component.dart';
import 'package:habit_tracker/components/habit/custom/goal_times_component.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class GoalContainerWidget extends StatelessWidget {
  const GoalContainerWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('GOAL', style: CustomTheme.textTheme(context).bodyMedium),
        SizedBox(height: height * 0.01),
        Container(
          width: width,
          height: height * 0.116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: width * 0.001,
              color: Color.fromARGB(255, 191, 191, 191),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.013,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoalTimesComponent(width: width, height: height),
                GoalDailyComponent(width: width, height: height),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
