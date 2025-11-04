import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/components/habit/custom/frequency_picker_bottom_sheet.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/providers/habit/frequency_provider.dart';

class GoalDailyComponent extends ConsumerWidget {
  const GoalDailyComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frequency = ref.watch(frequencyProvider);

    String frequencyText = 'Daily';
    String frequencyDetailText = 'Every day';
    switch (frequency) {
      case Frequency.daily:
        frequencyText = 'Daily';
        frequencyDetailText = 'Every day';
        break;
      case Frequency.weekly:
        frequencyText = 'Weekly';
        frequencyDetailText = 'Once a week';
        break;
      case Frequency.monthly:
        frequencyText = 'Monthly';
        frequencyDetailText = 'Once a month';
        break;
    }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const FrequencyPickerBottomSheet();
          },
        );
      },
      child: Container(
        width: width,
        height: height * 0.035,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomTheme.accentColor2,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Row(
            children: [
              Image.asset('assets/icons/clockwise.png', width: width * 0.055),
              SizedBox(width: width * 0.01),
              Text(
                frequencyText,
                style: CustomTheme.textTheme(context).bodySmall,
              ),
              SizedBox(width: width * 0.03),
              Image.asset('assets/icons/paper.png', width: width * 0.055),
              SizedBox(width: width * 0.01),
              Text(
                frequencyDetailText,
                style: CustomTheme.textTheme(context).bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
