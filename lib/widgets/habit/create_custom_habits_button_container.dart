import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class CreateCustomHabitsButtonContainer extends StatelessWidget {
  const CreateCustomHabitsButtonContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.095,
      decoration: BoxDecoration(
        color: CustomTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: width * 0.001,
          color: const Color.fromARGB(255, 191, 191, 191),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create Custom Habit',
              style: CustomTheme.textTheme(context).bodyMedium,
            ),
            Container(
              width: width * 0.12,
              height: height * 0.055,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: width * 0.001,
                  color: const Color.fromARGB(255, 191, 191, 191),
                ),
              ),
              child: Icon(Icons.add, color: Colors.black, size: height * 0.035),
            ),
          ],
        ),
      ),
    );
  }
}
