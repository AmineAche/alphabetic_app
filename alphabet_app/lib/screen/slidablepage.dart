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
  int onetimesound;
  var etape = 0;
  double tangente;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    lettre = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: idxColorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 8,
                  height: height / 5,
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
                  width: width / 8,
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
                    onPressed: () =>
                        Navigator.pushNamed(context, '/settingPage'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (8 * height) / 10,
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
                    print("Distance y : $distancey");
                    print("Etape : $etape");
                    print("onetimesound : $onetimesound");
                    print("tangente : $tangente");
                    setState(() {
                    if (etape == 0) {
                      case1lettre(width);
                      //print(onetimesound);
                    } else if (etape == 1) {
                      duosound();
                      //print(onetimesound);
                    }
                    });
                  },
                  onPanStart: (DragStartDetails details) {
                    print('pan start');
                    print("width: $width");
                    initialx = details.globalPosition.dx;
                    initialy = details.globalPosition.dy;
                    setState(() {
                      //onetimesound = 1;
                      firstsound(lettre);
                    });
                  },
                  onPanEnd: (DragEndDetails details) {
                    print('pan end'); // won't trigger

                    setState(() {
                      initialx = 0.0;
                      initialy = 0.0;
                      etape = 0;
                      onetimesound = 0;
                    });
                    print("Distance final x : $distancex");
                    print("Distance final y : $distancey");
                  },
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0),
                    height: height / 4,
                    width: width / 8,
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
                  //height: double.infinity,
                  height: (8 * height) / 10,

                  alignment: Alignment.center, // This is needed
                  child: Image.asset(

                    (onetimesound == 1)
                        ? "assets/fleches/Fleches_1_A.png"
                        : (onetimesound == 2)
                        ? "assets/fleches/Fleches_1_E.png"
                        : (onetimesound == 3)
                        ? "assets/fleches/Fleches_1_I.png"
                        :(onetimesound == 4)
                        ? "assets/fleches/Fleches_1_O.png"
                        : (onetimesound == 5)
                        ? "assets/fleches/Fleches_1_U.png"

                        : "assets/fleches/Fleches_1.png",

                    fit: BoxFit.contain,
                    height: (7 * height) / 10,

                    //width: 300,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new GestureDetector(
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 8,
                        width: width / 10,
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
                      onTap: () {
                        firstsound("a");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 8,
                        width: width / 10,
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
                      onTap: () {
                        firstsound("e");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 8,
                        width: width / 10,
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
                      onTap: () {
                        firstsound("i");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 8,
                        width: width / 10,
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
                      onTap: () {
                        firstsound("o");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 8,
                        width: width / 10,
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
                      onTap: () {
                        firstsound("u");
                      },
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: double.infinity,
                  height: (8 * height) / 10,

                  alignment: Alignment.center, // This is needed
                  child: Image.asset(
                    (onetimesound == 1)
                        ? "assets/fleches/Fleches_2_A.png"
                        : (onetimesound == 2)
                        ? "assets/fleches/Fleches_2_E.png"
                        : (onetimesound == 3)
                        ? "assets/fleches/Fleches_2_I.png"
                        :(onetimesound == 4)
                        ? "assets/fleches/Fleches_2_O.png"
                        : (onetimesound == 5)
                        ? "assets/fleches/Fleches_2_U.png"

                        : "assets/fleches/Fleches_2.png",
                        
                    fit: BoxFit.contain,
                    height: (7 * height) / 10,

                    //width: 300,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new GestureDetector(
                      child: Container(
                        color: Colors.red,
                        padding: new EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          children: [
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  lettre,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'a',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        firstsound("va");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        color: Colors.red,
                        padding: new EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          children: [
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  lettre,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'e',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        firstsound("ve");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        color: Colors.red,
                        padding: new EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          children: [
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  lettre,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'i',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        firstsound("vi");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        color: Colors.red,
                        padding: new EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          children: [
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  lettre,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'o',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        firstsound("vo");
                      },
                      ),
                      new GestureDetector(
                      child: Container(
                        color: Colors.red,
                        padding: new EdgeInsets.symmetric(horizontal: 0.0),
                        child: Row(
                          children: [
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  lettre,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.red),
                                ),
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              height: height / 8,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backLetterCase,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'u',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        firstsound("vu");
                      },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void firstsound(String letter) {
    print("Akhi t es dans le premier son");
    if (audio.contains(letter + "_file.mp3")) {
      print('Akhi t es rentré dans le if');
      print(letter + "_file.mp3");
      audioCache.play(letter + "_file.mp3");
    } else {
      print('Akhi t es pas rentré dans le if');
    }
  }

  void case1lettre(double width) {
    // if (onetimesound == null) {
    //   onetimesound = 0;
    // }
    if ((distancex >= ( (width * 24.27) / 100 ) ) && (distancex <= ( (width * 48.54) / 100 ))) {
      print("omg t es dans les premiers bails.");
      //Premieres cases sont au minimum a une distance de 200 et max a 400
      tangente = (distancey.abs() / distancex);
      if (distancey < 30 && distancey > -(30)) {
        if ((0.00 <= tangente) && (tangente <= 0.11) && (onetimesound != 3)) {
          onetimesound = 3;
          if (audio.contains("i_file.mp3")) {
            audioCache.play("i_file.mp3");
          }
        }
      } else if (distancey < -(30)) {
        print("t es dans y < -30");
        //   Les 2 cases au dessus ont un y négatif.
        if ((0.40 <= tangente) && (tangente <= 0.55) && (onetimesound != 1)) {
          print("t es dans a");
          onetimesound = 1;
          if (audio.contains("a_file.mp3")) {
            audioCache.play("a_file.mp3");
          }
        }
        if ((0.18 <= tangente) && (tangente <= 0.35) && (onetimesound != 2)) {
          print("t es dans e");
          onetimesound = 2;
          if (audio.contains("e_file.mp3")) {
            audioCache.play("e_file.mp3");
          }
        }
        print("t es a la fin de y < 0 et onetime sound = " + onetimesound.toString());
        etape = 1;
      } else if (distancey > 30) {
        print("t es dans y > 30");
      print("Tangentes = $tangente");
      print("onetimesound = " + onetimesound.toString());
        if  ((0.18 <= tangente) && (tangente <= 0.35) && (onetimesound != 4)){
          print("Tangentes = $tangente");
          onetimesound = 4;
          if (audio.contains("o_file.mp3")) {
            audioCache.play("o_file.mp3");
          }
        }
        if ((0.40 <= tangente) && (tangente <= 0.55) && (onetimesound != 5)) {
print("Tangentes = $tangente");
          onetimesound = 5;
          if (audio.contains("u_file.mp3")) {
            audioCache.play("u_file.mp3");
          }
        }
        print("t es a la fin de y > 0 et onetime sound = " + onetimesound.toString());
        etape = 1; // Pour dire que l etape 1 est bien passé et que mtn on peut passer aux cases apres
      }
    } else {
      //print('La personne doit aller jusqu aux 1ere cases.');
    }
  }

  void duosound() {


    if (distancex >= 420) {
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
