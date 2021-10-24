import 'package:flutter/material.dart';
import 'package:valentina_soto_6_2021_2_p1/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notices New',
      home: HomeScreen(),
    );
  }
}