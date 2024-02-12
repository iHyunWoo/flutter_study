import 'package:flutter/material.dart';
import 'package:pomodoro/screen/home_screen.dart';

void main() {
  final ThemeData theme = ThemeData();
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          background: const Color(0xFFE7626C),),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
      ),
  );
}
