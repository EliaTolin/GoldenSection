import 'package:GoldenSection/constants.dart';
import 'package:flutter/material.dart';

Container bottom(Size size) {
  double totalElement = size.width / 3;
  return Container(
    height: size.width * GS.kHeightRatio,
    //color: GS.mainColor,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        //THIRD ELEMENT
        bottomElement(
            GS.thirdElementColor, totalElement * 3, GS.heightBottomElement),
        //SECOND ELEMENT
        bottomElement(
            GS.secondElementColor, totalElement * 2, GS.heightBottomElement),
        //FIRST ELEMENT
        bottomElement(
            GS.firstElementColor, totalElement, GS.heightBottomElement),
      ],
    ),
  );
}

Positioned bottomElement(Color color, double width, double height) {
  return Positioned(
      child: Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        )),
  ));
}

Column buildTopBar(Size size, String title) {
  return Column(
    children: <Widget>[
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              height: size.height * GS.kHeightRatio,
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
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  //fontFamily: 'ChristopherDone',
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

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;
  final Size size; 
  @override
  final Size preferredSize;

  TopBar(this.size,
      {@required this.title, this.child, this.onPressed, this.onTitleTapped})
      : preferredSize = Size.fromHeight(size.height*GS.kHeightRatio);

  @override
  Widget build(BuildContext context) {
    return buildTopBar(size, title);
  }
}
