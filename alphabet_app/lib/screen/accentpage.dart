import 'dart:async';

import 'package:alphabet_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alphabet_app/list/letter_list.dart';

class AccentPage extends StatefulWidget {
  @override
  _AccentPageState createState() => _AccentPageState();
}

class _AccentPageState extends State<AccentPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    _load();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1050));
    Timer(Duration(milliseconds: 200), () => _animationController.forward());
    super.initState();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: idxColorBackground,
      body: Container(
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
                        bottomRight: Radius.circular(10),
                      ),
                      color: idxColorButton,
                    ),
                    child: SizedBox(
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
                        bottomLeft: Radius.circular(10),
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new SwipeGestureRecognizer(
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 3.0),
                                height: height / 2,
                                width: width / 5,
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
                                      Border.all(color: Colors.black, width: 1),
                                  // boxShadow: [
                                  //   BoxShadow(color: Colors.white, spreadRadius: 1),
                                  // ],
                                ),
                                child: Center(
                                  child: Text(
                                    voyelleaccent[lettreidx],
                                    style: TextStyle(
                                        fontSize: height / 3.5,
                                        color: idxColorVoyelle),
                                  ),
                                ),
                              ),
                            ),
                            onSwipeUp: () {
                              setState(() {
                                lettreright();
                              });
                            },
                            onSwipeDown: () {
                              setState(() {
                                lettreleft();
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 7, left: height / 20),
                            child: Container(
                              height: height / 10,
                              width: height / 10,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border:
                                    Border.all(color: idxColorButton, width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                  iconSize: height / 20,
                                  icon: Icon(
                                    Icons.volume_up,
                                    color: Colors.black,
                                  ),
                                  tooltip: 'Ecouter',
                                  onPressed: () {
                                    sound();
                                  }),
                            ),
                          ),
                        ],
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

  Future sound() async {
    await flutterTts.setVoice({"name": "Marie", "locale": "fr-FR"});
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.45);

    Map phonetiques = {
      "à": "a accent grave",
      "é": "e accent aigu",
      "ù": "u accent grave",
      "ü": "u tréma",
      "ô": "o accent circonflexe"
    };

    MapEntry entry = phonetiques.entries.firstWhere(
        (element) => element.key == voyelleaccent[lettreidx],
        orElse: () => null);

    if (entry != null) {
      await flutterTts.speak(entry.value);
    } else {
      await flutterTts.speak(voyelleaccent[lettreidx]);
    }
  }

  Future _load() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   idxColorBackgroundsave = (prefs.getString('idx_color_background_values'));
    //   if (idxColorBackgroundsave == null) {
    //     idxColorBackgroundsave = 'F5F5F5';
    //   }
    //   valueback = int.parse(idxColorBackgroundsave, radix: 16);
    //   idxColorBackground = new Color(valueback);
    // });
  }

  void lettreleft() {
    if (lettreidx <= 0) {
      lettreidx = 11;
    } else {
      lettreidx -= 1;
    }
  }

  void lettreright() {
    if (lettreidx >= 11) {
      lettreidx = 0;
    } else {
      lettreidx += 1;
    }
  }
}
