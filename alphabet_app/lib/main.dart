import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/settings.dart';
import 'screen/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYLLABES',
      routes: {
      '/': (context) => MyHomePage(idxbackgroundcolor: 1),
      '/secondPage': (context) => SecondPage(),
    },
    initialRoute: '/');
  }
}

