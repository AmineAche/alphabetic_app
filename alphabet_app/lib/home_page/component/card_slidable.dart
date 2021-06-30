import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../../color_list.dart';
import '../../list/letter_list.dart';
import '../../list/letter_list.dart';
import '../../list/letter_list.dart';
import '../../list/letter_list.dart';
import '../../list/list_audio.dart';
import '../../list/letter_list.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'bottom_bar.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key, this.isMaj: false, this.visibility})
      : super(key: key);

  final bool isMaj;
  final int visibility;
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  void initState() {
    _loadString();
    _load();
    super.initState();
  }

  AudioCache audioCache = AudioCache();
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    _load();
    _saveString();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.visibility; i++)
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: width / 200),
                height: height / 3,
                width: width / 4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 1.5),
                  // boxShadow: [
                  //   BoxShadow(color: Colors.white, spreadRadius: 1),
                  // ],
                ),
                child: Center(
                    child: (i == 0)
                        ? ((letter_1 == 'a') ||
                                (letter_1 == 'e') ||
                                (letter_1 == 'i') ||
                                (letter_1 == 'o') ||
                                (letter_1 == 'u') ||
                                (letter_1 == 'y') ||
                                (letter_1 == 'A') ||
                                (letter_1 == 'E') ||
                                (letter_1 == 'I') ||
                                (letter_1 == 'O') ||
                                (letter_1 == 'U') ||
                                (letter_1 == 'Y'))
                            ? Text(
                                '$letter_1',
                                style: TextStyle(
                                    fontSize: height / 4,
                                    color: idxColorVoyelle),
                              )
                            : Text(
                                '$letter_1',
                                style: TextStyle(
                                    fontSize: height / 4,
                                    color: idxColorConsonne),
                              )
                        : (i == 1)
                            ? ((letter_2 == 'a') ||
                                    (letter_2 == 'e') ||
                                    (letter_2 == 'i') ||
                                    (letter_2 == 'o') ||
                                    (letter_2 == 'u') ||
                                    (letter_2 == 'y') ||
                                    (letter_2 == 'A') ||
                                    (letter_2 == 'E') ||
                                    (letter_2 == 'I') ||
                                    (letter_2 == 'O') ||
                                    (letter_2 == 'U') ||
                                    (letter_2 == 'Y'))
                                ? Text(
                                    '$letter_2',
                                    style: TextStyle(
                                        fontSize: height / 4,
                                        color: idxColorVoyelle),
                                  )
                                : Text(
                                    '$letter_2',
                                    style: TextStyle(
                                        fontSize: height / 4,
                                        color: idxColorConsonne),
                                  )
                            : ((letter_3 == 'a') ||
                                    (letter_3 == 'e') ||
                                    (letter_3 == 'i') ||
                                    (letter_3 == 'o') ||
                                    (letter_3 == 'u') ||
                                    (letter_3 == 'y') ||
                                    (letter_3 == 'A') ||
                                    (letter_3 == 'E') ||
                                    (letter_3 == 'I') ||
                                    (letter_3 == 'O') ||
                                    (letter_3 == 'U') ||
                                    (letter_3 == 'Y'))
                                ? Text(
                                    '$letter_3',
                                    style: TextStyle(
                                        fontSize: height / 4,
                                        color: idxColorVoyelle),
                                  )
                                : Text(
                                    '$letter_3',
                                    style: TextStyle(
                                        fontSize: height / 4,
                                        color: idxColorConsonne),
                                  )),
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
          Padding(
            padding: EdgeInsets.only(top: width / 7, left: height / 20),
            child: Container(
              height: height / 10,
              width: height / 10,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(color: idxColorButton, width: 2),
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
    );
  }

  _loadString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      indiceletter_1 = (prefs.getInt('indice'));
      if (indiceletter_1 == null) {
        indiceletter_1 = 0;
        letter_1 = alphabet[indiceletter_1];
      } else {
        letter_1 = alphabet[indiceletter_1];
      }

      indiceletter_2 = (prefs.getInt('indice2'));
      if (indiceletter_2 == null) {
        indiceletter_2 = 1;
        letter_2 = alphabet[indiceletter_2];
      } else {
        letter_2 = alphabet[indiceletter_2];
      }

      indiceletter_3 = (prefs.getInt('indice3'));
      if (indiceletter_3 == null) {
        indiceletter_3 = 2;
        letter_3 = alphabet[indiceletter_3];
      } else {
        letter_3 = alphabet[indiceletter_3];
      }
      idxVoySave = (prefs.getString('idx_color_voyelle_values'));
      if (idxVoySave == null) {
        idxVoySave = 'FF0b16e2';
      }
      valuevoy = int.parse(idxVoySave, radix: 16);
      idxColorVoyelle = new Color(valuevoy);

      idxConsSave = (prefs.getString('idx_color_consonne_values'));
      if (idxConsSave == null) {
        idxConsSave = 'FFff0000';
      }
      valuecons = int.parse(idxConsSave, radix: 16);
      idxColorConsonne = new Color(valuecons);

      print('amine');
      print(idxColorVoyelle);
      print(idxColorConsonne);
    });
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (indiceletter_1 == null) {
        indiceletter_1 = 0;
        indiceletter_2 = 0;
        indiceletter_3 = 0;
      }
      prefs.setInt('indice', indiceletter_1);
      prefs.setInt('indice2', indiceletter_2);
      prefs.setInt('indice3', indiceletter_3);
    });
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

  void changedownletter_1() {
    setState(() {
      if (indiceletter_1 <= 0) {
        indiceletter_1 = 25;
        if (indiceletter_1 == indiceletter_2) {
          if (widget.visibility > 1) {
            indiceletter_1 -= 1;
          } else {
            indiceletter_2 -= 1;
          }
        }
      } else {
        indiceletter_1 -= 1;
        if (indiceletter_1 == indiceletter_2) {
          if (widget.visibility > 1) {
            if (indiceletter_1 <= 0) {
              indiceletter_1 = 25;
            } else {
              indiceletter_1 -= 1;
            }
          } else {
            if (indiceletter_2 <= 0) {
              indiceletter_2 = 25;
            } else {
              indiceletter_2 -= 1;
            }
          }
        }
      }
      if (widget.isMaj) {
        letter_1 = alphabet[indiceletter_1].toUpperCase();
        letter_2 = alphabet[indiceletter_2].toUpperCase();
      } else {
        letter_1 = alphabet[indiceletter_1];
        letter_2 = alphabet[indiceletter_2];
      }
    });
  }

  void changeupletter_1() {
    setState(() {
      if (indiceletter_1 >= 25) {
        indiceletter_1 = 0;
        if (indiceletter_1 == indiceletter_2) {
          if (widget.visibility > 1) {
            indiceletter_1 += 1;
          } else {
            indiceletter_2 += 1;
          }
        }
      } else {
        indiceletter_1 += 1;
        if (indiceletter_1 == indiceletter_2) {
          if (widget.visibility > 1) {
            if (indiceletter_1 >= 25) {
              indiceletter_1 = 0;
            } else {
              indiceletter_1 += 1;
            }
          } else {
            if (indiceletter_2 >= 25) {
              indiceletter_2 = 0;
            } else {
              indiceletter_2 += 1;
            }
          }
        }
      }
      if (widget.isMaj) {
        letter_1 = alphabet[indiceletter_1].toUpperCase();
        letter_2 = alphabet[indiceletter_2].toUpperCase();
      } else {
        letter_1 = alphabet[indiceletter_1];
        letter_2 = alphabet[indiceletter_2];
      }
    });
  }

  void changedownletter_2() {
    setState(() {
      if (indiceletter_2 <= 0) {
        indiceletter_2 = 25; //De base
      } else {
        indiceletter_2 -= 1;
      }

      if ((indiceletter_2 == indiceletter_1) &&
          (indiceletter_2 == indiceletter_3)) {
        if (indiceletter_2 <= 0) {
          indiceletter_2 = 25; // si 1 = 2 et 2 = 3
        } else {
          indiceletter_2 -= 1;
        }
      } else if ((indiceletter_2 == indiceletter_1) &&
          (indiceletter_2 != indiceletter_3)) {
        if (indiceletter_2 <= 0) {
          indiceletter_2 = 25; //si 1 = 2 mais 2 != 3
        } else {
          indiceletter_2 -= 1;
        }
        if (indiceletter_2 == indiceletter_3) {
          if (widget.visibility <= 2) {
            if (indiceletter_3 <= 0) {
              indiceletter_3 = 25;
            } else {
              indiceletter_3 -= 1;
            }
          } else {
            if (indiceletter_2 <= 0) {
              indiceletter_2 = 25;
            } else {
              indiceletter_2 -= 1;
            }
          }
        }
      } else if ((indiceletter_2 != indiceletter_1) &&
          (indiceletter_2 == indiceletter_3)) {
        if (widget.visibility <= 2) {
          if (indiceletter_3 <= 0) {
            indiceletter_3 = 25; //si 1 != 2 mais 2 == 3
          } else {
            indiceletter_3 -= 1;
          }
        } else {
          if (indiceletter_2 <= 0) {
            indiceletter_2 = 25; //si 1 != 2 mais 2 == 3
          } else {
            indiceletter_2 -= 1;
          }
        }
        if (indiceletter_2 == indiceletter_1) {
          if (indiceletter_2 <= 0) {
            indiceletter_2 = 25; //si 1 = 2 mais 2 != 3
          } else {
            indiceletter_2 -= 1;
          }
        }
      }

      if (widget.isMaj) {
        letter_2 = alphabet[indiceletter_2].toUpperCase();
        letter_3 = alphabet[indiceletter_3].toUpperCase();
      } else {
        letter_2 = alphabet[indiceletter_2];
        letter_3 = alphabet[indiceletter_3];
      }
    });
  }

  void changeupletter_2() {
    setState(() {
      if (indiceletter_2 >= 25) {
        indiceletter_2 = 0;
      } else {
        indiceletter_2 += 1;
      }
      if ((indiceletter_2 == indiceletter_1) &&
          (indiceletter_2 == indiceletter_3)) {
        if (indiceletter_2 >= 25) {
          indiceletter_2 = 0;
        } else {
          indiceletter_2 += 1;
        }
      } else if ((indiceletter_2 == indiceletter_1) &&
          (indiceletter_2 != indiceletter_3)) {
        if (indiceletter_2 >= 25) {
          indiceletter_2 = 0;
        } else {
          indiceletter_2 += 1;
        }
        if (indiceletter_2 == indiceletter_3) {
          if (widget.visibility <= 2) {
            if (indiceletter_3 >= 25) {
              indiceletter_3 = 0;
            } else {
              indiceletter_3 += 1;
            }
          } else {
            if (indiceletter_2 >= 25) {
              indiceletter_2 = 0;
            } else {
              indiceletter_2 += 1;
            }
          }
        }
      } else if ((indiceletter_2 == indiceletter_3) &&
          (indiceletter_2 != indiceletter_1)) {
        if (widget.visibility <= 2) {
          if (indiceletter_3 >= 25) {
            indiceletter_3 = 0;
          } else {
            indiceletter_3 += 1;
          }
        } else {
          if (indiceletter_2 >= 25) {
            indiceletter_2 = 0;
          } else {
            indiceletter_2 += 1;
          }
          if (indiceletter_2 == indiceletter_1) {
            if (indiceletter_2 >= 25) {
              indiceletter_2 = 0;
            } else {
              indiceletter_2 += 1;
            }
          }
        }
      }

      if (widget.isMaj) {
        letter_2 = alphabet[indiceletter_2].toUpperCase();
        letter_3 = alphabet[indiceletter_3].toUpperCase();
      } else {
        letter_2 = alphabet[indiceletter_2];
        letter_3 = alphabet[indiceletter_3];
      }
    });
  }

  void changedownletter_3() {
    setState(() {
      if (indiceletter_3 <= 0) {
        indiceletter_3 = 25;
        if (indiceletter_3 == indiceletter_2) {
          indiceletter_3 -= 1;
        }
      } else {
        indiceletter_3 -= 1;
        if (indiceletter_3 == indiceletter_2) {
          if (indiceletter_3 <= 0) {
            indiceletter_3 = 25;
          } else {
            indiceletter_3 -= 1;
          }
        }
      }
      if (widget.isMaj) {
        letter_3 = alphabet[indiceletter_3].toUpperCase();
      } else {
        letter_3 = alphabet[indiceletter_3];
      }
    });
  }

  void changeupletter_3() {
    setState(() {
      if (indiceletter_3 >= 25) {
        indiceletter_3 = 0;
        if (indiceletter_3 == indiceletter_2) {
          indiceletter_3 += 1;
        }
      } else {
        indiceletter_3 += 1;
        if (indiceletter_3 == indiceletter_2) {
          if (indiceletter_3 >= 25) {
            indiceletter_3 = 0;
          } else {
            indiceletter_3 += 1;
          }
        }
      }
      if (widget.isMaj) {
        letter_3 = alphabet[indiceletter_3].toUpperCase();
      } else {
        letter_3 = alphabet[indiceletter_3];
      }
    });
  }

  Future sound() async {
    if (widget.visibility == 3) {
      lettertot = letter_1 + letter_2 + letter_3;
    } else if (widget.visibility == 2) {
      lettertot = letter_1 + letter_2;
    } else {
      lettertot = letter_1;
    }

    lettertot = lettertot.toLowerCase();
    print(lettertot);
    //print(await flutterTts.getVoices);
    //await flutterTts.setVoice("fr-fr-x-frc-local");
    await flutterTts.setVoice({"name": "fr-fr-x-frc-local", "locale": "fr-FR"});
    await flutterTts.setLanguage("fr-FR");
    await flutterTts.setPitch(1);

    if (lettertot == "be") {
      await flutterTts.speak("beu");
    } else if (lettertot == "fe") {
      await flutterTts.speak("feu");
    } else if (lettertot == "ge") {
      await flutterTts.speak("geu");
    } else if (lettertot == "gue") {
      await flutterTts.speak("gueu");
    } else if (lettertot == "to") {
      await flutterTts.speak("tau");
    } else if (lettertot == "fo") {
      await flutterTts.speak("fau");
    } else if (lettertot == "ye") {
      await flutterTts.speak("yeu");
    } else if (lettertot == "ve") {
      await flutterTts.speak("veut");
    } else if (lettertot == "pe") {
      await flutterTts.speak("peut");
    } else if (lettertot == "ke") {
      await flutterTts.speak("que");
    } else if (lettertot == "sov") {
      await flutterTts.speak("sove");
    } else if (lettertot == "y") {
      await flutterTts.speak("igrec");
    } else if (lettertot == "aj") {
      await flutterTts.speak("a je");
    } else if (lettertot == "ap") {
      await flutterTts.speak("apeux");
    } else if (lettertot == "aq") {
      await flutterTts.speak("hack");
    } else if (lettertot == "av") {
      await flutterTts.speak("have");
    } else if (lettertot == "ave") {
      await flutterTts.speak("have");
    } else if (lettertot == "aw") {
      await flutterTts.speak("a ou");
    } else if (lettertot == "az") {
      await flutterTts.speak("hazeu");
    } else if (lettertot == "eb") {
      await flutterTts.speak("aibeu");
    } else if (lettertot == "ef") {
      await flutterTts.speak("f");
    } else if (lettertot == "eg") {
      await flutterTts.speak("egg");
    } else if (lettertot == "ei") {
      await flutterTts.speak("ai");
    } else {
      await flutterTts.speak(lettertot);
    }

    // if (audio.contains(lettertot + "_file.mp3")) {
    //   audioCache.play(lettertot + "_file.mp3");
    // }
  }
}
