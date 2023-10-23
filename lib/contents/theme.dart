import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

// import 'color_constants.dart';
class MyThemes {
  MyThemes();
  static const Color primaryColorDark = Color.fromARGB(229, 11, 31, 70);
  static const Color secondaryColorDark = Color.fromARGB(255, 18, 35, 91);
  static const Color accentColorDark = Color.fromARGB(255, 248, 240, 240);
  static const Color backgroundColorDark = Color(0xFF03537E);
  static const Color errorColorDark = Color(0xffEF4444);

  //   static const Color primaryColor = Color(0xff4338CA);
  // static const Color secondaryColor = Color.fromARGB(255, 110, 73, 170);
  // static const Color accentColor = Color.fromARGB(255, 248, 240, 240);
  // static const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
  // static const Color errorColor = Color(0xffEF4444);
}

// class ThemeConfig {
//   static ThemeData createTheme({
//     Brightness brightness,
//     Color background,
//     Color primaryText,
//     Color secondaryText,
//     Color accentColor,
//     Color divider,
//     Color buttonBackground,
//     Color buttonText,
//     Color cardBackground,
//     Color disabled,
//     Color error,
//   }) {
//     final baseTextTheme = brightness == Brightness.dark
//         ? Typography.blackMountainView
//         : Typography.whiteMountainView;

//     return ThemeData(
//       brightness: brightness,
//       buttonColor: buttonBackground,
//       canvasColor: background,
//       cardColor: background,
//       dividerColor: divider,
//       dividerTheme: DividerThemeData(
//         color: divider,
//         space: 1,
//         thickness: 1,
//       ),
//       cardTheme: CardTheme(
//         color: cardBackground,
//         margin: EdgeInsets.zero,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//       ),
//       backgroundColor: background,
//       primaryColor: accentColor,
//       accentColor: accentColor,
//       textSelectionColor: accentColor,
//       textSelectionHandleColor: accentColor,
//       cursorColor: accentColor,
//       toggleableActiveColor: accentColor,
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: Colors.amber,
//       ),
//       appBarTheme: AppBarTheme(
//         brightness: brightness,
//         color: cardBackground,
//         textTheme: TextTheme(
//           bodyText1: baseTextTheme.bodyText1.copyWith(
//             color: Colors.white,
//             fontSize: 24,
//           ),
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//       ),
//       iconTheme: IconThemeData(
//         color: accentColor,
//         size: 16.0,
//       ),
//       errorColor: error,
//       buttonTheme: ButtonThemeData(
//         textTheme: ButtonTextTheme.primary,
//         colorScheme: ColorScheme(
//           brightness: brightness,
//           primary: accentColor,
//           primaryVariant: accentColor,
//           secondary: accentColor,
//           secondaryVariant: accentColor,
//           surface: background,
//           background: background,
//           error: error,
//           onPrimary: buttonText,
//           onSecondary: buttonText,
//           onSurface: buttonText,
//           onBackground: buttonText,
//           onError: buttonText,
//         ),
//         padding: const EdgeInsets.all(16.0),
//       ),
//       cupertinoOverrideTheme: CupertinoThemeData(
//         brightness: brightness,
//         primaryColor: accentColor,
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         errorStyle: TextStyle(color: error),
//         labelStyle: TextStyle(
//           fontFamily: '',
//           fontWeight: FontWeight.w600,
//           fontSize: 16.0,
//           color: primaryText,
//         ),
//         hintStyle: TextStyle(
//           color: secondaryText,
//           fontSize: 13.0,
//           fontWeight: FontWeight.w300,
//         ),
//       ),
//       fontFamily: '',
//       textTheme: TextTheme(
//         headline1: baseTextTheme.headline1.copyWith(
//           color: primaryText,
//           fontSize: 34.0,
//           fontWeight: FontWeight.bold,
//         ),
//         headline2: baseTextTheme.headline2.copyWith(
//           color: primaryText,
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//         ),
//         headline3: baseTextTheme.headline3.copyWith(
//           color: secondaryText,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//         ),
//         headline4: baseTextTheme.headline4.copyWith(
//           color: primaryText,
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//         ),
//         headline5: baseTextTheme.headline5.copyWith(
//           color: primaryText,
//           fontSize: 16,
//           fontWeight: FontWeight.w700,
//         ),
//         headline6: baseTextTheme.headline6.copyWith(
//           color: primaryText,
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         bodyText1: baseTextTheme.bodyText1.copyWith(
//           color: secondaryText,
//           fontSize: 15,
//         ),
//         bodyText2: baseTextTheme.bodyText2.copyWith(
//           color: primaryText,
//           fontSize: 12,
//           fontWeight: FontWeight.w400,
//         ),
//         button: baseTextTheme.button.copyWith(
//           color: primaryText,
//           fontSize: 12.0,
//           fontWeight: FontWeight.w700,
//         ),
//         caption: baseTextTheme.caption.copyWith(
//           color: primaryText,
//           fontSize: 11.0,
//           fontWeight: FontWeight.w300,
//         ),
//         overline: baseTextTheme.overline.copyWith(
//           color: secondaryText,
//           fontSize: 11.0,
//           fontWeight: FontWeight.w500,
//         ),
//         subtitle1: baseTextTheme.subtitle1.copyWith(
//           color: primaryText,
//           fontSize: 16.0,
//           fontWeight: FontWeight.w700,
//         ),
//         subtitle2: baseTextTheme.subtitle2.copyWith(
//           color: secondaryText,
//           fontSize: 11.0,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }

//   static ThemeData get lightTheme => createTheme(
//         brightness: Brightness.light,
//         background: ColorConstants.lightScaffoldBackgroundColor,
//         cardBackground: Colors.amber,
//         primaryText: ColorConstants.secondaryAppColor,
//         secondaryText: ColorConstants.secondaryAppColor,
//         accentColor: ColorConstants.secondaryAppColor,
//         divider: ColorConstants.secondaryAppColor,
//         buttonBackground: ColorConstants.secondaryAppColor,
//         buttonText: ColorConstants.secondaryAppColor,
//         disabled: ColorConstants.secondaryAppColor,
//         error: Colors.red,
//       );

//   static ThemeData get darkTheme => createTheme(
//         brightness: Brightness.dark,
//         background: ColorConstants.darkScaffoldBackgroundColor,
//         cardBackground: Colors.grey,
//         primaryText: ColorConstants.secondaryBlackAppColor,
//         secondaryText: ColorConstants.secondaryBlackAppColor,
//         accentColor: ColorConstants.secondaryBlackAppColor,
//         divider: ColorConstants.secondaryBlackAppColor,
//         buttonBackground: ColorConstants.secondaryBlackAppColor,
//         buttonText: ColorConstants.secondaryBlackAppColor,
//         disabled: ColorConstants.secondaryBlackAppColor,
//         error: Colors.red,
//       );
// }
// // import 'package:flutter/material.dart';

// class AppStateNotifier extends ChangeNotifier {
//   bool isDarkMode = false;

//   void updateTheme(bool isDarkMode) {
//     this.isDarkMode = isDarkMode;
//     notifyListeners();
//   }
// }

