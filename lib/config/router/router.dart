import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/views/home/home_view.dart';
import 'package:habit_tracker/views/splahs/splash_view.dart';

export 'package:go_router/go_router.dart' show GoRouter;
export 'package:flutter/material.dart' show GlobalKey, NavigatorState;

final _rootNavigatorKey = GlobalKey<NavigatorState>();

Page<dynamic> fadeScalePage({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  );
}

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) => NoTransitionPage(child: SplashView()),
    ),
    // GoRoute(
    //   path: '/onboarding',
    //   pageBuilder: (context, state) =>
    //       fadeScalePage(child: OnboardingView(), state: state),
    // ),
    // GoRoute(
    //   path: '/onboarding-two',
    //   pageBuilder: (context, state) =>
    //       fadeScalePage(child: OnboardingTwoView(), state: state),
    // ),
    // GoRoute(
    //   path: '/onboarding-three',
    //   pageBuilder: (context, state) =>
    //       fadeScalePage(child: OnboardingThree(), state: state),
    // ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
          fadeScalePage(child: HomeView(), state: state),
    ),
  ],
);

final GoRouter appRouter = router;
final GlobalKey<NavigatorState> rootNavigatorKey = _rootNavigatorKey;
