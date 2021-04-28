import 'package:flutter/material.dart';
import 'card_bouton.dart';

List<Color> colors = [
  Colors.pink[100],
  Colors.blue[100],
  Colors.grey[100],
];
//int idx = 2;

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.idxbackgroundcolor: 0,})
      : super(key: key);
 
  final int idxbackgroundcolor;
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: colors[idxbackgroundcolor],
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
  }
  