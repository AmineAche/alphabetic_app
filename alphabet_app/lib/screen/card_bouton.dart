import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _lettertot;
int indiceletter_1 = 0;
int indiceletter_2 = 1;
int indiceletter_3 = 2;
var _letter_1 = _alphabet[indiceletter_1];
var _letter_2 = _alphabet[indiceletter_2];
var _letter_3 = _alphabet[indiceletter_3];
bool activeMaj = false;
int visibilityidx = 1;

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
    'z',
  ];

class BoutonWidget extends StatefulWidget {
  @override
  _BoutonWidget createState() => _BoutonWidget();
}

class _BoutonWidget extends State<BoutonWidget> {
  @override
  void initState() { 
        print('Avant load');
        print(visibilityidx);
        //print(activeMaj);
        print('Fin Avant load');
     _load();
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    _saveString();
      //  print('Debut du widget');
      //  print(visibilityidx);
      //  print(activeMaj);
      //  print('Fin Debut load');
    return Container(
      child: Column(
      children: [
        Container(
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
            Button3D(
              onPressed: () {
                String lettre;
                lettre = _letter_1.toLowerCase();
              if ((lettre == 'a' )
                    || (lettre == 'e')
                    || (lettre == 'i')
                    || (lettre == 'o')
                    || (lettre == 'u')
                    || (lettre == 'y')) {
                      lettre =  _alphabet[indiceletter_1 + 1];
                    }

                Navigator.pushNamed(context, '/reliable',
                arguments: lettre);
              },
              child: Text("RELIABLE"),
            ),
            Container(
              child: SwitcherButton(
                value: activeMaj,
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

      //  activeMaj = (prefs.getBool('boolValue'));
      //  if (activeMaj == null) {
      //     activeMaj = false;
      //  }

        print('Debut du load');
        print(visibilityidx);
        //print(activeMaj);
        print('Fin du load');
     });
   }

   _saveString() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       if (visibilityidx == null) {
          visibilityidx = 1;
       }
       if (activeMaj == null) {
         activeMaj = false;
       }
       prefs.setInt('vis', visibilityidx);
       prefs.setBool('boolValue', activeMaj);
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
    _saveString();
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.visibility; i++)
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(),
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 1),
                  ],
                ),
                child: Center(
                  child: (i == 0)
                  ? ((_letter_1 == 'a' )
                    || (_letter_1 == 'e')
                    || (_letter_1 == 'i')
                    || (_letter_1 == 'o')
                    || (_letter_1 == 'u')
                    || (_letter_1 == 'y')
                    || (_letter_1 == 'A')
                    || (_letter_1 == 'E')
                    || (_letter_1 == 'I')
                    || (_letter_1 == 'O')
                    || (_letter_1 == 'U')
                    || (_letter_1 == 'Y') )
                    ? Text(
                      '$_letter_1',
                    style: TextStyle(fontSize: 90, color: Colors.blue),
                    )
                    : Text(
                      '$_letter_1',
                    style: TextStyle(fontSize: 90, color: Colors.red),
                    )

                  : (i == 1)
                  ? ((_letter_2 == 'a')
                    || (_letter_2 == 'e')
                    || (_letter_2 == 'i')
                    || (_letter_2 == 'o')
                    || (_letter_2 == 'u')
                    || (_letter_2 == 'y') 
                    || (_letter_2 == 'A')
                    || (_letter_2 == 'E')
                    || (_letter_2 == 'I')
                    || (_letter_2 == 'O')
                    || (_letter_2 == 'U')
                    || (_letter_2 == 'Y'))
                    ? Text(
                      '$_letter_2',
                    style: TextStyle(fontSize: 90, color: Colors.blue),
                    )
                    : Text(
                      '$_letter_2',
                    style: TextStyle(fontSize: 90, color: Colors.red),
                    )


                  : ((_letter_3 == 'a')
                    || (_letter_3 == 'e')
                    || (_letter_3 == 'i')
                    || (_letter_3 == 'o')
                    || (_letter_3 == 'u')
                    || (_letter_3 == 'y') 
                    || (_letter_3 == 'A')
                    || (_letter_3 == 'E')
                    || (_letter_3 == 'I')
                    || (_letter_3 == 'O')
                    || (_letter_3 == 'U')
                    || (_letter_3 == 'Y'))
                    ? Text(
                      '$_letter_3',
                    style: TextStyle(fontSize: 90, color: Colors.blue),
                    )
                    : Text(
                      '$_letter_3',
                    style: TextStyle(fontSize: 90, color: Colors.red),
                    )

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
      if (indiceletter_1 == null) {
        indiceletter_1 = 0;
        _letter_1 = _alphabet[indiceletter_1];
      } else {
        _letter_1 = _alphabet[indiceletter_1];
      }

      indiceletter_2 = (prefs.getInt('indice2'));
      if (indiceletter_2 == null) {
        indiceletter_2 = 1;
        _letter_2 = _alphabet[indiceletter_2];
      } else {
        _letter_2 = _alphabet[indiceletter_2];
      }

      indiceletter_3 = (prefs.getInt('indice3'));
      if (indiceletter_3 == null) {
        indiceletter_3 = 2;
        _letter_3 = _alphabet[indiceletter_3];
      } else {
        _letter_3 = _alphabet[indiceletter_3];
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
            }else {
              indiceletter_1 -= 1;
            }
          } else {
            if (indiceletter_2 <= 0) {
              indiceletter_2 = 25;
            }else {
              indiceletter_2 -= 1;
            }
          }
        }
      }
      if (widget.isMaj) {
        _letter_1 = _alphabet[indiceletter_1].toUpperCase();
        _letter_2 = _alphabet[indiceletter_2].toUpperCase();
      } else {
        _letter_1 = _alphabet[indiceletter_1];
        _letter_2 = _alphabet[indiceletter_2];
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
            }else {
            indiceletter_1 += 1;
            }
          } else {
            if (indiceletter_2 >= 25) {
              indiceletter_2 = 0;
            }else {
            indiceletter_2 += 1;
            }
          }
        }
      }
      if (widget.isMaj) {
        _letter_1 = _alphabet[indiceletter_1].toUpperCase();
        _letter_2 = _alphabet[indiceletter_2].toUpperCase();
      } else {
        _letter_1 = _alphabet[indiceletter_1];
        _letter_2 = _alphabet[indiceletter_2];
      }
    });
  }

  void changedownletter_2() {
    setState(() {

      if (indiceletter_2 <= 0) {
        indiceletter_2 = 25;         //De base 
      } else {
        indiceletter_2 -= 1;
      }

      if ((indiceletter_2 == indiceletter_1) && (indiceletter_2 == indiceletter_3)) {
          if (indiceletter_2 <= 0) {
            indiceletter_2 = 25;                  // si 1 = 2 et 2 = 3
          } else {
            indiceletter_2 -= 1;
          }
      } else if ((indiceletter_2 == indiceletter_1) && (indiceletter_2 != indiceletter_3)) {
        if (indiceletter_2 <= 0) {
          indiceletter_2 = 25;                  //si 1 = 2 mais 2 != 3
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
      } else if ((indiceletter_2 != indiceletter_1) && (indiceletter_2 == indiceletter_3)){
        if (widget.visibility <= 2) {
          if (indiceletter_3 <= 0) {
            indiceletter_3 = 25;                  //si 1 != 2 mais 2 == 3
          } else {
            indiceletter_3 -= 1;
          }
        } else {
          if (indiceletter_2 <= 0) {
            indiceletter_2 = 25;                  //si 1 != 2 mais 2 == 3
          } else {
            indiceletter_2 -= 1;
          }
        }
        if (indiceletter_2 == indiceletter_1) {
          if (indiceletter_2 <= 0) {
          indiceletter_2 = 25;                  //si 1 = 2 mais 2 != 3
        } else {
          indiceletter_2 -= 1;
        }
      }
    }

      if (widget.isMaj) {
        _letter_2 = _alphabet[indiceletter_2].toUpperCase();
        _letter_3 = _alphabet[indiceletter_3].toUpperCase();
      } else {
        _letter_2 = _alphabet[indiceletter_2];
        _letter_3 = _alphabet[indiceletter_3];
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
      if ((indiceletter_2 == indiceletter_1) && (indiceletter_2 == indiceletter_3)) {
        if (indiceletter_2 >= 25) {
          indiceletter_2 = 0;
        } else {
          indiceletter_2 += 1;
        }
      } else if ((indiceletter_2 == indiceletter_1) && (indiceletter_2 != indiceletter_3)) {
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
        } else if ( (indiceletter_2 == indiceletter_3) && (indiceletter_2 != indiceletter_1) ){
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
        _letter_2 = _alphabet[indiceletter_2].toUpperCase();
        _letter_3 = _alphabet[indiceletter_3].toUpperCase();
      } else {
        _letter_2 = _alphabet[indiceletter_2];
        _letter_3 = _alphabet[indiceletter_3];
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
        _letter_3 = _alphabet[indiceletter_3].toUpperCase();
      } else {
        _letter_3 = _alphabet[indiceletter_3];
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
          }else {
          indiceletter_3 += 1;
          }
        }
      }
      if (widget.isMaj) {
        _letter_3 = _alphabet[indiceletter_3].toUpperCase();
      } else {
        _letter_3 = _alphabet[indiceletter_3];
      }
    });
  }

  List<String> audio = ["dab_file.mp3", "do_file.mp3"];

  void sound() {
    if (widget.visibility == 3) {
      _lettertot = _letter_1 +
          _letter_2 +
          _letter_3;
    } else if (widget.visibility == 2) {
      _lettertot = _letter_1 + _letter_2;
    } else {
      _lettertot = _letter_1;
    }

    _lettertot = _lettertot.toLowerCase();

    if (audio.contains(_lettertot + "_file.mp3")) {
      audioCache.play(_lettertot + "_file.mp3");
    }
  }
}