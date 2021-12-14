import 'package:alphabet_app/screen/revision.dart';
import 'package:alphabet_app/sound_recorder.dart';
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SYLLABES',
        routes: {
          '/': (context) => MyHomePage(),
          '/record': (context) => RecordPage(),
          '/settingPage': (context) => SettingPage(),
          '/reliable': (context) => ReliablePage(),
          '/accent': (context) => AccentPage(),
          '/slide': (context) => SlidePage(),
          '/revision': (context) => RevisionPage(),
        },
        initialRoute: '/');
  }
}
