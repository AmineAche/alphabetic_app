import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _lettertot;
int indiceletter_1 = 0;
int indiceletter_2 = 0;
int indiceletter_3 = 0;
var _letter_1 = _alphabet[indiceletter_1];
var _letter_2 = _alphabet[indiceletter_2];
var _letter_3 = _alphabet[indiceletter_3];



  var _alphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

class BoutonWidget extends StatefulWidget {
  @override
  _BoutonWidget createState() => _BoutonWidget();
}

class _BoutonWidget extends State<BoutonWidget> {
  bool activeMaj = false;
  var visibilityidx = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
            Container(
              child: Row(
                children: [
                  Button3D(
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.red[400],
                      borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      ),
                    ),
                    height: 50,
                    width: 100,
                    onPressed: () {
                      setState(() {
                        visibilityidx = 1;
                      });
                    },
                    child: Text(
                      "a",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Button3D(
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.red[400],
                      borderRadius: BorderRadius.circular(0),
                    ),
                    height: 50,
                    width: 100,
                    onPressed: () {
                      setState(() {
                        visibilityidx = 2;
                      });
                    },
                    child: Text(
                      "a a",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Button3D(
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.red[400],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: 50,
                    width: 100,
                    onPressed: () {
                      setState(() {
                        visibilityidx = 3;
                      });
                    },
                    child: Text(
                      "a a a",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: SwitcherButton(
                value: false,
                offColor: Colors.grey,
                onColor: Colors.blue,
                onChange: (value) {
                  activeMaj = value;

                  setState(() {
                    if (activeMaj) {
                      _letter_1 = _letter_1.toUpperCase();
                      _letter_2 = _letter_2.toUpperCase();
                      _letter_3 = _letter_3.toUpperCase();
                    } else {
                      _letter_1 = _letter_1.toLowerCase();
                      _letter_2 = _letter_2.toLowerCase();
                      _letter_3 = _letter_3.toLowerCase();
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 60),
      FavoriteWidget( isMaj: activeMaj, visibility: visibilityidx),
      ],
    );
  }
}


class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key, this.isMaj: false, this.visibility})
      : super(key: key);
      
      final bool isMaj;
      final int visibility;
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}


class _FavoriteWidgetState extends State<FavoriteWidget> {
  AudioCache audioCache = AudioCache();
   void initState() {
     super.initState();
     _loadString();
   }

  @override
  Widget build(BuildContext context) {
    _saveString();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.visibility; i++)
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 10.0),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 1),
                  ],
                ),
                // padding: EdgeInsets.all(8),
                child: Center(
                  child: Text((() {
                    if (i == 0) {
                      return '$_letter_1';
                    } else if (i == 1) {
                      return '$_letter_2';
                    } else {
                      return '$_letter_3';
                    }
                  })(), style: TextStyle(fontSize: 50, color: Colors.red)),
                ),
              ),
              onSwipeDown: () {
                setState(() {
                  if (i == 0) {
                    changedownletter_1();
                  } else if (i == 1) {
                    changedownletter_2();
                  } else {
                    changedownletter_3();
                  }
                });
              },
              onSwipeUp: () {
                setState(() {
                  if (i == 0) {
                    changeupletter_1();
                  } else if (i == 1) {
                    changeupletter_2();
                  } else {
                    changeupletter_3();
                  }
                });
              },
            ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  icon: Icon(
                    Icons.volume_up,
                    color: Colors.black,
                  ),
                  tooltip: 'Ecouter',
                  onPressed: () {
                    sound();
                  })),
        ],
      ),
    );
  }

   _loadString() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       indiceletter_1 = (prefs.getInt('indice'));
       //_letter_1 = _alphabet[indiceletter_1];
       indiceletter_2 = (prefs.getInt('indice2'));
       //_letter_2 = _alphabet[indiceletter_2];
       indiceletter_3 = (prefs.getInt('indice3'));
       //_letter_3 = _alphabet[indiceletter_3];
       //widget.visibility = (prefs.getInt('vis'));
       //widget.isMaj = (prefs.getBool('boolValue'));

       //prefs.setBool('boolValue', widget.isMaj);
     });
   }

   _saveString() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
      //  print(indiceletter_3);
       if (indiceletter_1 == null) {
         indiceletter_1 = 1;
         indiceletter_2 = 1;
         indiceletter_3 = 1;
       }
       prefs.setInt('indice', indiceletter_1);
       prefs.setInt('indice2', indiceletter_2);
       prefs.setInt('indice3', indiceletter_3);
        prefs.setInt('vis', widget.visibility);
        prefs.setBool('boolValue', widget.isMaj);
        prefs.getBool('boolValue');
     });
    //  print(_alphabet[indiceletter_1] +
    //      _alphabet[indiceletter_2] +
    //      _alphabet[indiceletter_3]);

    //  print(widget.visibility);
   }

  void changedownletter_1() {
    setState(() {
      if (indiceletter_1 == 0) {
        indiceletter_1 = 25;
        if (widget.isMaj) {
          _letter_1 = _alphabet[indiceletter_1].toUpperCase();
        } else {
          _letter_1 = _alphabet[indiceletter_1];
        }
      } else {
        indiceletter_1 -= 1;
        if (widget.isMaj) {
          _letter_1 = _alphabet[indiceletter_1].toUpperCase();
        } else {
          _letter_1 = _alphabet[indiceletter_1];
        }
      }
    });
  }

  void changeupletter_1() {
    setState(() {
      if (indiceletter_1 == 25) {
        indiceletter_1 = 0;
        if (widget.isMaj) {
          _letter_1 = _alphabet[indiceletter_1].toUpperCase();
        } else {
          _letter_1 = _alphabet[indiceletter_1];
        }
      } else {
        indiceletter_1 += 1;
        if (widget.isMaj) {
          _letter_1 = _alphabet[indiceletter_1].toUpperCase();
        } else {
          _letter_1 = _alphabet[indiceletter_1];
        }
      }
    });
  }

  void changedownletter_2() {
    setState(() {
      if (indiceletter_2 == 0) {
        indiceletter_2 = 25;
        if (widget.isMaj) {
          _letter_2 = _alphabet[indiceletter_2].toUpperCase();
        } else {
          _letter_2 = _alphabet[indiceletter_2];
        }
      } else {
        indiceletter_2 -= 1;
        if (widget.isMaj) {
          _letter_2 = _alphabet[indiceletter_2].toUpperCase();
        } else {
          _letter_2 = _alphabet[indiceletter_2];
        }
      }
    });
  }

  void changeupletter_2() {
    setState(() {
      if (indiceletter_2 == 25) {
        indiceletter_2 = 0;
        if (widget.isMaj) {
          _letter_2 = _alphabet[indiceletter_2].toUpperCase();
        } else {
          _letter_2 = _alphabet[indiceletter_2];
        }
      } else {
        indiceletter_2 += 1;
        if (widget.isMaj) {
          _letter_2 = _alphabet[indiceletter_2].toUpperCase();
        } else {
          _letter_2 = _alphabet[indiceletter_2];
        }
      }
    });
  }

  void changedownletter_3() {
    setState(() {
      if (indiceletter_3 == 0) {
        indiceletter_3 = 25;
        if (widget.isMaj) {
          _letter_3 = _alphabet[indiceletter_3].toUpperCase();
        } else {
          _letter_3 = _alphabet[indiceletter_3];
        }
      } else {
        indiceletter_3 -= 1;
        if (widget.isMaj) {
          _letter_3 = _alphabet[indiceletter_3].toUpperCase();
        } else {
          _letter_3 = _alphabet[indiceletter_3];
        }
      }
    });
  }

  void changeupletter_3() {
    setState(() {
      if (indiceletter_3 == 25) {
        indiceletter_3 = 0;
        if (widget.isMaj) {
          _letter_3 = _alphabet[indiceletter_3].toUpperCase();
        } else {
          _letter_3 = _alphabet[indiceletter_3];
        }
      } else {
        indiceletter_3 += 1;
        if (widget.isMaj) {
          _letter_3 = _alphabet[indiceletter_3].toUpperCase();
        } else {
          _letter_3 = _alphabet[indiceletter_3];
        }
      }
    });
  }

  List<String> audio = ["dab_file.mp3", "do_file.mp3"];

  void sound() {
    if (widget.visibility == 3) {
      _lettertot = _letter_1.toLowerCase() +
          _letter_2.toLowerCase() +
          _letter_3.toLowerCase();
    } else if (widget.visibility == 2) {
      _lettertot = _letter_1 + _letter_2;
    } else {
      _lettertot = _letter_1;
    }

    if (audio.contains(_lettertot + "_file.mp3")) {
      audioCache.play(_lettertot + "_file.mp3");
    }
    print(_lettertot);
  }
}