import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class HabitContainerComponent extends StatelessWidget {
  const HabitContainerComponent({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.095,
      width: width,
      decoration: BoxDecoration(
        color: CustomTheme.verysmallcolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: Row(
          children: [
            Container(
              width: width * 0.13,
              height: height * 0.06,
              decoration: BoxDecoration(
                color: const Color.fromARGB(155, 68, 196, 255),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: width * 0.027),
              child: Image.asset(
                'assets/icons/ios_crown.png',
                width: width * 0.07,
              ),
            ),
            SizedBox(width: width * 0.03),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drink the water'.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTheme.textTheme(context).bodyMedium,
                  ),
                  SizedBox(height: height * 0.004),
                  Text(
                    '500/2000 ML'.tr(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: CustomTheme.textTheme(
                      context,
                    ).bodySmall?.copyWith(color: CustomTheme.smallcolor),
                  ),
                ],
              ),
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
