import 'package:flutter/material.dart';
import 'package:flutter_task/task1.dart';
import 'package:flutter_task/shoping.dart';
import 'package:flutter_task/favorite/favorite_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavoriteScreen(),
    );
  }
}
