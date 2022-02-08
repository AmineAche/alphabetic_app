import 'package:alphabet_app/screen/doubleLettre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:audioplayers/audio_cache.dart';
import '../constants.dart';
import '../list/letter_list.dart';
import 'dart:io' show Platform;

class SlidePage extends StatefulWidget {
  SlidePage({
    Key key,
    this.indiceletterbefore,
    this.letterMaj,
  }) : super(key: key);

  final int indiceletterbefore;
  final bool letterMaj;

  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  final FlutterTts flutterTts = FlutterTts();
  // AudioCache audioCache = AudioCache();

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1A.image, context);
    precacheImage(image1E.image, context);
    precacheImage(image1I.image, context);
    precacheImage(image1O.image, context);
    precacheImage(image1U.image, context);

    precacheImage(image2A.image, context);
    precacheImage(image2E.image, context);
    precacheImage(image2I.image, context);
    precacheImage(image2O.image, context);
    precacheImage(image2U.image, context);
    super.didChangeDependencies();
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

  int indiceletternow;
  String lettre;
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

    return Scaffold(
      backgroundColor: idxColorBackground,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height / 10,
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
                      padding: EdgeInsets.only(right: width / 70),
                      child: IconButton(
                        iconSize: height / 20,
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 2),
                  child: Container(
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
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: idxColorButton,
                    ),
                    child: SizedBox(
                      child: IconButton(
                        iconSize: height / 20,
                        icon: Icon(
                          Icons.filter_2_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoubleLettre(
                                      indiceletterbefore2: indiceletternow,
                                      letterMaj2: activeMaj,
                                    )),
                          );
                        },
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
          Container(
            height: (8 * height) / 10,
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          changedownletter();
                        });
                      },
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.expand_less,
                            color: idxColorConsonne,
                            size: height / 12,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onPanUpdate: (DragUpdateDetails details) {
                        distancex = details.globalPosition.dx - initialx;
                        distancey = details.globalPosition.dy - initialy;

                        setState(() {
                          if (etape == 0) {
                            case1lettre(width);
                          } else if (etape == 1) {
                            duosound(width);
                          }
                        });
                      },
                      onPanStart: (DragStartDetails details) {
                        initialx = details.globalPosition.dx;
                        initialy = details.globalPosition.dy;
                        setState(() {
                          if (indiceletternow == null) {
                            lettre = alphabet[widget.indiceletterbefore];
                          }
                          firstsound(lettre);
                        });
                      },
                      onPanEnd: (DragEndDetails details) {
                        setState(() {
                          initialx = 0.0;
                          initialy = 0.0;
                          etape = 0;
                          onetimesound = 0;
                        });
                      },
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 7,
                        width: height / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            (lettre == null)
                                ? (widget.letterMaj)
                                    ? alphabet[widget.indiceletterbefore]
                                        .toUpperCase()
                                    : alphabet[widget.indiceletterbefore]
                                : (widget.letterMaj)
                                    ? lettre.toUpperCase()
                                    : lettre,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height / 12, color: idxColorConsonne),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          changeupletter();
                        });
                      },
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        height: height / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.expand_more,
                            color: idxColorConsonne,
                            size: height / 12,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //),
                Container(
                  // color: Colors.red,
                  //height: double.infinity,
                  height: (8 * height) / 5,

                  alignment: Alignment.center, // This is needed
                  child: (onetimesound == 1)
                      ? image1A
                      : (onetimesound == 2)
                          ? image1E
                          : (onetimesound == 3)
                              ? image1I
                              : (onetimesound == 4)
                                  ? image1O
                                  : (onetimesound == 5)
                                      ? image1U
                                      : image1,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Colonne_1("a", height, width),
                      Colonne_1("e", height, width),
                      Colonne_1("i", height, width),
                      Colonne_1("o", height, width),
                      Colonne_1("u", height, width),
                    ],
                  ),
                ),
                Container(
                  //height: double.infinity,
                  height: (8 * height) / 10,

                  alignment: Alignment.center, // This is needed
                  child: (onetimesound == 1 && etape == 2)
                      ? image2A
                      : (onetimesound == 2 && etape == 2)
                          ? image2E
                          : (onetimesound == 3 && etape == 2)
                              ? image2I
                              : (onetimesound == 4 && etape == 2)
                                  ? image2O
                                  : (onetimesound == 5 && etape == 2)
                                      ? image2U
                                      : image2,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Colonne_2("a", height, width),
                      Colonne_2("e", height, width),
                      Colonne_2("i", height, width),
                      Colonne_2("o", height, width),
                      Colonne_2("u", height, width),
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

  Widget Colonne_1(String lettreUse, double height, double width) {
    return new GestureDetector(
      child: Container(
        margin: new EdgeInsets.symmetric(horizontal: 5.0),
        height: height / 8,
        width: width / 10,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 0.5),
        ),
        child: Center(
          child: Text(
            (activeMaj) ? lettreUse.toUpperCase() : lettreUse,
            style: TextStyle(
              fontSize: height / 11,
              color: idxColorVoyelle,
            ),
          ),
        ),
      ),
      onTap: () {
        firstsound("$lettreUse");
      },
    );
  }

  Widget Colonne_2(String lettreUse, double height, double width) {
    return new GestureDetector(
      child: Container(
        padding: new EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 2.0),
              height: height / 8,
              width: width / 10,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: Center(
                child: Text(
                  (lettre == null)
                      ? (widget.letterMaj)
                          ? alphabet[widget.indiceletterbefore].toUpperCase()
                          : alphabet[widget.indiceletterbefore]
                      : (widget.letterMaj)
                          ? lettre.toUpperCase()
                          : lettre,
                  style:
                      TextStyle(fontSize: height / 11, color: idxColorConsonne),
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 2.0),
              height: height / 8,
              width: width / 10,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: Center(
                child: Text(
                  (activeMaj) ? lettreUse.toUpperCase() : lettreUse,
                  style:
                      TextStyle(fontSize: height / 11, color: idxColorVoyelle),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        firstsound(lettre + lettreUse);
      },
    );
  }

  Future firstsound(String letter) async {
    MapEntry entry = phonetiques2.entries
        .firstWhere((element) => element.key == letter, orElse: () => null);

    if (entry != null) {
      await flutterTts.speak(entry.value);
    } else {
      await flutterTts.speak(letter);
    }

    print("Akhi t es dans le premier son");
    await flutterTts.setVoice({"name": "Marie", "locale": "fr-FR"});
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.3);
  }

  void changeupletter() {
    setState(() {
      if (indiceletternow == null) {
        indiceletternow = widget.indiceletterbefore;
      }

      print("avant = " + indiceletternow.toString());
      if (indiceletternow >= 25) {
        indiceletternow = 0;
      } else {
        indiceletternow++;
      }
      lettre = alphabet[indiceletternow];
      for (int i = 0; i < voyelle.length; i++) {
        if (lettre == voyelle[i]) {
          print("voyelle");
          if (indiceletternow >= 25) {
            indiceletternow = 0;
          } else {
            indiceletternow++;
          }
        }
      }
      lettre = alphabet[indiceletternow];
      print("apres = " + indiceletternow.toString());
    });
  }

  void changedownletter() {
    setState(() {
      if (indiceletternow == null) {
        indiceletternow = widget.indiceletterbefore;
      }
      print("avant = " + indiceletternow.toString());
      if (indiceletternow <= 0) {
        indiceletternow = 25;
      } else {
        indiceletternow--;
      }
      lettre = alphabet[indiceletternow];
      for (int i = 0; i < voyelle.length; i++) {
        if (lettre == voyelle[i]) {
          print("voyelle");
          if (indiceletternow <= 0) {
            indiceletternow = 25;
          } else {
            indiceletternow--;
          }
        }
      }
      lettre = alphabet[indiceletternow];
      print("apres = " + indiceletternow.toString());
    });
  }

  Future case1lettre(double width) async {
    if ((distancex >= ((width * 24.27) / 100)) &&
        (distancex <= ((width * 48.54) / 100))) {
      print("omg t es dans les premiers bails.");
      //Premieres cases sont au minimum a une distance de 200 et max a 400
      tangente = (distancey.abs() / distancex);
      print("tangente:" + tangente.toString());
      if (distancey < 30 && distancey > -(30)) {
        if ((0.00 <= tangente) && (tangente <= 0.11) && (onetimesound != 3)) {
          onetimesound = 3;
          await flutterTts.speak("i");
        }
      } else if (distancey < -(30)) {
        //   Les 2 cases au dessus ont un y négatif.
        if ((0.52 <= tangente) && (tangente <= 0.90) && (onetimesound != 1)) {
          print("t es dans a");
          onetimesound = 1;
          await flutterTts.speak('a');
        }
        if ((0.18 <= tangente) && (tangente <= 0.48) && (onetimesound != 2)) {
          print("t es dans e");
          onetimesound = 2;
          await flutterTts.speak("e");
        }
      } else if (distancey > 30) {
        if ((0.18 <= tangente) && (tangente <= 0.48) && (onetimesound != 4)) {
          print("Tangentes = $tangente");
          onetimesound = 4;
          await flutterTts.speak('o');
        }
        if ((0.52 <= tangente) && (tangente <= 0.90) && (onetimesound != 5)) {
          print("Tangentes = $tangente");
          onetimesound = 5;
          await flutterTts.speak("u");
        }
        print("t es a la fin de y > 0 et onetime sound = " +
            onetimesound.toString());
        // Pour dire que l etape 1 est bien passé et que mtn on peut passer aux cases apres
      }
      etape = 1;
    } else {
      //print('La personne doit aller jusqu aux 1ere cases.');
    }
  }

  Future duosound(double width) async {
    MapEntry entryA = phonetiques2.entries.firstWhere(
        (element) => element.key == lettre + 'a',
        orElse: () => null);

    MapEntry entryE = phonetiques2.entries.firstWhere(
        (element) => element.key == lettre + 'e',
        orElse: () => null);

    MapEntry entryI = phonetiques2.entries.firstWhere(
        (element) => element.key == lettre + 'i',
        orElse: () => null);

    MapEntry entryO = phonetiques2.entries.firstWhere(
        (element) => element.key == lettre + 'o',
        orElse: () => null);

    MapEntry entryU = phonetiques2.entries.firstWhere(
        (element) => element.key == lettre + 'u',
        orElse: () => null);

    if (distancex >= ((width * 57.3) / 100)) {
      //Premieres cases sont au minimum a une distance de 100 et max a 235
      if (onetimesound == 1) {
        if (entryA != null) {
          await flutterTts.speak(entryA.value);
        } else {
          await flutterTts.speak(lettre + "a");
        }
        print("tu as emprunté le bon chemin 1");
        //await flutterTts.speak(lettre + "a");
      } else if (onetimesound == 2) {
        print("tu as emprunté le bon chemin");
        if (entryE != null) {
          await flutterTts.speak(entryE.value);
        } else {
          await flutterTts.speak(lettre + "e");
        }
        //await flutterTts.speak(lettre + "e");
      } else if (onetimesound == 3) {
        print("tu as emprunté le bon chemin");
        if (entryI != null) {
          await flutterTts.speak(entryI.value);
        } else {
          await flutterTts.speak(lettre + "i");
        }
      } else if (onetimesound == 4) {
        print("tu as emprunté le bon chemin");
        if (entryO != null) {
          await flutterTts.speak(entryO.value);
        } else {
          await flutterTts.speak(lettre + "o");
        }
      } else if (onetimesound == 5) {
        print("tu as emprunté le bon chemin");
        if (entryU != null) {
          await flutterTts.speak(entryU.value);
        } else {
          await flutterTts.speak(lettre + "u");
        }
      }
      etape = 2;
    }

    //print("t es a la fin de duo sound et Onetimesound est maintenant egale a : ");
    //print(onetimesound);
    //print("Tu n est pas aller assez loin pour activer les 2 dernieres cases.");
    else {
      //rien
    }
  }
}
