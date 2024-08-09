import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    surfaceTintColor: Colors.transparent,
  ),
  indicatorColor: Colors.grey.shade600,
  cardColor: const Color(0xFF252525),
  shadowColor: const Color(0xFFFCFCFF),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: const Color(0xFFFBFBFC),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFCFCFF),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFCFCFF),
    surfaceTintColor: Colors.transparent,
  ),
  indicatorColor: Colors.grey.shade400,
  cardColor: const Color(0xFFFCFCFF),
  shadowColor: const Color(0xFF252525),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _init();
  }

  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool("darkMode");
    state = darkMode ?? false;
  }

  void toggle() async {
    state = !state;
    prefs.setBool("darkMode", state);
  }
}

final darkModeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(),
);
