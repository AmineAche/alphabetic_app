import 'package:alphabet_app/home_page/onBoarding.dart';
import 'package:alphabet_app/screen/doubleLettre.dart';
import 'package:alphabet_app/screen/revision.dart';
import 'package:alphabet_app/sound_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page/home_page.dart';
import 'screen/settings.dart';
import 'screen/accentpage.dart';
import 'screen/slidablepage.dart';

int isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  await prefs.setInt("onBoard", 1);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          '/onBoarding': (context) => OnBoarding(),
          '/record': (context) => RecordPage(),
          '/settingPage': (context) => SettingPage(),
          '/accent': (context) => AccentPage(),
          '/slide': (context) => SlidePage(),
          '/revision': (context) => RevisionPage(),
          '/doubleLettre': (context) => DoubleLettre(),
        },
        initialRoute: isViewed == 0 || isViewed == null ? '/onBoarding' : '/');
  }
}
