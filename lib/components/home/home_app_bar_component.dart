import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/home/add_habit_bottom_sheet.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class HomeAppBarComponent extends StatelessWidget {
  const HomeAppBarComponent({
    super.key,
    required this.width,
    required this.height,
    required this.name,
  });

  final double width;
  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi, $name'.tr(),
                  style: CustomTheme.textTheme(context).headlineLarge,
                ),
                SizedBox(width: width * 0.03),
                Image.asset('assets/icons/ios_hand.png', width: width * 0.07),
              ],
            ),
            SizedBox(width: width * 0.02),
            Text(
              'Let’s make habits together!'.tr(),
              style: CustomTheme.textTheme(
                context,
              ).headlineSmall?.copyWith(color: CustomTheme.smallcolor),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return const AddHabitBottomSheet();
              },
            );
          },
          child: Container(
            width: width * 0.14,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: CustomTheme.verysmallcolor,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return CustomTheme.primaryGradient.createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: Icon(
                CupertinoIcons.add_circled_solid,
                color: Colors.white,
                size: width * 0.07,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
