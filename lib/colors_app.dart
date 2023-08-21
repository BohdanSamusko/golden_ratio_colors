import 'package:flutter/material.dart';
import 'package:golden_ratio_colors/screens/home/home_screen.dart';

///  This widget is the root of the application.
class ColorsApp extends StatelessWidget {
  /// Default constructor
  const ColorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Random Colors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
