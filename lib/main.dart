import 'package:flutter/material.dart';
import './pages/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Stokka stock management',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new StokkaHomePage(),
    );
  }
}

