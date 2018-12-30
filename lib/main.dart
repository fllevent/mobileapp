import 'package:fllevent/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FllEvent',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new HomePage(),
    );
  }
}