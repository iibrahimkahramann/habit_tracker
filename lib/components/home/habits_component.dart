import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit/habit_container_component.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class HabitsComponent extends StatelessWidget {
  const HabitsComponent({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Habits'.tr(),
              style: CustomTheme.textTheme(context).bodyMedium,
            ),
            ShaderMask(
              shaderCallback: (bounds) =>
                  CustomTheme.primaryGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              blendMode: BlendMode.srcIn,
              child: Text(
                'View All'.tr(),
                style: CustomTheme.textTheme(context).bodyMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.012),
        HabitContainerComponent(height: height, width: width),
      ],
    );
  }
}
