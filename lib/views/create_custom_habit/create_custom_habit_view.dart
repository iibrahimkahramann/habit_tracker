import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/components/habit/custom/icon_and_color_component.dart';
import 'package:habit_tracker/components/habit/custom/textfield_component.dart';
import 'package:habit_tracker/config/bar/detail_bar/detail_nav_bar.dart';

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
    return Scaffold(
      appBar: DetailNavBar(name: 'Create Custom Habit'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TexfieldComponent(
                height: height,
                label: 'HABIT NAME',
                placeholder: 'Enter Habit Name',
              ),
              IconAndColorComponent(height: height, width: width),
            ],
          ),
        ),
      ),
    );
  }
}
