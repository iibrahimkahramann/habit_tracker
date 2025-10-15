import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:habit_tracker/providers/navigation/nav_bar_provider.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navBarProvider);
    final width = MediaQuery.of(context).size.width;

    void onTap(int index) {
      ref.read(navBarProvider.notifier).setIndex(index);
      switch (index) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/activity');
          break;
        case 2:
          context.go('/settings');
          break;
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: SnakeNavigationBar.gradient(
        height: width * 0.14,

        backgroundGradient: const LinearGradient(
          colors: [CustomTheme.verysmallcolor, CustomTheme.verysmallcolor],
        ),
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        currentIndex: selectedIndex,
        onTap: onTap,
        snakeViewGradient: CustomTheme.primaryGradient,
        selectedItemGradient: const LinearGradient(
          colors: [CustomTheme.verysmallcolor, CustomTheme.verysmallcolor],
        ),
        unselectedItemGradient: CustomTheme.primaryGradient,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/home_icon.png')),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/activity_icon.png')),
            label: 'activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
