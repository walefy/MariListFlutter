import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final Widget home;
  final String title;

  const MainApp({super.key, required this.home, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 42, 54),
      ),
      title: title,
      home: home,
    );
  }
}
