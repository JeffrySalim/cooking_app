import 'package:flutter/material.dart';
import 'Pages/Setup/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking FUN!',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

