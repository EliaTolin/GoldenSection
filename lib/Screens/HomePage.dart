import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:GoldenSection/constants.dart';
import 'package:GoldenSection/Screens/components/BodyComponents.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

  final String title;
  HomePage({this.title, Key key}) : super(key: key);

  @override
  _HomePage_State createState() => _HomePage_State();
}

// ignore: camel_case_types
class _HomePage_State extends State<HomePage> {
  
  final GlobalKey _keyAB = GlobalKey();
  Size sizeInternalBody;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) => getSize());
  }

  void getSize() {
    RenderBox _box = _keyAB.currentContext.findRenderObject();
    sizeInternalBody = _box.size;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(size, title: "Golden Section"),
      backgroundColor: GS.backColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          key: _keyAB,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    height: size.height * GS.kHeightElementRatio,
                    width: sizeInternalBody.width * GS.sizeA,
                    decoration: BoxDecoration(
                      color: Colors.cyan[600],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: textFieldElement("A", Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: size.height * GS.kHeightElementRatio,
                    width: sizeInternalBody.width * GS.sizeB,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: textFieldElement("B", Colors.white),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: GS.kDefaultPadding),
                height: size.height * GS.kHeightElementRatio,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: textFieldElement("A+B", Colors.white),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottom(size),
    );
  }


}
