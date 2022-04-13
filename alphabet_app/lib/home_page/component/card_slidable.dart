import 'dart:async';
import 'dart:io';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../list/letter_list.dart';
import 'package:animations/animations.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key, this.isMaj: false, this.visibility})
      : super(key: key);

  final bool isMaj;
  final int visibility;

  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>
    with SingleTickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  AnimationController _animationController;

  void initState() {
    _loadString();
    _load();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1050));
    Timer(Duration(milliseconds: 200), () => _animationController.forward());

    super.initState();
    img = imgDown;
  }

  void didChangeDependencies() {
    precacheImage(imgDown.image, context);
    precacheImage(imgUp.image, context);
    precacheImage(img.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    _load();
    _saveString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < widget.visibility; i++)
              new SwipeGestureRecognizer(
                child: FadeTransition(
                  opacity: _animationController,
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: width / 200),
                    height: height / 2,
                    width: width / 5,
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
                              ? Center(
                                  child: Text(
                                    '$letter_1',
                                    style: TextStyle(
                                        fontSize: height / 3.5,
                                        color: idxColorVoyelle),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    '$letter_1',
                                    style: TextStyle(
                                        fontSize: height / 3.5,
                                        color: idxColorConsonne),
                                  ),
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
                                          fontSize: height / 3.5,
                                          color: idxColorVoyelle),
                                    )
                                  : Text(
                                      '$letter_2',
                                      style: TextStyle(
                                          fontSize: height / 3.5,
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
                                  ? Center(
                                      child: Text(
                                        '$letter_3',
                                        style: TextStyle(
                                            fontSize: height / 3.5,
                                            color: idxColorVoyelle),
                                      ),
                                    )
                                  : Text(
                                      '$letter_3',
                                      style: TextStyle(
                                          fontSize: height / 3.5,
                                          color: idxColorConsonne),
                                    ),
                    ),
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
                  setState(
                    () {
                      if (i == 0) {
                        changeupletter_1();
                      } else if (i == 1) {
                        changeupletter_2();
                      } else {
                        changeupletter_3();
                      }
                    },
                  );
                },
              ),
          ],
        ),
        SizedBox(
          width: width / 50,
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: width / 200),
          height: height / 2.5,
          width: width / 9,
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withOpacity(0.5),
          //       spreadRadius: 5,
          //       blurRadius: 7,
          //       offset: Offset(0, 3), // changes position of shadow
          //     ),
          //   ],
          //   border: Border.all(color: idxColorButton, width: 2),
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(50),
          // ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Timer(Duration(seconds: 2), () {
                  setState(() {
                    img = imgDown;
                  });
                });
                sound();
              });
            },
            onTapUp: (tap) {
              setState(() {
                img = imgUp;
              });
            },
            child: img,
          ),
        ),
        // child: IconButton(
        //   iconSize: height / 20,
        //   icon: Icon(
        //     Icons.volume_up,
        //     color: Colors.black,
        //   ),
        //   tooltip: 'Ecouter',
        //   onPressed: () {
        //     sound();
        //   },
        // ),
      ],
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

    //await flutterTts.setVoice({"name": "fr-fr-x-frc-local", "locale": "fr-FR"});
    //print(await flutterTts.getVoices);

    await flutterTts.setVoice({"name": "Marie", "locale": "fr-FR"});
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.4);

    if (Platform.isAndroid) {
      MapEntry entry = phonetiques2.entries.firstWhere(
          (element) => element.key == '$lettertot',
          orElse: () => null);

      if (entry != null) {
        await flutterTts.speak(entry.value);
        print('key = ${entry.key}');
        print('value = ${entry.value}');
      } else {
        await flutterTts.speak(lettertot);
        print("pas dans la map");
      }
    } else {
      MapEntry entry = phonetiques.entries.firstWhere(
          (element) => element.key == '$lettertot',
          orElse: () => null);

      if (entry != null) {
        await flutterTts.speak(entry.value);
        print('key = ${entry.key}');
        print('value = ${entry.value}');
      } else {
        await flutterTts.speak(lettertot);
        print("pas dans la map");
      }
    }
  }
}
