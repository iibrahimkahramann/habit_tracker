import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      navigationBarTheme: navigationBarThemeData(),
      textTheme: textTheme(context),
    );
  }

  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Color.fromARGB(255, 28, 28, 29);
  static const Color accentColor = Colors.white;
  static const Color accentColor2 = Color.fromARGB(118, 192, 224, 252);
  static const Color backgroundColor = Color.fromARGB(255, 246, 249, 255);
  static const Color boldColor = Colors.black;
  static const Color mediumColor = Colors.white;
  static const Color regularColor = Color.fromARGB(255, 233, 233, 233);
  static const Color verysmallcolor = Color.fromARGB(255, 221, 242, 252);
  static const Color smallcolor = Color.fromARGB(255, 155, 155, 161);

  //gredient
  static const Color gradientStart = Color.fromARGB(255, 107, 115, 255);
  static const Color gradientEnd = Color.fromARGB(255, 0, 13, 255);
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientStart, gradientEnd],
  );

  static NavigationBarThemeData navigationBarThemeData() {
    return NavigationBarThemeData(backgroundColor: backgroundColor);
  }

  static TextTheme textTheme(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: height * 0.0245,
        fontWeight: FontWeight.bold,
        color: boldColor,
        fontFamily: 'AirbnbCereal',
      ),
      headlineSmall: TextStyle(
        fontSize: height * 0.017,
        fontWeight: FontWeight.bold,
        color: boldColor,
        fontFamily: 'AirbnbCereal',
      ),
      bodyLarge: TextStyle(
        fontSize: height * 0.0315,
        fontWeight: FontWeight.w800,
        color: boldColor,
        fontFamily: 'AirbnbCereal',
      ),
      bodyMedium: TextStyle(
        fontSize: height * 0.016,
        fontWeight: FontWeight.w500,
        color: boldColor,
        fontFamily: 'AirbnbCereal',
      ),
      bodySmall: TextStyle(
        fontSize: height * 0.014,
        fontWeight: FontWeight.w400,
        color: boldColor,
        fontFamily: 'AirbnbCereal',
      ),
      displaySmall: TextStyle(
        fontSize: height * 0.012,
        fontWeight: FontWeight.w500,
        color: smallcolor,
        fontFamily: 'AirbnbCereal',
      ),
    );
  }

  static BoxDecoration customBoxDecoration({
    Color color = accentColor,
    double borderRadius = 8.0,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static BoxDecoration customGradientDecoration({
    LinearGradient gradient = primaryGradient,
    double borderRadius = 8.0,
  }) {
    return BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}
