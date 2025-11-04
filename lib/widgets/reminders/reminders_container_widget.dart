import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/providers/habit/reminder_provider.dart';

class RemindersContainerWidget extends StatelessWidget {
  const RemindersContainerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.isSwitched,
    required this.ref,
  });

  final double height;
  final double width;
  final bool isSwitched;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('REMINDERS', style: CustomTheme.textTheme(context).bodyMedium),
        SizedBox(height: height * 0.01),
        Container(
          width: width,
          height: height * 0.116,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: width * 0.001,
              color: const Color.fromARGB(255, 191, 191, 191),
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Remember to set off time for a workout today.',
                        style: CustomTheme.textTheme(context).bodyMedium,
                      ),
                    ),
                    CupertinoSwitch(
                      value: isSwitched,
                      onChanged: (value) {
                        ref.read(reminderSwitchProvider.notifier).state = value;
                      },
                      activeTrackColor: Colors.green,
                    ),
                  ],
                ),
                Container(
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
                        Image.asset(
                          'assets/icons/time.png',
                          width: width * 0.055,
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          '09:30',
                          style: CustomTheme.textTheme(context).bodySmall,
                        ),
                        SizedBox(width: width * 0.03),
                        Image.asset(
                          'assets/icons/alarm.png',
                          width: width * 0.055,
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          'Every Day',
                          style: CustomTheme.textTheme(context).bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Container(
          width: width,
          height: height * 0.04,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: width * 0.001,
              color: const Color.fromARGB(255, 191, 191, 191),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'Add Reminder',
              style: CustomTheme.textTheme(context).bodyMedium,
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
      ],
    );
  }
}
