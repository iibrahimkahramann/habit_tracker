import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds: 2), () async {
      // final prefs = await SharedPreferences.getInstance();
      // final onboardingSeen = prefs.getBool('onboardingSeen') ?? false;
      // if (onboardingSeen) {
      // ignore: use_build_context_synchronously
      context.go('/home');
      // } else {
      //   context.go('/onboarding');
      // }
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash.png', fit: BoxFit.cover),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/app.png', width: width * 0.3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
