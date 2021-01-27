import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:GoldenSection/constants.dart';
import 'package:GoldenSection/Screens/components/BodyComponents.dart';

class HomePage extends StatefulWidget {
  // IMPLEMENT IMPLEMENT IMPLEMENT
  static const routeName = "/";
  // IMPLEMENT IMPLEMENT IMPLEMENT

  final String title;
  HomePage({this.title, Key key}) : super(key: key);

  @override
  _HomePage_State createState() => _HomePage_State();
}

class _HomePage_State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(size, title: "Golden Section"),
      backgroundColor: GSConst.backColor,
      body: Column(
        children: <Widget>[],
      ),
      bottomNavigationBar: bottom(size),
    );
  }
}
