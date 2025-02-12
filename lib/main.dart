import 'package:flutter/material.dart';
import 'package:flutter_task/persantetion/favorite/favorite_screen.dart';
import 'package:flutter_task/persantetion/task_screen_api/shoping.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shopping(),
    );
  }
}
