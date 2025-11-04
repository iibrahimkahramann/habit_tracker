import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/components/default/default_button_component.dart';
import 'package:habit_tracker/components/habit/custom/icon_and_color_component.dart';
import 'package:habit_tracker/components/habit/custom/textfield_component.dart';
import 'package:habit_tracker/config/bar/detail_bar/detail_nav_bar.dart';
import 'package:habit_tracker/providers/habit/reminder_provider.dart';
import 'package:habit_tracker/widgets/habit/goal_container_widget.dart';
import 'package:habit_tracker/widgets/reminders/reminders_container_widget.dart';

class CreateCustomHabitView extends ConsumerStatefulWidget {
  const CreateCustomHabitView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateCustomHabitViewState();
}

class _CreateCustomHabitViewState extends ConsumerState<CreateCustomHabitView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isSwitched = ref.watch(reminderSwitchProvider);

    return Scaffold(
      appBar: DetailNavBar(name: 'Create Custom Habit'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TexfieldComponent(
                        height: height,
                        label: 'HABIT NAME',
                        placeholder: 'Enter Habit Name',
                      ),
                      IconAndColorComponent(height: height, width: width),
                      GoalContainerWidget(height: height, width: width),
                      RemindersContainerWidget(
                        height: height,
                        width: width,
                        isSwitched: isSwitched,
                        ref: ref,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: height * 0.04,
                top: height * 0.01,
              ),
              child: DefaultButtonComponent(
                width: width,
                height: height,
                onTap: () {},
                text: 'Add Habit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
