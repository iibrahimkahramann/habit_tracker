import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/providers/habit/frequency_provider.dart';

class FrequencyPickerBottomSheet extends ConsumerWidget {
  const FrequencyPickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final frequency = ref.watch(frequencyProvider);

    return Container(
      height: height * 0.4,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FREQUENCY'.tr(),
              style: CustomTheme.textTheme(context).displaySmall,
            ),
            SizedBox(height: height * 0.01),
            Column(
              children: Frequency.values.map((freq) {
                return ListTile(
                  title: Text(freq.name.tr(), selectionColor: Colors.black),
                  trailing: frequency == freq
                      ? const Icon(
                          Icons.check,
                          color: CustomTheme.gradientStart,
                        )
                      : null,
                  onTap: () {
                    ref.read(frequencyProvider.notifier).setFrequency(freq);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
