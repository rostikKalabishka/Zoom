import 'package:flutter/material.dart';
import 'package:zoom/screens/login_screen.dart';
import 'package:zoom/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/login': (_) => const LoginScreen()},
      title: 'Flutter Demo',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const LoginScreen(),
    );
  }
}
