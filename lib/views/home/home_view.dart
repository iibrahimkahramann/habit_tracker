import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/components/home/habits_component.dart';
import 'package:habit_tracker/components/home/home_app_bar_component.dart';
import 'package:habit_tracker/components/home/horizontal_calendar.dart';
import 'package:habit_tracker/components/pro/pro_container_component.dart';
import 'package:habit_tracker/providers/calendar/selected_date_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.08,
      ),
      child: Column(
        children: [
          HomeAppBarComponent(width: width, height: height, name: 'İbrahim'),
          SizedBox(height: height * 0.012),
          SingleChildScrollView(
            child: Column(
              children: [
                HorizontalCalendar(
                  selectedDate: ref.watch(selectedDateProvider),
                  onSelected: (date) {
                    ref.read(selectedDateProvider.notifier).setDate(date);
                  },
                ),
                SizedBox(height: height * 0.012),
                ProContainerComponent(
                  height: height,
                  width: width,
                  title: 'More control, more you! 🔥',
                  subtitle: 'Building habits with Premium is now much easier!',
                  onTap: () {},
                ),
                SizedBox(height: height * 0.012),
                HabitsComponent(height: height, width: width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
