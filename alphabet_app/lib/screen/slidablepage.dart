import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';
//import '../color_list.dart';
import '../constants.dart';
import '../list/letter_list.dart';
import '../list/list_audio.dart';

class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

String lettre;

class _SlidePageState extends State<SlidePage> {
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    _load();
    super.initState();
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idxColorButtonsave = (prefs.getString('idx_color_button_values'));
      if (idxColorButtonsave == null) {
        print('null');
        idxColorButtonsave = 'FF8333e8';
      }
      value = int.parse(idxColorButtonsave, radix: 16);
      idxColorButton = new Color(value);

      idxColorBackgroundsave = (prefs.getString('idx_color_background_values'));
      if (idxColorBackgroundsave == null) {
        idxColorBackgroundsave = 'F5F5F5';
      }
      valueback = int.parse(idxColorBackgroundsave, radix: 16);
      idxColorBackground = new Color(valueback);
    });
  }

  var initialx;
  var initialy;
  var distancex;
  var distancey;
  var onetimesound;
  var etape = 0;
  @override
  Widget build(BuildContext context) {
    lettre = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: idxColorBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        //title: const Text('Slide'),
        leading: Container(
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
        actions: [
          Container(
            decoration: BoxDecoration(
              color: idxColorButton,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: new IconButton(
              icon: new Icon(Icons.settings),
              color: Colors.white,
              onPressed: () => Navigator.pushNamed(context, '/settingPage'),
            ),
          ),
        ],
        backgroundColor: idxColorBackground,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                // onPanCancel: () {
                //   print('pan cancel');
                // },
                // onPanDown: (_) {
                //   print('pan down');
                // },
                onPanUpdate: (DragUpdateDetails details) {
                  //print('pan update'); // won't trigger
                  distancex = details.globalPosition.dx - initialx;
                  //print("Distance x : $distancex");
                  distancey = details.globalPosition.dy - initialy;
                  //print("Distance y : $distancey");
                  if (etape == 0) {
                    case1lettre();
                    print(onetimesound);
                  } else if (etape == 1) {
                    duosound();
                    print(onetimesound);
                  }
                },
                onPanStart: (DragStartDetails details) {
                  print('pan start');
                  initialx = details.globalPosition.dx;
                  initialy = details.globalPosition.dy;
                  firstsound();
                },
                onPanEnd: (DragEndDetails details) {
                  print('pan end'); // won't trigger
                  initialx = 0.0;
                  initialy = 0.0;
                  etape = 0;
                  print("Distance final x : $distancex");
                  print("Distance final y : $distancey");
                },
                child: Container(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    color: backLetterCase,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      lettre,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35, color: Colors.red),
                    ),
                  ),
                ),
                //   onPointerDown: (PointerDownEvent event) =>
                //     setState(() =>
                //      print("OnPointerDown  ==  $event"),
                //      ),
                // onPointerMove: (PointerMoveEvent event) =>
                //     setState((){
                //     print("PointerMoveEvent  ==  $event");
                //     }
                //      ),
                // onPointerUp: (PointerUpEvent event) =>
                //     setState(() =>
                //      print("PointerUpEvent  ==  $event"),
                //      ),
                // behavior: HitTestBehavior.translucent,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backLetterCase,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'a',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backLetterCase,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'e',
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backLetterCase,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'i',
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backLetterCase,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'o',
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 5.0),
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backLetterCase,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          'u',
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: new EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                lettre,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                lettre,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                lettre,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                lettre,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                          ),
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                lettre,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(horizontal: 0.0),
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
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
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
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
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
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
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
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
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backLetterCase,
                              border: Border.all(color: Colors.white, width: 2),
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
      ),
    );
  }

  void firstsound() {
    print("Akhi t es dans le premier son");
    if (audio.contains(lettre + "_file.mp3")) {
      print('Akhi t es rentré dans le if');
      audioCache.play(lettre + "_file.mp3");
    } else {
      print('Akhi t es pas rentré dans le if');
    }
  }

  void case1lettre() {
    var tangente;

    if (onetimesound == null) {
      onetimesound = 0;
    }
    if ((distancex >= 100) && (distancex <= 235)) {
      //Premieres cases sont au minimum a une distance de 100 et max a 235
      tangente = (distancey.abs() / distancex);
      //print("Tangente = $tangente");
      if (distancey < 0) {
        //   Les 2 cases au dessus ont un y négatif.
        if ((0.53 <= tangente) && (tangente <= 0.94) && (onetimesound != 1)) {
          onetimesound = 1;
          if (audio.contains("a_file.mp3")) {
            audioCache.play("a_file.mp3");
          }
        }
        if ((0.01 <= tangente) && (tangente <= 0.52) && (onetimesound != 2)) {
          onetimesound = 2;
          if (audio.contains("e_file.mp3")) {
            audioCache.play("e_file.mp3");
          }
        }
        etape = 1;
      } else {
        if ((0 <= tangente) && (tangente <= 0.42) && (onetimesound != 3)) {
          onetimesound = 3;
          if (audio.contains("i_file.mp3")) {
            audioCache.play("i_file.mp3");
          }
        }
        if ((0.43 <= tangente) && (tangente <= 0.94) && (onetimesound != 4)) {
          onetimesound = 4;
          if (audio.contains("o_file.mp3")) {
            audioCache.play("o_file.mp3");
          }
        }
        etape =
            1; // Pour dire que l etape 1 est bien passé et que mtn on peut passer aux cases apres
      }
    } else {
      //print('La personne doit aller jusqu aux 1ere cases.');
    }
  }

  void duosound() {
    var tangente;

    if (onetimesound == null) {
      print("PK TU PASSES PAR LA  ?");
      onetimesound = 0;
    }

    if (distancex >= 310) {
      //Premieres cases sont au minimum a une distance de 100 et max a 235
      tangente = (distancey.abs() / distancex);
      //print("Tangente = $tangente");
      if (distancey < 0) {
        if ((0.33 <= tangente) && (tangente <= 0.58)) {
          print(onetimesound);
          if (onetimesound == 1) {
            onetimesound = 0;
            print("tu as emprunté le bon chemin 1");
            if (audio.contains(lettre + "a_file.mp3")) {
              audioCache.play(lettre + "a_file.mp3");
            }
          } else {
            print("tu t es trompé de chemin 1");
            if (audio.contains("error.mp3")) {
              audioCache.play("error.mp3");
            }
          }
        }
        if ((0.01 <= tangente) && (tangente <= 0.29)) {
          if (onetimesound == 2) {
            onetimesound = 0;
            print("tu as emprunté le bon chemin");
            if (audio.contains(lettre + "e_file.mp3")) {
              audioCache.play(lettre + "e_file.mp3");
            }
          } else {
            print("tu t es trompé de chemin 2");
            if (audio.contains("error.mp3")) {
              print("tu t es trompé de chemin 2 ET T ES DANS KE IF");
              audioCache.play("error.mp3");
            }
          }
        }
        etape = 0;
      } else {
        if ((0.01 <= tangente) && (tangente <= 0.21)) {
          if (onetimesound == 3) {
            onetimesound = 0;
            print("tu as emprunté le bon chemin");
            if (audio.contains(lettre + "i_file.mp3")) {
              audioCache.play(lettre + "i_file.mp3");
            }
          } else {
            print("tu t es trompé de chemin 3");
            if (audio.contains("error.mp3")) {
              audioCache.play("error.mp3");
            }
          }
        }
        if ((0.26 <= tangente) && (tangente <= 0.49)) {
          if (onetimesound == 4) {
            onetimesound = 0;
            print("tu as emprunté le bon chemin");
            if (audio.contains(lettre + "o_file.mp3")) {
              audioCache.play(lettre + "o_file.mp3");
            }
          } else {
            print("tu t es trompé de chemin 4");
            if (audio.contains("error.mp3")) {
              audioCache.play("error.mp3");
            }
          }
        }
        etape =
            0; // L'etape a bien été réaliser, il faut maintenant repasser par les cases d avant.
      }
      //print("t es a la fin de duo sound et Onetimesound est maintenant egale a : ");
      //print(onetimesound);
    } else {
      //print("Tu n est pas aller assez loin pour activer les 2 dernieres cases.");
    }
  }
}
