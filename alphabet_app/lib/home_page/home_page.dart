import 'package:flutter/material.dart';
import 'component/card_bouton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color_list.dart';
import '../list/letter_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: idxColorBackground,
      body: Center(
        //color: Colors.red,
        child: BoutonWidget(),
      ),
    );
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idxBackSave = (prefs.getString('idx_color_background_values'));
      if (idxBackSave == null) {
        idxBackSave = 'ffF5F5F5';
      }
      valueback = int.parse(idxBackSave, radix: 16);
      idxColorButton = new Color(valueback);
      idxColorBackground = new Color(valueback);
      print("Color du background: " + idxColorBackground.toString());
    });
  }
}
