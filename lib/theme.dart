import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needzaio_test/values/values.dart';
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

//  Creation of custom text theme for the app.
TextTheme _buildTextTheme(BuildContext context) {
  var textTheme = Theme.of(context).textTheme;

  // Using the google font "Montserrat" as required in the XD
  return GoogleFonts.montserratTextTheme(textTheme).copyWith(
    headline4: GoogleFonts.josefinSans(
      fontSize: Sizes.TEXT_SIZE_36,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    headline5: GoogleFonts.montserrat(
      fontSize: Sizes.TEXT_SIZE_36,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: GoogleFonts.montserrat(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headline6: GoogleFonts.montserrat(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: GoogleFonts.montserrat(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.primaryText,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
    button: GoogleFonts.montserrat(
        fontSize: Sizes.TEXT_SIZE_20,
        color: AppColors.primaryText,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
    ),
    subtitle2: GoogleFonts.montserrat(
      fontSize: Sizes.TEXT_SIZE_10,
      color: AppColors.primaryText,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  );
}

// Creation of the light theme to be used in the app
ThemeData buildLightTheme(BuildContext context) {
  const Color primaryColor = AppColors.primaryColor;
  const Color secondaryColor = AppColors.secondaryColor;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
//    primarySwatch: white,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    buttonColor: AppColors.secondaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: AppColors.secondaryColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: AppColors.errorColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(color: AppColors.iconColor),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: Sizes.ELEVATION_4,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
      buttonColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.SIZE_8),
      ),
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(context),
    primaryTextTheme: _buildTextTheme(context),
    accentTextTheme: _buildTextTheme(context),
  );
}