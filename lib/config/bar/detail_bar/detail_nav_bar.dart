import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';

class DetailNavBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailNavBar({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomTheme.backgroundColor,
      title: Text(
        name.tr(),
        style: CustomTheme.textTheme(context).headlineLarge,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: CustomTheme.boldColor),
        onPressed: () => context.go('/home'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
