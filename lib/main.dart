import 'package:e_ticaret_mobil_uygulama/state_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_bar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartState()),
        ChangeNotifierProvider(create: (_) => FavoriteState()),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _themeMode,
        home: BottomNavBar(
          onToggleTheme: _toggleTheme,
          isDarkMode: _themeMode == ThemeMode.dark,
        ),
      ),
    );
  }
}
