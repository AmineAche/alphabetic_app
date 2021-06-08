import 'package:flutter/material.dart';
import 'component/card_bouton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color_list.dart';

int idxColorBackground = 0;


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
          backgroundColor: backgroundColor[idxColorBackground],
        body: Center(
          //color: Colors.red,
          child: BoutonWidget(),
        ),
      );
  }

     Future _load() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {
       idxColorBackground = (prefs.getInt('idx_color_background_value'));
       if (idxColorBackground == null) {
         idxColorBackground = 0;
       }
       });
    }  
}
  