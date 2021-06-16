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
import 'card_slidable.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    _saveString();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height / 10,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height / 10,
                  decoration: BoxDecoration(
                    color: idxColorButton,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Button3D(
                        style: StyleOf3dButton(
                          backColor: Colors.transparent,
                          topColor: idxColorButton,
                          borderRadius: BorderRadius.only(),
                        ),
                        height: height / 11,
                        width: width / 10,
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
                            fontSize: height / 16,
                          ),
                        ),
                      ),
                      Button3D(
                        style: StyleOf3dButton(
                             backColor: Colors.transparent,
                          topColor: idxColorButton,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        height: height / 11,
                        width: width / 10,
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
                            fontSize: height / 16,
                          ),
                        ),
                      ),
                      Button3D(
                        style: StyleOf3dButton(
                          backColor: Colors.transparent,
                          topColor: idxColorButton,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        height: height / 11,
                        width: width / 10,
                        onPressed: () {
                          setState(() {
                            visibilityidx = 3;
                          });
                        },
                        child: Text(
                          "a a a",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: height / 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height / 9,
                  width: width / 6,
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
                          " a",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height / 16,
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
                      Container(
                        child: Text(
                          "A",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height / 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width / 10,
                  height: height / 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: idxColorButton,
                  ),
                  child: SizedBox(
                    child: IconButton(
                      //iconSize: 30,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settingPage');
                      },
                    ),
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




