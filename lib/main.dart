import 'package:flutter/material.dart';
import 'home_page.dart';

void main(List<String> args)=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      theme: new ThemeData.light(),
      home: new HomePage(),
    );
  }
}