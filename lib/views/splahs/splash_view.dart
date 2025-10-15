import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      // final prefs = await SharedPreferences.getInstance();
      // final onboardingSeen = prefs.getBool('onboardingSeen') ?? false;
      if (!mounted) return;
      context.go('/home');
      // else {
      //   context.go('/onboarding');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
