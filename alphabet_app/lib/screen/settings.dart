import 'package:flutter/material.dart';
//import 'package:flutter_button/flutter_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import '../constants.dart';
//import '../color_list.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//import 'home_page.dart';
import '../list/letter_list.dart';

String idxBtnSave;
String idxBackSave;

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

  @override
  @override
  Widget build(BuildContext context) {
    _saveString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                text: 'Couleur boutons',
              ),
              const Tab(text: 'Couleur du fond'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      elevation: 3.0,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Select a color'),
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
                      child: const Text('Modifier la couleur des boutons'),
                      color: idxColorButton,
                      textColor: useWhiteForeground(currentColor)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
                    ),
                  ]),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      elevation: 3.0,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Select a color'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: currentColor,
                                  onColorChanged: changeColorBackground,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Modifier la couleur du fond'),
                      color: idxColorBackground,
                      textColor: useWhiteForeground(currentColor)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (idxBtnSave == null) {
        print('null');
        idxBtnSave = 'FF8333e8';
      }

      idxBtnSave = (prefs.getString('idx_color_button_values'));
      value = int.parse(idxBtnSave, radix: 16);
      idxColorButton = new Color(value);

      if (idxBackSave == null) {
        idxBackSave = 'F5F5F5';
      }
      idxBackSave = (prefs.getString('idx_color_background_values'));
      valueback = int.parse(idxBtnSave, radix: 16);
      idxColorButton = new Color(valueback);
    });
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (idxBtnSave == null) {
      print("null");
      idxBtnSave = 'FF8333e8';
    }
    prefs.setString('idx_color_button_values', idxBtnSave);

    if (idxBackSave == null) {
      idxBackSave = 'F5F5F5';
    }
    prefs.setString('idx_color_background_values', idxBackSave);
  }
}
