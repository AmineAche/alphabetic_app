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



class BoutonWidget extends StatefulWidget {
  @override
  _BoutonWidget createState() => _BoutonWidget();
}

class _BoutonWidget extends State<BoutonWidget> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  bool activeMaj = false;
  @override
  Widget build(BuildContext context) {
    _saveString();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Button3D(
                        style: StyleOf3dButton(
                          backColor: idxColorButton,
                          topColor: idxColorButton,
                          borderRadius: BorderRadius.only(),
                        ),
                        height: 50,
                        width: 80,
                        onPressed: () {
                          setState(() {
                            print('Maj : $activeMaj');
                            visibilityidx = 1;
                          });
                        },
                        child: Text(
                          "a",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Button3D(
                        style: StyleOf3dButton(
                          backColor: idxColorButton,
                          topColor: idxColorButton,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        height: 50,
                        width: 80,
                        onPressed: () {
                          setState(() {
                            visibilityidx = 2;
                          });
                        },
                        child: Text(
                          "a a",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Button3D(
                        style: StyleOf3dButton(
                          backColor: idxColorButton,
                          topColor: idxColorButton,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        height: 50,
                        width: 80,
                        onPressed: () {
                          setState(() {
                            visibilityidx = 3;
                          });
                        },
                        child: Text(
                          "a a a",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: idxColorButton,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "Aa",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: SwitcherButton(
                          value: false,
                          offColor: Colors.grey,
                          onColor: my_Violet,
                          onChange: (value) {
                            activeMaj = value;
                            setState(() {
                              if (activeMaj) {
                                letter_1 = letter_1.toUpperCase();
                                letter_2 = letter_2.toUpperCase();
                                letter_3 = letter_3.toUpperCase();
                              } else {
                                letter_1 = letter_1.toLowerCase();
                                letter_2 = letter_2.toLowerCase();
                                letter_3 = letter_3.toLowerCase();
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: idxColorButton,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settingPage');
                    },
                  ),
                )
              ],
            ),
          ),
          FavoriteWidget(isMaj: activeMaj, visibility: visibilityidx),
          BottomBar(),
        ],
      ),
    );
  }

  _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      visibilityidx = (prefs.getInt('vis'));
      if (visibilityidx == null) {
        visibilityidx = 1;
      }

      idxColorButtonsave = (prefs.getString('idx_color_button_values'));
       if (idxColorButtonsave == null) {
         print('t es nul');
         idxColorButtonsave = 'FF8333e8';
       }
       print(idxColorButtonsave);
        value = int.parse(idxColorButtonsave, radix: 16);
        idxColorButton = new Color(value);
        print(idxColorButton);
    });
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (visibilityidx == null) {
        visibilityidx = 1;
      }
      prefs.setInt('vis', visibilityidx);
    });
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
    _loadString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _saveString();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.visibility; i++)
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                height: size.height * 0.38,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: caseColor,
                  border: Border.all(color: Colors.white, width: 2),
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
                                style:
                                    TextStyle(fontSize: 90, color: Colors.blue),
                              )
                            : Text(
                                '$letter_1',
                                style:
                                    TextStyle(fontSize: 90, color: Colors.red),
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
                                        fontSize: 90, color: Colors.blue),
                                  )
                                : Text(
                                    '$letter_2',
                                    style: TextStyle(
                                        fontSize: 90, color: Colors.red),
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
                                        fontSize: 90, color: Colors.blue),
                                  )
                                : Text(
                                    '$letter_3',
                                    style: TextStyle(
                                        fontSize: 90, color: Colors.red),
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
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                color: caseColor,
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                icon: Icon(
                  Icons.volume_up,
                  color: Colors.black,
                ),
                tooltip: 'Ecouter',
                onPressed: () {
                  sound();
                }),
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

  List<String> audio = ["dab_file.mp3", "do_file.mp3"];

  void sound() {
    if (widget.visibility == 3) {
      lettertot = letter_1 + letter_2 + letter_3;
    } else if (widget.visibility == 2) {
      lettertot = letter_1 + letter_2;
    } else {
      lettertot = letter_1;
    }

    lettertot = lettertot.toLowerCase();

    if (audio.contains(lettertot + "_file.mp3")) {
      audioCache.play(lettertot + "_file.mp3");
    }
  }
}

class BottomBar extends StatefulWidget {
  //const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button3D(
                  height: 50,
                  width: 85,
                  style: StyleOf3dButton(
                    backColor: idxColorButton,
                    topColor:idxColorButton,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    String lettre;
                    lettre = letter_1.toLowerCase();
                    if ((lettre == 'a') ||
                        (lettre == 'e') ||
                        (lettre == 'i') ||
                        (lettre == 'o') ||
                        (lettre == 'u') ||
                        (lettre == 'y')) {
                      lettre = alphabet[indiceletter_1 + 1];
                    }

                    //Navigator.pushNamed(context, '/reliable',
                    //arguments: lettre);
                    Navigator.pushNamed(context, '/slide', arguments: lettre);
                  },
                  child: Text(
                    "RELIABLE",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Button3D(
                  width: 85,
                  height: 50,
                  style: StyleOf3dButton(
                    backColor: idxColorButton,
                    topColor: idxColorButton,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/accent',
                    );
                  },
                  child: Text(
                    "ACCENT",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
