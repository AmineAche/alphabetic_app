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
      idxVoySave = "FF0b16e2";

      idxColorConsonne = Color(0xffff0000);
      idxConsSave = "FFff0000";

      idxColorBackground = Color(0xffF5F5F5);
      idxBackSave = "FFF5F5F5";

      idxColorButton = Color(0xFF8333e8);
      idxBtnSave = "FF8333e8";
    });
  }

  @override
  Widget build(BuildContext context) {
    _saveString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //toolbarHeight: height / 6,
          //leadingWidth: width / 10,

          elevation: 1,
          automaticallyImplyLeading: false,
          leading: Container(
            //height: 5,
            decoration: BoxDecoration(
              color: idxColorButton,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: new IconButton(
              icon: new Icon(Icons.home),
              color: Colors.white,
              onPressed: () => Navigator.pushNamed(
                context,
                '/',
              ),
            ),
          ),
          //backgroundColor: idxColorBackground,
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: <Widget>[
              const Tab(
                text: 'Couleurs',
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Couleur des boutons :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width / 40,
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Select a color'),
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
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Couleur du fond :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width / 40,
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            elevation: 3.0,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Select a color'),
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
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Couleur des lettres :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width / 40,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Voyelles :     ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: RaisedButton(
                                        onPressed: () {
                                          isCons = false;
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Select a color'),
                                                backgroundColor:
                                                    Color(0xffdddddd),
                                                content: SingleChildScrollView(
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
                                        child: const Text('A'),
                                        color: Color(0xFFd5e5e4),
                                        textColor: idxColorVoyelle,
                                        // useWhiteForeground(currentColor)
                                        //     ? const Color(0xffffffff)
                                        //     : const Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Consomnes :',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: RaisedButton(
                                        onPressed: () {
                                          isCons = true;
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Select a color'),
                                                backgroundColor:
                                                    Color(0xffdddddd),
                                                content: SingleChildScrollView(
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
                                          'B',
                                        ),
                                        color: Color(0xFFd5e5e4),
                                        textColor: idxColorConsonne,
                                        // useWhiteForeground(currentColor)
                                        //     ? const Color(0xffffffff)
                                        //     : const Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                        'RESET',
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
          ],
        ),
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
        idxBackSave = 'FFF5F5F5';
      }
      valueback = int.parse(idxBackSave, radix: 16);
      idxColorBackground = new Color(valueback);

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
    });
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (idxBtnSave == null) {
      idxBtnSave = 'FF8333e8';
    }
    prefs.setString('idx_color_button_values', idxBtnSave);

    if (idxBackSave == null) {
      idxBackSave = 'FFF5F5F5';
    }
    prefs.setString('idx_color_background_values', idxBackSave);

    if (idxConsSave == null) {
      idxConsSave = 'FFff0000';
    }
    prefs.setString('idx_color_consonne_values', idxConsSave);

    if (idxVoySave == null) {
      idxVoySave = 'FF0b16e2';
    }
    prefs.setString('idx_color_voyelle_values', idxVoySave);
  }
}
