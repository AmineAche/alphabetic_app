import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../../color_list.dart';
import '../../list/list_audio.dart';
import '../../list/letter_list.dart';
import 'bottom_bar.dart';

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
    //Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    _saveString();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.visibility; i++)
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                height: height / 3,
                width: width / 4,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: idxColorButton, width: 2),
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
                                    TextStyle(fontSize: height / 4, color: Colors.blue),
                              )
                            : Text(
                                '$letter_1',
                                style:
                                    TextStyle(fontSize: height / 4, color: Colors.red),
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
                                        fontSize: height / 4, color: Colors.blue),
                                  )
                                : Text(
                                    '$letter_2',
                                    style: TextStyle(
                                        fontSize: height / 4, color: Colors.red),
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
                                        fontSize: height / 4, color: Colors.blue),
                                  )
                                : Text(
                                    '$letter_3',
                                    style: TextStyle(
                                        fontSize: height / 4, color: Colors.red),
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
            padding: EdgeInsets.only(top: width / 7, left: height / 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: idxColorButton, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
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