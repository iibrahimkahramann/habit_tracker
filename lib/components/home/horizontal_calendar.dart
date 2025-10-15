import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'dart:math' as math;

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    super.key,
    required this.selectedDate,
    required this.onSelected,
    this.daysToShow = 14,
    this.pastDays = 7,
    this.futureDays = 7,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onSelected;
  final int daysToShow;
  final int pastDays;
  final int futureDays;

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final width = size.width;
      final height = size.height;
      final double itemSize = math.min(width, height) * 0.117;
      final double separator = width * 0.025;
      final double targetOffset =
          (itemSize + separator) * widget.pastDays - (width - itemSize) / 2;
      if (_controller.hasClients) {
        final max = _controller.position.maxScrollExtent;
        final clamped = targetOffset.clamp(0.0, max);
        _controller.animateTo(
          clamped,
          duration: const Duration(milliseconds: 1599),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTheme.textTheme(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final double itemSize = math.min(width, height) * 0.11;
    final double separator = width * 0.025;
    final double topPadding = height * 0.015;
    final double bottomPadding = height * 0.001;
    final double betweenLabelAndCircle = height * 0.0;
    final double radius = itemSize * 0.2;
    final double calendarHeight =
        itemSize + betweenLabelAndCircle + (height * 0.016);

    final int totalDays =
        widget.pastDays + widget.futureDays + 1; //  bugunu dahil et

    return SizedBox(
      height: calendarHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: totalDays,
        separatorBuilder: (_, __) => SizedBox(width: separator),
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        itemBuilder: (context, index) {
          final int offset = index - widget.pastDays;
          final date = DateTime.now().add(Duration(days: offset));
          final isSelected = _isSameDay(date, widget.selectedDate);
          final dayLabel = DateFormat('EEE').format(date);
          final dayNumber = DateFormat('d').format(date);

          return GestureDetector(
            onTap: () => widget.onSelected(date),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: itemSize,
                  height: itemSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? CustomTheme.verysmallcolor
                        : CustomTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(
                      color: isSelected
                          ? CustomTheme.primaryColor
                          : CustomTheme.verysmallcolor,
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          dayNumber,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: itemSize * 0.5,
                            height: 1.0,
                            color: isSelected
                                ? CustomTheme.primaryColor
                                : CustomTheme.boldColor,
                          ),
                        ),
                        Text(
                          dayLabel,
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: itemSize * 0.2,
                            height: 1.0,
                            color: isSelected
                                ? CustomTheme.boldColor
                                : CustomTheme.smallcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
