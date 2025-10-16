import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/components/habit/custom/color_picker_bottom_sheet.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/providers/color/color_select_provider.dart';

class ColorSelectComponent extends ConsumerWidget {
  const ColorSelectComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorProvider);
    final colorName = appColorNames[selectedColor] ?? 'Color';

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (context) {
            return const ColorPickerBottomSheet();
          },
        );
      },
      child: Container(
        width: width * 0.43,
        height: height * 0.078,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: width * 0.001,
            color: Color.fromARGB(255, 191, 191, 191),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.015,
          ),
          child: Row(
            children: [
              Container(
                height: height,
                width: width * 0.1,
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(width: width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    colorName.tr(),
                    style: CustomTheme.textTheme(context).bodyMedium,
                  ),
                  Text(
                    'Color'.tr(),
                    style: CustomTheme.textTheme(context).displaySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
