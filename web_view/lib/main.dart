import 'package:flutter/material.dart';
import 'package:web_view/screen/home_screen.dart';

void main() {
  /// Flutter 프레임워크가 실행할 준비가 될 때까지 기다림.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: HomeScreen(),
    )
  );
}


