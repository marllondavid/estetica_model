import 'package:estetica_model/src/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';

sealed class ThemeDataApp {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
    borderSide: BorderSide(color: Colors.white),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsConstants.backgroundColor,
    fontFamily: 'Lato',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorsConstants.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.black,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: ColorsConstants.primaryColor),
        ),
        errorBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: ColorsConstants.red),
        ),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Lato',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: ColorsConstants.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[200],
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: const TextStyle(color: Colors.black54),
        border: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.black54),
        ),
        enabledBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.black54),
        ),
        focusedBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: ColorsConstants.accentColor),
        ),
        errorBorder: _defaultInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    ),
  );
}
