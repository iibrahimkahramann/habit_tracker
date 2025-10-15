import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class ProContainerComponent extends StatelessWidget {
  const ProContainerComponent({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final double height;
  final double width;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.095,
        width: width,
        decoration: CustomTheme.customGradientDecoration(borderRadius: 16),
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
                  width: width * 0.075,
                ),
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTheme.textTheme(
                        context,
                      ).bodyMedium?.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: height * 0.004),
                    Text(
                      subtitle.tr(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: CustomTheme.textTheme(
                        context,
                      ).bodySmall?.copyWith(color: CustomTheme.verysmallcolor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
