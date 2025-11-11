import 'package:flutter/material.dart';

class AppTheme {
  static const fontFamily = 'GeistMono';

  static ThemeData get dark => ThemeData(
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      indicatorColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      shadowColor: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
    ),
  );
}
