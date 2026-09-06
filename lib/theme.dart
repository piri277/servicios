import 'package:flutter/material.dart';

const _semilla = Color(0xFF6750A4);

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: _semilla),

  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
  ),

  cardTheme: CardThemeData(
    elevation: 0,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: Colors.transparent,
    side: BorderSide(color: Colors.grey.shade300),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);
