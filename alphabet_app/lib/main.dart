import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page/home_page.dart';
import 'screen/settings.dart';
import 'screen/reliablepage.dart';
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
      '/': (context) => MyHomePage(),
      '/settingPage': (context) => SettingPage(),
      '/reliable': (context) => ReliablePage(),
    },
    initialRoute: '/');
  }
}

