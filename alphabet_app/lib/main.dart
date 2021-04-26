import 'package:flutter/material.dart';
import 'screen/card_bouton.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYLLABES',
      routes: {
      '/': (context) => MyHomePage(),
      '/secondPage': (context) => SecondPage(),
    },
    initialRoute: '/');
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
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

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SETTINGS'),
        ),
        body: Center(
          //color: Colors.red,
          child: BoutonWidget(),
        ),
      );
  }
}