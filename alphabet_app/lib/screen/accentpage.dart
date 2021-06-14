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
                    width: width / 10,
                    height: height / 10,
                    decoration: BoxDecoration(
                      color: idxColorButton,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: new IconButton(
                      icon: new Icon(Icons.home),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(null),
                    ),
                  ),
                  Container(
                    width: width / 10,
                    height: height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: idxColorButton,
                    ),
                    child: SizedBox(
                      child: IconButton(
                        //iconSize: 30,
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
              child: Container(
                child: Column(
                  children: [
                    new SwipeGestureRecognizer(
                      child: Center(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 3.0),
                          height: height / 10,
                          width: width / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                              child: Text(
                            accent[accentidx],
                            style: TextStyle(fontSize: 60, color: Colors.blue),
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
                        width: width / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(width: 2),
                        ),
                        child: Center(
                          child: Text(
                            voyelleaccent[lettreidx],
                            style: TextStyle(
                                fontSize: width / 10, color: Colors.blue),
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
