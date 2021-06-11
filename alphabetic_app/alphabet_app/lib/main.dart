import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page/home_page.dart';
import 'screen/settings.dart';
import 'screen/reliablepage.dart';
import 'screen/accentpage.dart';
import 'screen/slidablepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SYLLABES',
      routes: {
      '/': (context) => MyHomePage(),
      '/settingPage': (context) => SettingPage(),
      '/reliable': (context) => ReliablePage(),
      '/accent': (context) => AccentPage(),
      '/slide': (context) => SlidePage(),
    },
    initialRoute: '/');
  }
}

