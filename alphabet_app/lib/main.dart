import 'package:flutter/material.dart';
import 'screen/card_bouton.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYLLABES',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SYLLABES'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Center(
          //color: Colors.red,
          child: BoutonWidget(),
        ),
      ),
    );
  }
}



