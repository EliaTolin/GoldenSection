import 'package:GoldenSection/models/g_section.dart';
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
  Size sizeInternalBody = Size(0, 0);
  // ignore: non_constant_identifier_names
  TextEditingController value_A;
  TextEditingController value_B;
  TextEditingController value_AB;
  GoldenSection gs = GoldenSection();

  @override
  void initState() {
    super.initState();
    value_A = TextEditingController(text: "1");
    value_B = TextEditingController(text: "0.618");
    value_AB = TextEditingController(text: "1.618");
    WidgetsBinding.instance.addPersistentFrameCallback((_) => getSize());
  }

  void getSize() {
    RenderBox _box = _keyAB.currentContext.findRenderObject();
    sizeInternalBody = _box.size;
    setState(() {});
  }

  @override
  void dispose() {
    value_A.dispose();
    value_B.dispose();
    value_AB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar(size, title: "Golden Section"),
      backgroundColor: GSConst.backColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          key: _keyAB,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  elementGS(size, value_A.text, Colors.cyan[600], GSConst.sizeA, 2),
                  elementGS(size, value_B.text, Colors.blue, GSConst.sizeB, 1),
                ],
              ),
              elementGS(size, value_AB.text, Colors.red, 1, 3),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottom(size),
    );
  }

  Container elementGS(
      Size size, String textHint, Color color, double ratioWidth, int flagGS) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: GSConst.kDefaultPadding),
      height: size.height * GSConst.kHeightElementRatio,
      width: sizeInternalBody.width * ratioWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: textHint,
          hintStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'ChristopherDone',
            fontSize: 30,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          alignLabelWithHint: true,
        ),
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'ChristopherDone',
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
        autocorrect: false,
        showCursor: true,
        onChanged: (String value) {
          setState(() {
            if (value.isNotEmpty) {
              Map<String, TextEditingController> contr = {
                "A": value_A,
                "B": value_B,
                "AB": value_AB,
              };
              switch (flagGS) {
                case 1:
                  contr = calculateGS(contr, b: double.parse(value));
                  break;
                case 2:
                  contr = calculateGS(contr, a: double.parse(value));
                  break;
                case 3:
                  contr = calculateGS(contr, ab: double.parse(value));
                  break;
              }
            }
          });
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}

Map<String, TextEditingController> calculateGS(
  Map<String, TextEditingController> contr, {
  double a = null,
  double b = null,
  double ab = null,
}) {
  //AB
  if (a == null && b == null) {
    a = ab / GSConst.goldenRatio;
    b = ab - a;
  }
  //A
  if (ab == null && b == null) {
    b = a / GSConst.goldenRatio;
    ab = a + b;
  }
  //B
  if (a == null && ab == null) {
    a = b * GSConst.goldenRatio;
    ab = a + b;
  }
  contr["A"].text = a.toStringAsFixed(3);
  contr["B"].text = b.toStringAsFixed(3);
  contr["AB"].text = ab.toStringAsFixed(3);
  return contr;
}
