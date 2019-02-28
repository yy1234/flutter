import 'package:flutter/material.dart';
import './pages/tabbar_page.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '百姓生活+',
      home: BarPage(),
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
