import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.012,
      ),
      decoration: BoxDecoration(
        color: CustomTheme.verysmallcolor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        labelStyle: CustomTheme.textTheme(context).bodyMedium,
        unselectedLabelStyle: CustomTheme.textTheme(context).bodySmall,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: CustomTheme.primaryGradient,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: CustomTheme.boldColor,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(text: 'Weekly'),
          Tab(text: 'Monthly'),
          Tab(text: 'Yearly'),
        ],
      ),
    );
  }
}
