import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';


class ReliablePage extends StatefulWidget {
  @override
  _ReliablePageState createState() => _ReliablePageState();
}

String lettre;
int idx = 2;
List<Color> colors = [
  Colors.pink[100],
  Colors.blue[100],
  Colors.black,
];

class _ReliablePageState extends State<ReliablePage> {
  String waitdrag = "";
  String waitdrag2 = "";
  String waitdrag3 = "";
  String waitdrag4 = "";
  String waitdrag5 = "";

AudioCache audioCache = AudioCache();
List<String> audio = ["dab_file.mp3", "do_file.mp3",];

    @override
  void initState() { 
     _load();
     super.initState();
   }

       Future _load() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {
       int oe = (prefs.getInt('idx_color_value'));
       idx = oe;
       if (idx == null) {
         idx = 0;
       }
       print(idx);
       });
   }

  @override
  Widget build(BuildContext context) {
    lettre = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: colors[idx],
      appBar: AppBar(
        title: const Text('Reliable'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable(
              data: lettre,
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  border: Border.all(),
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 1),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$lettre',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, color: Colors.red),
                  ),
                ),
              ),
              feedback: Container(
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  border: Border.all(),
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 1),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$lettre',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.lightGreenAccent,
              child: Row(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$waitdrag',
                                      style: TextStyle(
                                        fontSize: 30, color: Colors.red
                                      ),
                                    ),
                                  ),
                                );
                              },
                            onAccept: (String lettre) {
                              //print(lettre);
                              // print(waitdrag);
                              setState(() {
                                print('waitdrag avant l operation');
                                print(waitdrag);
                                if (waitdrag == null) {
                                  print('waitdrag est null');
                                } else {
                                  waitdrag = lettre;
                                }
                              });
                              print('waitdrag apres l operation');
                              print(waitdrag);
                              if (audio.contains(lettre + 'a' + "_file.mp3")) {
                              audioCache.play(lettre + 'a' + "_file.mp3");
                            }
                            },
                            ),
                            DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$waitdrag2',
                                      style: TextStyle(
                                        fontSize: 30, color: Colors.red
                                      ),
                                    ),
                                  ),
                                );
                              },
                            onAccept: (String lettre) {
                              //print(lettre);
                              // print(waitdrag);
                              setState(() {
                                print('waitdrag2 avant l operation');
                                print(waitdrag2);
                                if (waitdrag2 == null) {
                                  print('waitdrag2 est null');
                                } else {
                                  waitdrag2 = lettre;
                                }
                              });
                              print('waitdrag2 apres l operation');
                              print(waitdrag2);
                              if (audio.contains(lettre + 'e' + "_file.mp3")) {
                                audioCache.play(lettre + 'e' + "_file.mp3");
                              }
                            },
                            ),
                            DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$waitdrag3',
                                      style: TextStyle(
                                        fontSize: 30, color: Colors.red
                                      ),
                                    ),
                                  ),
                                );
                              },
                            onAccept: (String lettre) {
                              //print(lettre);
                              // print(waitdrag);
                              setState(() {
                                print('waitdrag3 avant l operation');
                                print(waitdrag3);
                                if (waitdrag3 == null) {
                                  print('waitdrag3 est null');
                                } else {
                                  waitdrag3 = lettre;
                                }
                              });
                              print('waitdrag3 apres l operation');
                              print(waitdrag3);
                            if (audio.contains(lettre + 'i' + "_file.mp3")) {
                              audioCache.play(lettre + 'i' + "_file.mp3");
                            }
                            },
                            ),
                            DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$waitdrag4',
                                      style: TextStyle(
                                        fontSize: 30, color: Colors.red
                                      ),
                                    ),
                                  ),
                                );
                              },
                            onAccept: (String lettre) {
                              //print(lettre);
                              // print(waitdrag);
                              setState(() {
                                print('waitdrag4 avant l operation');
                                print(waitdrag4);
                                if (waitdrag4 == null) {
                                  print('waitdrag4 est null');
                                } else {
                                  waitdrag4 = lettre;
                                 
                                }
                              });
                              print('waitdrag4 apres l operation');
                              print(waitdrag4);
                              if (audio.contains(lettre + 'o' + "_file.mp3")) {
                                audioCache.play(lettre + 'o' + "_file.mp3");
                              }
                            },
                            ),
                            DragTarget<String>(
                              builder: (
                                BuildContext context,
                                List<dynamic> accepted,
                                List<dynamic> rejected,
                              ) {
                                return Container(
                                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey,
                                    border: Border.all(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 1
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$waitdrag5',
                                      style: TextStyle(
                                        fontSize: 30, color: Colors.red
                                      ),
                                    ),
                                  ),
                                );
                              },
                            onAccept: (String lettre) {
                              //print(lettre);
                              // print(waitdrag);
                              setState(() {
                                print('waitdrag5 avant l operation');
                                print(waitdrag5);
                                if (waitdrag5 == null) {
                                  print('waitdrag5 est null');
                                } else {
                                  waitdrag5 = lettre;

                                }
                              });
                              print('waitdrag5 apres l operation');
                              print(waitdrag5);
                              if (audio.contains(lettre + 'u' + "_file.mp3")) {
                                audioCache.play(lettre + 'u' + "_file.mp3");
                              }
                            },
                            ),
                          ],
                  ),
                  ),
                  Container(
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 1),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'a',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 1),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'e',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 1),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'i',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 1),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'o',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(color: Colors.white, spreadRadius: 1),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'u',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
