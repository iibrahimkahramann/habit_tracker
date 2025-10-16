import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class TexfieldComponent extends StatelessWidget {
  const TexfieldComponent({
    super.key,
    required this.height,
    required this.label,
    required this.placeholder,
  });

  final double height;
  final String label;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.tr(), style: CustomTheme.textTheme(context).bodyMedium),
        SizedBox(height: height * 0.01),
        CupertinoTextField(
          placeholder: placeholder.tr(),
          placeholderStyle: CustomTheme.textTheme(
            context,
          ).displayMedium?.copyWith(color: CustomTheme.smallcolor),
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          style: CustomTheme.textTheme(context).displayMedium,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: CustomTheme.primaryColor, width: 0.2),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
