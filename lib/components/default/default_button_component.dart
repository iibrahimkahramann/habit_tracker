import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class DefaultButtonComponent extends StatelessWidget {
  const DefaultButtonComponent({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.text,
  });

  final double width;
  final double height;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height * 0.062,
        decoration: BoxDecoration(
          color: CustomTheme.gradientStart,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text.tr(),
            style: CustomTheme.textTheme(
              context,
            ).bodyMedium?.copyWith(color: CustomTheme.accentColor),
          ),
        ),
      ),
    );
  }
}
