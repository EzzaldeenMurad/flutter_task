import 'package:flutter/material.dart';
import 'package:flutter_task/task1.dart';

import 'package:flutter_task/shoping.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Shopping(),
    );
  }
}
