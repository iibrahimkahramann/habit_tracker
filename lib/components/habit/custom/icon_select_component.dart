import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/components/habit/custom/icon_picker_bottom_sheet.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/constants/icons.dart';
import 'package:habit_tracker/providers/icon/icon_select_provider.dart';

class IconSelectComponent extends ConsumerWidget {
  const IconSelectComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIcon = ref.watch(iconProvider);
    final iconName = iconNames[selectedIcon] ?? '';

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (context) {
            return const IconPickerBottomSheet();
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
            color: const Color.fromARGB(255, 191, 191, 191),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.015,
          ),
          child: Row(
            children: [
              Text(selectedIcon, style: TextStyle(fontSize: width * 0.08)),
              SizedBox(width: width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    iconName.length > 10
                        ? '${iconName.substring(0, 13)}...'
                        : iconName,
                    style: CustomTheme.textTheme(context).bodyMedium,
                  ),
                  Text(
                    'Icon',
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
