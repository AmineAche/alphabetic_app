import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    color: idxColorButton,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(150),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 10,
                        height: height / 10,
                        child: ElevatedButton(
                          child: Text(
                            activeMaj ? 'A' : "a",
                            style: TextStyle(
                              fontSize: height / 20,
                            ),
                          ),
                          onPressed: () {
                            visibilityidx = 1;
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.green;
                                return idxColorButton;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 10,
                        height: height / 10,
                        child: ElevatedButton(
                          child: Text(
                            activeMaj ? 'A A' : "a a",
                            style: TextStyle(
                              fontSize: height / 20,
                            ),
                          ),
                          onPressed: () {
                            visibilityidx = 2;
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.green;
                                return idxColorButton;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 6,
                        height: height / 10,
                        child: ElevatedButton(
                          child: Text(
                            activeMaj ? 'A A A' : "a a a",
                            style: TextStyle(
                              fontSize: height / 20,
                            ),
                          ),
                          onPressed: () {
                            visibilityidx = 3;
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(150),
                                ),
                                side:
                                    BorderSide(color: Colors.grey, width: 0.5),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.green;
                                return idxColorButton;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width / 7),
                  child: Container(
                    height: height / 9,
                    width: width / 6,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      border: Border.all(color: Colors.grey, width: 0.5),
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
                          width: width / 17,
                          height: height / 17,
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
                            "A ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width / 9,
                  height: height / 1,
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
                      bottomLeft: Radius.circular(150),
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
                )
              ],
            ),
          ),
          FavoriteWidget(isMaj: activeMaj, visibility: visibilityidx),
          BottomBar(visible: visibilityidx),
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
