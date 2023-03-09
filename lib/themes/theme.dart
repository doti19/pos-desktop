import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.blueGrey[800],
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blue[400],
    brightness: Brightness.dark,
  ),
);

final darkTealTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.teal[800],
  scaffoldBackgroundColor: Colors.teal[900],
  textTheme: TextTheme(
    bodyLarge: const TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.grey[400]),
    titleLarge: const TextStyle(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal[600]),
);

// final ColorScheme darkColorScheme = ColorScheme.dark(
//   primary: Color(0xFF4CAF50),
//   primaryVariant: Color(0xFF388E3C),
//   secondary: Color(0xFFFF5722),
//   secondaryVariant: Color(0xFFF44336),
//   background: Color(0xFF212121),
//   surface: Color(0xFF333333),
//   onPrimary: Colors.white,
//   onSecondary: Colors.white,
//   onBackground: Colors.white,
//   onSurface: Colors.white,
// );

// final ThemeData darkTheme1 = ThemeData.dark().copyWith(
//   colorScheme: darkColorScheme,
//   scaffoldBackgroundColor: darkColorScheme.background,
//   cardColor: darkColorScheme.surface,
//   buttonTheme: ButtonThemeData(
//     buttonColor: darkColorScheme.secondary,
//     textTheme: ButtonTextTheme.primary,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16.0),
//     ),
//   ),
//   textTheme: TextTheme(
//     headline6: TextStyle(color: Colors.white),
//     bodyText2: TextStyle(color: Colors.white60),
//   ),
//   appBarTheme: AppBarTheme(
//     color: darkColorScheme.surface,
//     elevation: 0,
//     iconTheme: IconThemeData(
//       color: Colors.white,
//     ),
//     textTheme: TextTheme(
//       headline6: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// );

// final ColorScheme darkColorScheme = ColorScheme.dark(
//   primary: Colors.deepPurple.shade500,
//   primaryContainer: Colors.deepPurple[700],
//   secondary: Colors.amber.shade700,
//   secondaryContainer: Colors.amber[700],
//   background: Colors.grey.shade900,
//   surface: Colors.grey.shade800,
//   onPrimary: Colors.white,
//   onSecondary: Colors.black,
//   onBackground: Colors.white,
//   onSurface: Colors.white,
// );

// final ThemeData darkTheme2 = ThemeData.dark().copyWith(
//   colorScheme: darkColorScheme,
//   scaffoldBackgroundColor: darkColorScheme.background,
//   cardColor: darkColorScheme.surface,
//   buttonTheme: ButtonThemeData(
//     buttonColor: darkColorScheme.secondary,
//     textTheme: ButtonTextTheme.normal,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(4.0),
//     ),
//   ),
//   textTheme: TextTheme(
//     headline6: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 20.0,
//     ),
//     bodyText2: TextStyle(
//       color: Colors.white70,
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     color: darkColorScheme.surface,
//     elevation: 0,
//     iconTheme: IconThemeData(
//       color: Colors.white,
//     ),
//     textTheme: TextTheme(
//       headline6: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 20.0,
//       ),
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       primary: darkColorScheme.secondary,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//     ),
//   ),
// );

// final ColorScheme darkColorScheme = ColorScheme.dark(
//   primary: Colors.deepPurple,
//   primaryVariant: Colors.deepPurple[700],
//   secondary: Colors.amber,
//   secondaryVariant: Colors.amber[700],
//   background: Colors.grey[900],
//   surface: Colors.grey[800],
//   onBackground: Colors.white,
//   onSurface: Colors.white,
// );

// final ThemeData darkTheme3 = ThemeData(
//   colorScheme: darkColorScheme,
//   primaryColor: darkColorScheme.primary,
//   accentColor: darkColorScheme.secondary,
//   scaffoldBackgroundColor: darkColorScheme.background,
//   appBarTheme: AppBarTheme(
//     color: darkColorScheme.surface,
//     brightness: Brightness.dark,
//   ),
//   textTheme: TextTheme(
//     headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
//     headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//     headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//     headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//     headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//     headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
//     subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//     subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
//     bodyText1: TextStyle(fontSize: 16.0),
//     bodyText2: TextStyle(fontSize: 14.0),
//     button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
//   ),
//   buttonTheme: ButtonThemeData(
//     buttonColor: darkColorScheme.secondary,
//     textTheme: ButtonTextTheme.primary,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//   ),
// );

final ColorScheme darkColorScheme = ColorScheme.dark(
  primary: Colors.indigo,
  primaryContainer: Colors.indigo[700],
  secondary: Colors.amber,
  secondaryContainer: Colors.amber[700],
  background: Colors.grey.shade900,
  surface: Colors.grey.shade800,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onBackground: Colors.white,
  onSurface: Colors.white,
);

final ThemeData darkTheme4 = ThemeData(
  primaryColor: darkColorScheme.primary,
  scaffoldBackgroundColor: darkColorScheme.background,
  appBarTheme: AppBarTheme(
    color: darkColorScheme.surface,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    displaySmall: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    fontSizeFactor: 1.0,
    fontSizeDelta:
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width <
                600
            ? -2.0
            : MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                        .size
                        .width >
                    1200
                ? 4.0
                : 0.0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.cyan[600],
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                  .size
                  .width <
              600
          ? 12.0
          : 16.0,
      vertical: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                  .size
                  .width <
              600
          ? 6.0
          : 8.0,
    ),
  ),
);
