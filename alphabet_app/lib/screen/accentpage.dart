import 'package:alphabet_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alphabet_app/list/letter_list.dart';

class AccentPage extends StatefulWidget {
  @override
  _AccentPageState createState() => _AccentPageState();
}

class _AccentPageState extends State<AccentPage> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: idxColorBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        //title: const Text('Slide'),
        leading: Container(
          decoration: BoxDecoration(
            color: idxColorButton,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: new IconButton(
            icon: new Icon(Icons.home),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        actions: [
          Container(
            //height: 50,
            decoration: BoxDecoration(
              color: idxColorButton,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: new IconButton(
              icon: new Icon(Icons.settings),
              color: Colors.white,
              onPressed: () => Navigator.pushNamed(context, '/settingPage'),
            ),
          ),
        ],

        backgroundColor: idxColorBackground,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                height: 45,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1),
                ),
                child: Center(
                    child: Text(
                  accent[accentidx],
                  style: TextStyle(fontSize: 60, color: Colors.blue),
                )),
              ),
              onSwipeRight: () {
                setState(() {
                  accentright();
                });
              },
              onSwipeLeft: () {
                setState(() {
                  accentleft();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            new SwipeGestureRecognizer(
              child: Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 2),
                ),
                child: Center(
                  child: Text(
                    voyelleaccent[lettreidx],
                    style: TextStyle(fontSize: 90, color: Colors.blue),
                  ),
                ),
              ),
              onSwipeRight: () {
                setState(() {
                  lettreright();
                });
              },
              onSwipeLeft: () {
                setState(() {
                  lettreleft();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idxColorBackgroundsave = (prefs.getString('idx_color_background_values'));
      if (idxColorBackgroundsave == null) {
        idxColorBackgroundsave = 'F5F5F5';
      }
      valueback = int.parse(idxColorBackgroundsave, radix: 16);
      idxColorBackground = new Color(valueback);
    });
  }

  void accentright() {
    if (accentidx <= 0) {
      accentidx = 3;
    } else {
      accentidx -= 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }

  void accentleft() {
    if (accentidx >= 3) {
      accentidx = 0;
    } else {
      accentidx += 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }

  void lettreleft() {
    if (lettreidx <= 0) {
      lettreidx = 4;
    } else {
      lettreidx -= 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }

  void lettreright() {
    if (lettreidx >= 4) {
      lettreidx = 0;
    } else {
      lettreidx += 1;
    }

    if (lettreidx == 3) {
      accentidx = 0;
    }
  }
}
