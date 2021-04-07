// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
//import 'package:avatar_glow/avatar_glow.dart';
//import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //AudioCache audioCache = AudioCache();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYLLABES',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SYLLABES'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Center(
          child: FavoriteWidget(),
        ),
        // floatingActionButton: AvatarGlow(
        //   glowColor: Colors.blue,
        //   endRadius: 100.0,
        //   duration: Duration(milliseconds: 2000),
        //   repeat: true,
        //   showTwoGlows: true,
        //   repeatPauseDuration: Duration(milliseconds: 100),
          // child: Material(
          //   elevation: 8.0,
          //   shape: CircleBorder(),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: IconButton(
          //       icon: Icon(Icons.volume_up),
          //       tooltip: 'Increase volume by 10',
          //       onPressed: () {
          //         audioCache.play('sample.mp3');
          //       },
          //     ),
          //   ),
          // ),
        //),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  //int favoriteCount = 41;
  int indiceletter_1 = 0;
  int indiceletter_2 = 0;
  int indiceletter_3 = 0;


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

  var _letter_1 = 'a';
  var _letter_2 = 'a';
  var _letter_3 = 'a';

  // string _lettre_1 = _alphabet_1[indiceletter1];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Container(
            color: Colors.yellow,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Coucou BG'
                ),
              ]
            ),
          ),

          SizedBox(height: 60),

          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwipeGestureRecognizer(
                  child: Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 1),
                      ],
                    ),
                    // padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text('$_letter_1',
                        style: TextStyle(fontSize: 100, color: Colors.blue)),
                    ),
                  ),
                  onSwipeDown: () {
                    setState(() {
                      changedownletter_1();
                    });
                  },
                  onSwipeUp: () {
                    setState(() {
                      changeupletter_1();
                    });
                  },
                ),
                SwipeGestureRecognizer(
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 1),
                      ],
                    ),
                      // padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text('$_letter_2',
                        style: TextStyle(fontSize: 100, color: Colors.blue)),
                      ),
                  ),
                    onSwipeDown: () {
                      setState(() {
                        changedownletter_2();
                      });
                    },
                    onSwipeUp: () {
                      setState(() {
                        changeupletter_2();
                      });
                    },
                ),
                SwipeGestureRecognizer(
                  child: Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 1),
                      ],
                    ),
                      // padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text('$_letter_3',
                        style: TextStyle(fontSize: 100, color: Colors.blue)),
                    ),
                  ),
                  onSwipeDown: () {
                    setState(() {
                      changedownletter_3();
                    });
                  },
                  onSwipeUp: () {
                    setState(() {
                      changeupletter_3();
                    });
                  },
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  void changedownletter_1() {
    setState(() {
      if (indiceletter_1 == 0) {
        indiceletter_1 = 25;
        _letter_1 = _alphabet[indiceletter_1];
      } else {
      indiceletter_1 -= 1;
      _letter_1 = _alphabet[indiceletter_1];
      }

    });
  }

  void changeupletter_1() {
    setState(() {
      if (indiceletter_1 == 25) {
        indiceletter_1 = 0;
        _letter_1 = _alphabet[indiceletter_1];
      } else {
         indiceletter_1 += 1;
      print(indiceletter_1);
      _letter_1 = _alphabet[indiceletter_1];
      }
    });
  }

  void changedownletter_2() {
    setState(() {
       if (indiceletter_2 == 0) {
         indiceletter_2 = 25;
         _letter_2 = _alphabet[indiceletter_2];
       } else {
      indiceletter_2 -= 1;
      _letter_2 = _alphabet[indiceletter_2];
       }

    });
  }

  void changeupletter_2() {
    setState(() {
      if (indiceletter_2 == 25) {
        indiceletter_2 = 0;
         _letter_2 = _alphabet[indiceletter_2];
      } else {
      indiceletter_2 += 1;
      _letter_2 = _alphabet[indiceletter_2];
      }
    });
  }
    void changedownletter_3() {
    setState(() {
       if (indiceletter_3 == 0) {
         indiceletter_3 = 25;
         _letter_3 = _alphabet[indiceletter_3];
       } else {
      indiceletter_3 -= 1;
      _letter_3 = _alphabet[indiceletter_3];
       }

    });
  }

  void changeupletter_3() {
    setState(() {
      if (indiceletter_3 == 25) {
        indiceletter_3 = 0;
         _letter_3 = _alphabet[indiceletter_3];
      } else {
      indiceletter_3 += 1;
      _letter_3 = _alphabet[indiceletter_3];
      }
    });
  }
}
