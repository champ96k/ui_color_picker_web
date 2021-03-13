import 'package:flutter/material.dart';
import 'package:ui_color_picker_web/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Color Picker', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Homescreen(),
    );
  }
}