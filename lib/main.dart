import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:GoldenSection/Screens/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GoldenSection",
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (BuildContext context) => HomePage(title: "GoldenSection"),
      }
    );
  }
}
