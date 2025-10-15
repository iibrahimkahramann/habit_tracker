import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/components/habit/habit_container_component.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class HabitContainerController extends StatelessWidget {
  const HabitContainerController({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3,
        children: [
          CustomSlidableAction(
            onPressed: (context) {},
            child: Container(
              width: height * 0.095,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomTheme.verysmallcolor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return CustomTheme.primaryGradient.createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      size: width * 0.05,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    'Show',
                    style: CustomTheme.textTheme(
                      context,
                    ).bodyMedium?.copyWith(color: CustomTheme.smallcolor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3,
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          CustomSlidableAction(
            onPressed: (context) {},
            child: Container(
              width: height * 0.095,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomTheme.verysmallcolor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/ios_close.png',
                    width: width * 0.03,
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'Fail',
                    style: CustomTheme.textTheme(
                      context,
                    ).bodyMedium?.copyWith(color: CustomTheme.smallcolor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      child: HabitContainerComponent(height: height, width: width),
    );
  }
}
