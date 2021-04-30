import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'home_page.dart';

int idx = 0;

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
           actions: <Widget>[
             IconButton(
               icon: Icon(
                 Icons.keyboard_return,
                 color: Colors.white,
              ),
               onPressed: () {
                Navigator.pushNamed(context, '/');
               },
             )
           ],
          title: Text('SETTINGS'),
        ),
        body: Center(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button3D(
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.red[400],
                      borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      ),
                    ),
                    height: 50,
                    width: 100,
                    onPressed: () {
                      // setState(() {
                         idx = 0;
                         _saveString();
                      //   visibilityidx = 1;
                      // });
                    },
                    child: Text(
                      "Pink",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Button3D(
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.red[400],
                      borderRadius: BorderRadius.circular(0),
                    ),
                    height: 50,
                    width: 100,
                    onPressed: () {
                      // setState(() {
                         idx = 1;
                         _saveString();
                      //   visibilityidx = 2;
                      // });
                    },
                    child: Text(
                      "Blue",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Button3D(
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.red[400],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: 50,
                    width: 100,
                    onPressed: () {
                      // setState(() {
                         idx = 2;
                         _saveString();
                      //   visibilityidx = 3;
                      // });
                    },
                    child: Text(
                      "Grey",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
        ),
      );
  }
  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (idx == null) {
      idx = 0;
    }
    prefs.setInt('idx_color_value', idx);
   }
}