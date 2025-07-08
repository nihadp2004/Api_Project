import 'package:flutter/material.dart';
import 'package:screens/screen_home.dart';
i

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenHome(
    );
  }
}
