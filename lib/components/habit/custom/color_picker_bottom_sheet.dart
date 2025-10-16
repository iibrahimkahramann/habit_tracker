import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/providers/color/color_select_provider.dart';

class ColorPickerBottomSheet extends ConsumerWidget {
  const ColorPickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorProvider);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: CustomTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select a Color'.tr(),
            style: CustomTheme.textTheme(context).bodyMedium,
          ),
          SizedBox(height: height * 0.02),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: width * 0.03,
              mainAxisSpacing: width * 0.03,
            ),
            itemCount: appColors.length,
            itemBuilder: (context, index) {
              final color = appColors[index];
              final isSelected = color == selectedColor;
              return GestureDetector(
                onTap: () {
                  ref.read(colorProvider.notifier).updateColor(color);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: Colors.black, width: 2)
                        : null,
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: width * 0.06,
                        )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
