import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/widgets/tabbar/tabbar_widget.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomTheme.backgroundColor,
          centerTitle: false,
          titleSpacing: width * 0.05,
          title: Text(
            'Activity',
            style: CustomTheme.textTheme(context).headlineLarge,
          ),
          bottom: TabBarWidget(width: width, height: height),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Weekly Content')),
            Center(child: Text('Monthly Content')),
            Center(child: Text('Yearly Content')),
          ],
        ),
      ),
    );
  }
}
