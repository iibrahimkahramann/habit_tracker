import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit/ready_habit_container_component.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/widgets/habit/create_custom_habits_button_container.dart';

class AddHabitBottomSheet extends StatelessWidget {
  const AddHabitBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              'NEW GOOD HABIT'.tr(),
              style: CustomTheme.textTheme(context).displaySmall,
            ),
            SizedBox(height: height * 0.01),
            CreateCustomHabitsButtonContainer(width: width, height: height),
            SizedBox(height: height * 0.01),
            Text(
              'NEW GOOD HABIT'.tr(),
              style: CustomTheme.textTheme(context).displaySmall,
            ),
            SizedBox(height: height * 0.01),
            SizedBox(
              height:
                  height * 0.13, // Adjust height to fit the list view content
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ReadyHabitContainerComponent(
                    width: width,
                    height: height,
                    color: const Color.fromARGB(255, 106, 184, 247),
                    title: 'Walk',
                    sub: '10 KM',
                    image: Image.asset('assets/icons/ios_angel.png'),
                  ),
                  SizedBox(width: width * 0.03),
                  ReadyHabitContainerComponent(
                    width: width,
                    height: height,
                    color: const Color.fromARGB(255, 143, 241, 15),
                    title: 'Walk',
                    sub: '10 KM',
                    image: Image.asset('assets/icons/ios_fire.png'),
                  ),
                  SizedBox(width: width * 0.03),
                  ReadyHabitContainerComponent(
                    width: width,
                    height: height,
                    color: const Color.fromARGB(255, 3, 163, 104),
                    title: 'Walk',
                    sub: '10 KM',
                    image: Image.asset('assets/icons/ios_crown.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
