import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/config/functions/app_tracking.dart';
import 'package:habit_tracker/config/router/router.dart' as app_router;
import 'package:habit_tracker/config/theme/custom_theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Future<void> _configureRcsdk() async {
  //   print("Configure Rcsdk *************");
  //   await Purchases.setLogLevel(LogLevel.debug);
  //   PurchasesConfiguration? configuration;

  //   if (Platform.isAndroid) {
  //     configuration = PurchasesConfiguration(
  //       "goog_VfjtToCSVCuJIkTdlrjbZxEvRIv",
  //     );
  //   } else if (Platform.isIOS) {
  //     configuration = PurchasesConfiguration(
  //       "appl_ZfKfSKGHyMdRJyhgnOKLslDMEWT",
  //     );
  //   }
  //   await Purchases.configure(configuration!);

  // if (configuration != null) {
  //   await Purchases.configure(configuration);

  //   final paywallResult = await RevenueCatUI.presentPaywallIfNeeded("pro");
  //   print("paywall result: $paywallResult");
  // }
  // }

  // await _configureRcsdk();

  await EasyLocalization.ensureInitialized();
  Intl.defaultLocale = 'en';
  await initializeDateFormatting('en');
  runApp(
    // EasyLocalization(
    //   supportedLocales: const [
    //     Locale('en', ''),
    //     Locale('tr', ''),
    //     Locale('fr', ''),
    //     Locale('it', ''),
    //     Locale('pt', ''),
    //     Locale('es', ''),
    //     Locale('de', ''),
    //     Locale('ru', ''),
    //     Locale('ko', ''),
    //     Locale('ja', ''),
    //   ],
    //   path: 'assets/lang',
    //   fallbackLocale: const Locale('en', ''),
    //   useOnlyLangCode: true,
    //   child:
    ProviderScope(child: MyApp()),
    // ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  final bool _appIsReady = true;

  @override
  void initState() {
    super.initState();
    // setupRevenueCatListener(ref);
    Platform.isIOS ? appTracking() : nottrack();
  }

  @override
  Widget build(BuildContext context) {
    if (!_appIsReady) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp.router(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.themeData(context),
      routerConfig: app_router.router,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
    );
  }

  // void setupRevenueCatListener(WidgetRef ref) {
  //   Purchases.addCustomerInfoUpdateListener((customerInfo) async {
  //     final entitlement = customerInfo.entitlements.all["premium"];
  //     ref
  //         .read(isPremiumProvider.notifier)
  //         .updatePremiumStatus(entitlement?.isActive ?? false);
  //     print("Riverpod ile abone kontrolü: ${entitlement?.isActive ?? false}");
  //   });
  // }
}
