import 'package:flutter/material.dart';
import 'card_bouton.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Color> colors = [
  Colors.pink[100],
  Colors.blue[100],
  Colors.black,
];
int idx = 2;


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
    print(idx);
        return Scaffold(
          backgroundColor: colors[idx],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('SYLLABES'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/secondPage');
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
       int oe = (prefs.getInt('idx_color_value'));
       idx = oe;
       if (idx == null) {
         idx = 0;
       }
       print(idx);
       });
   }
  }
  