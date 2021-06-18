import 'package:alphabet_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alphabet_app/list/letter_list.dart';

class AccentPage extends StatefulWidget {
  @override
  _AccentPageState createState() => _AccentPageState();
}

class _AccentPageState extends State<AccentPage> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: idxColorBackground,
      body: Container(
        //color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width / 9,
                    height: height / 10,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 15,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.grey[600], width: 0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(70),
                      ),
                      color: idxColorButton,
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(right: width / 70.0),
                        child: IconButton(
                          iconSize: height / 20,
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(null),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width / 9,
                    height: height / 10,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 15,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.grey[600], width: 0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(70),
                      ),
                      color: idxColorButton,
                    ),
                    child: SizedBox(
                      child: IconButton(
                        iconSize: height / 20,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settingPage');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: height / 5),
                child: Container(
                  child: Column(
                    children: [
                      new SwipeGestureRecognizer(
                        child: Center(
                          child: Container(
                            margin: new EdgeInsets.symmetric(horizontal: 3.0),
                            height: height / 10,
                            width: height / 10,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              // boxShadow: [
                              //   BoxShadow(color: Colors.white, spreadRadius: 1),
                              // ],
                            ),
                            child: Center(
                                child: Text(
                              accent[accentidx],
                              style: TextStyle(
                                  fontSize: height / 7.5, color: Colors.blue),
                            )),
                          ),
                        ),
                        onSwipeRight: () {
                          setState(() {
                            accentright();
                          });
                        },
                        onSwipeLeft: () {
                          setState(() {
                            accentleft();
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new SwipeGestureRecognizer(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 3.0),
                          height: height / 3,
                          width: height / 3,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            // boxShadow: [
                            //   BoxShadow(color: Colors.white, spreadRadius: 1),
                            // ],
                          ),
                          child: Center(
                            child: Text(
                              voyelleaccent[lettreidx],
                              style: TextStyle(
                                  fontSize: height / 3.5, color: Colors.blue),
                            ),
                          ),
                        ),
                        onSwipeRight: () {
                          setState(() {
                            lettreright();
                          });
                        },
                        onSwipeLeft: () {
                          setState(() {
                            lettreleft();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idxColorBackgroundsave = (prefs.getString('idx_color_background_values'));
      if (idxColorBackgroundsave == null) {
        idxColorBackgroundsave = 'F5F5F5';
      }
      valueback = int.parse(idxColorBackgroundsave, radix: 16);
      idxColorBackground = new Color(valueback);
    });
  }

  void accentright() {
    if (accentidx <= 0) {
      accentidx = 3;
    } else {
      accentidx -= 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }

  void accentleft() {
    if (accentidx >= 3) {
      accentidx = 0;
    } else {
      accentidx += 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }

  void lettreleft() {
    if (lettreidx <= 0) {
      lettreidx = 4;
    } else {
      lettreidx -= 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }

  void lettreright() {
    if (lettreidx >= 4) {
      lettreidx = 0;
    } else {
      lettreidx += 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }
}
