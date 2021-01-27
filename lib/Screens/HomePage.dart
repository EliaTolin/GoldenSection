import 'package:GoldenSection/models/g_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:GoldenSection/constants.dart';
import 'package:GoldenSection/Screens/components/BodyComponents.dart';
import 'dart:math';

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
                  Container(
                    padding: EdgeInsets.all(8),
                    height: size.height * GSConst.kHeightElementRatio,
                    width: sizeInternalBody.width * GSConst.sizeA,
                    decoration: BoxDecoration(
                      color: Colors.cyan[600],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: value_A.text,
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
                      showCursor: false,
                      onChanged: (String value) {
                        setState(() {
                          if (value_A.text.isNotEmpty &&
                              value_AB.text.isNotEmpty &&
                              value.isNotEmpty) {
                            double val_a = double.tryParse(value);
                            double val_ab = double.tryParse(value_AB.text);
                            double val_b = double.tryParse(value_B.text);
                            val_b = val_a / gs.goldenRatio;
                            val_ab = val_a + val_b;
                            value_B.text = val_b.toStringAsFixed(3);
                            value_AB.text = val_ab.toStringAsFixed(3);
                          }
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: size.height * GSConst.kHeightElementRatio,
                    width: sizeInternalBody.width * GSConst.sizeB,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: value_B.text,
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
                          if (value_A.text.isNotEmpty &&
                              value_AB.text.isNotEmpty &&
                              value.isNotEmpty) {
                            double val_a = double.tryParse(value_A.text);
                            double val_ab = double.tryParse(value_AB.text);
                            double val_b = double.tryParse(value);
                            val_a = val_b * gs.goldenRatio;
                            val_ab = val_a + val_b;
                            value_A.text = val_a.toStringAsFixed(3);
                            value_AB.text = val_ab.toStringAsFixed(3);
                          }
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.symmetric(horizontal: GSConst.kDefaultPadding),
                height: size.height * GSConst.kHeightElementRatio,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: value_AB.text,
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
                      if (value_A.text.isNotEmpty &&
                          value_B.text.isNotEmpty &&
                          value.isNotEmpty) {
                        double val_a = double.tryParse(value_A.text);
                        double val_b = double.tryParse(value_B.text);
                        double val_ab = double.tryParse(value);
                        val_a = val_ab / gs.goldenRatio;
                        val_b = val_ab - val_a;
                        value_A.text = val_a.toStringAsFixed(3);
                        value_B.text = val_b.toStringAsFixed(3);
                      }
                    });
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottom(size),
    );
  }
}
