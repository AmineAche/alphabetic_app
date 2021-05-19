import 'package:flutter/material.dart';
import 'component/card_bouton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

List<Color> colors = [
  Colors.pink[100],
  Colors.blue[100],
  Colors.blueGrey,
];
int idx = 0;


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
          backgroundColor: colors[idx],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'SYLLABES',
             style: GoogleFonts.lato(
              color: Colors.white,
              ),
            ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settingPage');
              },
            )
          ],
        ),
        body: Center(
          //color: Colors.red,
          child: BoutonWidget(),
        ),
      );
  }

     Future _load() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {
       idx = (prefs.getInt('idx_color_value'));
       if (idx == null) {
         idx = 0;
       }
       });
    }  
}
  