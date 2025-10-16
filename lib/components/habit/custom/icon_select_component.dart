import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class IconSelectComponent extends StatelessWidget {
  const IconSelectComponent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.43,
      height: height * 0.078,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: width * 0.001,
          color: const Color.fromARGB(255, 191, 191, 191),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.015,
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/ios_angel.png'),
            SizedBox(width: width * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Walking',
                  style: CustomTheme.textTheme(context).bodyMedium,
                ),
                Text(
                  'Icon',
                  style: CustomTheme.textTheme(context).displaySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
