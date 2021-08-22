import 'package:flutter/material.dart';
import 'widgets/index.dart' as index;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fabric-ripple',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: index.InitPage(),
    );
  }
}


