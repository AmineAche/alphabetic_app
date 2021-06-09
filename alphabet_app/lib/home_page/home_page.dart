import 'package:flutter/material.dart';
import 'component/card_bouton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color_list.dart';

String idxColorBackgroundsave = 'F5F5F5';
int valueback = int.parse(idxColorBackgroundsave, radix: 16);
Color idxColorBackground = new Color(valueback);

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
       idxColorBackgroundsave = (prefs.getString('idx_color_background_values'));
       if (idxColorBackgroundsave == null) {
         idxColorBackgroundsave = 'F5F5F5';
       }
       valueback = int.parse(idxColorBackgroundsave, radix: 16);
       idxColorBackground = new Color(valueback);
       });
    }  
}
  