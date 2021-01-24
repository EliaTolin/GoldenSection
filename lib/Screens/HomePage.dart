import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:GoldenSection/constants.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

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
      //appBar: buildAppBar(),
      backgroundColor: GS.backColor,
      body: Column(
        children: <Widget>[
          buildTopBar(size),
        ],
      ),
      bottomNavigationBar: bottom(size),
    );
  }

  Container bottom(Size size) {
    double totalElement = size.width / 3;
    return Container(
      height: size.width * 0.15,
      //color: GS.mainColor,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          //THIRD ELEMENT 
          Positioned(
            child: Container(
              width: totalElement*3,
              height: GS.heightBottomElement,
              decoration: BoxDecoration(
                color: GS.thirdElementColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),
            )
          ),
          //SECOND ELEMENT
          Positioned(
            child: Container(
              height: GS.heightBottomElement,
              width: totalElement*2,
              decoration: BoxDecoration(
                color: GS.secondElementColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),
            )
          ),
          //FIRST ELEMENT
          Positioned(
            child: Container(
              height: GS.heightBottomElement,
              width: totalElement,
              decoration: BoxDecoration(
                color: GS.firstElementColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),
            )
          ),
        ],
      ),
    );
  }

  Column buildTopBar(Size size) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: GS.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(GS.radiusComponent),
                    bottomRight: Radius.circular(GS.radiusComponent),
                  ),
                )),
            Positioned(
              bottom: 15,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Golden Section",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'ChristopherDone',
                    color: GS.textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: GS.pinkPastel,
    );
  }
}
