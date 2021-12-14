import 'package:alphabet_app/color_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../list/letter_list.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  bool lightTheme = true;
  Color currentColor = Colors.limeAccent;

  void changeColorButton(Color color) {
    setState(() {
      currentColor = color;
      String colorString = currentColor.toString();
      idxBtnSave = colorString.split('(0x')[1].split(')')[0];
      value = int.parse(idxBtnSave, radix: 16);
      idxColorButton = new Color(value);
    });
  }

  void changeColorBackground(Color color) {
    setState(() {
      currentColor = color;
      String colorString = currentColor.toString();
      idxBackSave = colorString.split('(0x')[1].split(')')[0];
      valueback = int.parse(idxBackSave, radix: 16);
      idxColorBackground = new Color(valueback);
    });
  }

  void changeColorVoyCons(Color color) {
    setState(() {
      if (!isCons) {
        currentColor = color;
        String colorString = currentColor.toString();
        idxVoySave = colorString.split('(0x')[1].split(')')[0];
        valueback = int.parse(idxVoySave, radix: 16);
        idxColorVoyelle = new Color(valueback);
      } else {
        currentColor = color;
        String colorString = currentColor.toString();
        idxConsSave = colorString.split('(0x')[1].split(')')[0];
        valueback = int.parse(idxConsSave, radix: 16);
        idxColorConsonne = new Color(valueback);
      }
    });
  }

  void resetColor() {
    setState(() {
      idxColorVoyelle = Color(0xff0b16e2);
      idxVoySave = "ff0b16e2";

      idxColorConsonne = Color(0xffff0000);
      idxConsSave = "ffff0000";

      idxColorBackground = Color(0xffF5F5F5);
      idxBackSave = "ffF5F5F5";

      idxColorButton = Color(0xFF8333e8);
      idxBtnSave = "FF8333e8";
    });
  }

  @override
  Widget build(BuildContext context) {
    _saveString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: width / 5,
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
            ],
          ),
          //backgroundColor: idxColorBackground,

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            width: width,
            height: height / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: height / 30,
                ),
                Container(
                  height: height / 7.5,
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  width: width / 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Couleur des boutons :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width / 40,
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Choisir une couleur'),
                                    backgroundColor: Color(0xffdddddd),
                                    content: SingleChildScrollView(
                                      child: BlockPicker(
                                        pickerColor: currentColor,
                                        onColorChanged: changeColorButton,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            color: idxColorButton,
                            textColor: useWhiteForeground(currentColor)
                                ? const Color(0xffffffff)
                                : const Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Container(
                  height: height / 7.5,
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  width: width / 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Couleur du fond :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width / 40,
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Choisir une couleur'),
                                    backgroundColor: Color(0xffdddddd),
                                    content: SingleChildScrollView(
                                      child: BlockPicker2(
                                        pickerColor: currentColor,
                                        onColorChanged: changeColorBackground,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            color: idxColorBackground,
                            textColor: useWhiteForeground(currentColor)
                                ? const Color(0xffffffff)
                                : const Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Container(
                  height: height / 3.1,
                  margin: new EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Couleur des lettres :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width / 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Voyelles : ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: RaisedButton(
                                          onPressed: () {
                                            isCons = false;
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Choisir une couleur'),
                                                  backgroundColor:
                                                      Color(0xffdddddd),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: BlockPicker(
                                                      pickerColor: currentColor,
                                                      onColorChanged:
                                                          changeColorVoyCons,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                            'A',
                                            textAlign: TextAlign.center,
                                          ),
                                          color: Color(0xFFd5e5e4),
                                          textColor: idxColorVoyelle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: width / 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Consomnes : ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width / 50,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 4.0, left: 4.0),
                                          child: RaisedButton(
                                            onPressed: () {
                                              isCons = true;
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Choisir une couleur'),
                                                    backgroundColor:
                                                        Color(0xffdddddd),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: BlockPicker(
                                                        pickerColor:
                                                            currentColor,
                                                        onColorChanged:
                                                            changeColorVoyCons,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text(
                                              'B',
                                              textAlign: TextAlign.center,
                                            ),
                                            color: Color(0xFFd5e5e4),
                                            textColor: idxColorConsonne,
                                            // useWhiteForeground(currentColor)
                                            //     ? const Color(0xffffffff)
                                            //     : const Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      isCons = true;
                      resetColor();
                    },
                    child: const Text(
                      'REINITIALISER',
                      textAlign: TextAlign.center,
                    ),
                    color: Color(0xFFd5e5e4),
                    textColor: Colors.black,
                    // useWhiteForeground(currentColor)
                    //     ? const Color(0xffffffff)
                    //     : const Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idxBtnSave = (prefs.getString('idx_color_button_values'));
      if (idxBtnSave == null) {
        idxBtnSave = 'FF8333e8';
      }
      value = int.parse(idxBtnSave, radix: 16);
      idxColorButton = new Color(value);

      idxBackSave = (prefs.getString('idx_color_background_values'));
      if (idxBackSave == null) {
        idxBackSave = 'ffF5F5F5';
      }
      valueback = int.parse(idxBackSave, radix: 16);
      idxColorBackground = new Color(valueback);

      idxVoySave = (prefs.getString('idx_color_voyelle_values'));
      if (idxVoySave == null) {
        idxVoySave = 'ff0b16e2';
      }
      valuevoy = int.parse(idxVoySave, radix: 16);
      idxColorVoyelle = new Color(valuevoy);

      idxConsSave = (prefs.getString('idx_color_consonne_values'));
      if (idxConsSave == null) {
        idxConsSave = 'ffff0000';
      }
      valuecons = int.parse(idxConsSave, radix: 16);
      idxColorConsonne = new Color(valuecons);
    });
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (idxBtnSave == null) {
      idxBtnSave = 'ff8333e8';
    }
    prefs.setString('idx_color_button_values', idxBtnSave);

    if (idxBackSave == null) {
      idxBackSave = 'ffF5F5F5';
    }
    prefs.setString('idx_color_background_values', idxBackSave);

    if (idxConsSave == null) {
      idxConsSave = 'ffff0000';
    }
    prefs.setString('idx_color_consonne_values', idxConsSave);

    if (idxVoySave == null) {
      idxVoySave = 'ff0b16e2';
    }
    prefs.setString('idx_color_voyelle_values', idxVoySave);
  }
}
