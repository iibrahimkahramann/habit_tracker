import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class GoalTimesComponent extends StatelessWidget {
  const GoalTimesComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1 Times', style: CustomTheme.textTheme(context).bodyMedium),
            Text(
              'or more per day',
              style: CustomTheme.textTheme(context).displaySmall,
            ),
          ],
        ),
        Container(
          width: width * 0.09,
          height: height * 0.04,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: width * 0.001,
              color: Color.fromARGB(255, 191, 191, 191),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.004),
            child: Image.asset(
              'assets/icons/edit.png',
              width: width * 0.045,
              height: height * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}
