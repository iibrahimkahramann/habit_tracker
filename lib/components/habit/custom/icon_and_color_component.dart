import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit/custom/color_select_component.dart';
import 'package:habit_tracker/components/habit/custom/icon_select_component.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class IconAndColorComponent extends StatelessWidget {
  const IconAndColorComponent({
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
        Text(
          'ICON AND COLOR'.tr(),
          style: CustomTheme.textTheme(context).bodyMedium,
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconSelectComponent(width: width, height: height),
            ColorSelectComponent(width: width, height: height),
          ],
        ),
      ],
    );
  }
}
