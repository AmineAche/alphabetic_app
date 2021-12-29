import 'package:alphabet_app/list/letter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:switcher_button/switcher_button.dart';

import '../constants.dart';

class RevisionPage extends StatefulWidget {
  RevisionPage({
    Key key,
    this.maj,
  }) : super(key: key);

  final bool maj;

  @override
  _RevisionPageState createState() => _RevisionPageState();
}

final FlutterTts flutterTts = FlutterTts();
AnimationController _animationController;

class _RevisionPageState extends State<RevisionPage>
    with SingleTickerProviderStateMixin {
  void initState() {
    _loadString();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _saveString();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //Container 1
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
                        padding: EdgeInsets.only(right: width / 70.0),
                        child: IconButton(
                          iconSize: height / 20,
                          icon: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(null),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "$revisionidx / ${revision.length - 1}",
                      style: TextStyle(fontSize: 25),
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
              //Container 2
              child: Padding(
                padding: EdgeInsets.only(bottom: height / 4),
                child: Container(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 7, right: height / 20),
                            child: Container(
                              height: height / 10,
                              width: height / 10,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border:
                                    Border.all(color: idxColorButton, width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                  iconSize: height / 20,
                                  icon: Icon(
                                    Icons.restart_alt,
                                    color: Colors.black,
                                  ),
                                  tooltip: 'Réinitialiser',
                                  onPressed: () {
                                    setState(() {
                                      revisionidx = 0;
                                    });
                                    // sound();
                                  }),
                            ),
                          ),
                          new Flexible(
                            child: SwipeGestureRecognizer(
                              child: Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 3.0),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  //shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    maxWidth: width - 85,
                                    minWidth: width / 5,
                                    maxHeight: height / 2.5,
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text(
                                            widget.maj
                                                ? revision[revisionidx]
                                                    .toUpperCase()
                                                : revision[revisionidx]
                                                    .toLowerCase(),
                                            //"les oiseaux montent sur les arbres car",
                                            // "o",

                                            textAlign: TextAlign.center,

                                            style: TextStyle(
                                                fontSize: height / 7,
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onSwipeRight: () {
                                setState(() {
                                  print("$revisionidx / ${revision.length}");
                                  if (revisionidx == 0) {
                                    revisionidx = revision.length - 1;
                                  } else {
                                    revisionidx--;
                                  }
                                });
                              },
                              onSwipeLeft: () {
                                setState(() {
                                  print("$revisionidx / ${revision.length}");

                                  if (revisionidx == revision.length - 1) {
                                    revisionidx = 0;
                                  } else {
                                    revisionidx++;
                                  }
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 7, left: height / 20),
                            child: Container(
                              height: height / 10,
                              width: height / 10,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border:
                                    Border.all(color: idxColorButton, width: 2),
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
                      SizedBox(
                        height: height / 10,
                      ),

                      Container(
                        height: 30,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,

                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.redAccent,
                            Colors.orange,
                            Colors.lightGreenAccent,
                            Colors.green
                          ]),
                        ),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (_, __) {
                            return SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: null,
                                trackHeight: 0.5,
                                thumbColor: Colors.white,
                                overlayColor: Colors.red.withAlpha(1),
                              ),
                              child: Slider(
                                min: 0,
                                max: revision.length.toDouble() - 1,
                                value: revisionidx.toDouble(),
                                onChanged: (newValue) => {
                                  setState(() => revisionidx = newValue.toInt())
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //ici bouton
          ],
        ),
      ),
    );
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (revisionidx == null) {
        revisionidx = 0;
      }
      prefs.setInt('indiceRev', revisionidx);
    });
  }

  _loadString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      revisionidx = (prefs.getInt('indiceRev'));
      if (revisionidx == null) {
        revisionidx = 0;
      }
    });
  }

  Future sound() async {
    // await flutterTts.setVoice({"name": "fr-fr-x-frc-local", "locale": "fr-FR"});
    // await flutterTts.setLanguage("fr-FR");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.3);

    await flutterTts.speak(revision[revisionidx]);
  }
}
