import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../color_list.dart';
//import 'home_page.dart';

int idxBtn = 0;
int idxBackground = 0;

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
        appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        //title: const Text('Slide'),
        leading: Container(
          width : width/5,
          decoration: BoxDecoration(
            color: buttonColor[idxBtn],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: new IconButton(
            icon: new Icon(Icons.home),
            color: Colors.white,
            onPressed: () => Navigator.pushNamed(
                      context,
                      '/',
                    ),
          ),
        ),
        backgroundColor: backgroundColor[idxBackground],
        elevation: 0,
      ),
        body: Container (
           margin: new EdgeInsets.symmetric(horizontal: width/8, vertical: height/8),
           color: Colors.white,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container (
              //color: Colors.grey,
              width: width,
              height: height/5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container (
                    child: Text(
                      "Couleur des boutons: ",
                    ),
                  ),
                  Container (
                    //color: Colors.blue,
                    height: height/3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell( 
                      child: Container(
                        padding: new EdgeInsets.symmetric(horizontal: 3, vertical: 3), 
                        //color: Colors.grey,
                        width: 100,
                        decoration: (idxBtn == 0) 
                        ? BoxDecoration(
                          border: Border.all(color: Colors.black)
                        )
                        : BoxDecoration(
                          //border: Border.all(color: Colors.black)
                        ),
                        child: Row(
                          children: [
                            Container( 
                              width: 30,
                              height: 30,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(4.0),
                                color: my_Cyan,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Bleu",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {    
                        setState(() {
                         idxBtn = 0;
                        _saveString();
                        });                      
                      }, 
                      ),
                      InkWell( 
                      child: Container(
                        padding: new EdgeInsets.symmetric(horizontal: 3, vertical: 3), 
                        //color: Colors.grey,
                        width: 100,
                        decoration: (idxBtn == 1) 
                        ? BoxDecoration(
                          border: Border.all(color: Colors.black)
                        )
                        : BoxDecoration(
                          //border: Border.all(color: Colors.black)
                        ),
                      child: Row(
                        children: [
                          Container( 
                            width: 30,
                            height: 30,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(4.0),
                              color: my_Violet,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Violet",
                          ),
                        ],
                      ),
                      ),
                      onTap: () {                          
                        setState(() {
                         idxBtn = 1;
                        _saveString();
                        });
                      }, 
                      ),
                    ],
                    ),
                  ),

                  Container (
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell( 
                      child: Container(
                        padding: new EdgeInsets.symmetric(horizontal: 3, vertical: 3), 
                        width: 100,
                        decoration: (idxBtn == 2) 
                        ? BoxDecoration(
                          border: Border.all(color: Colors.black)
                        )
                        : BoxDecoration(
                          //border: Border.all(color: Colors.black)
                        ),
                        child: Row(
                        children: [
                          Container( 
                            width: 30,
                            height: 30,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(4.0),
                              color: my_Rose,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rose",
                          ),
                        ],
                      ),
                      ),
                      onTap: () {                          
                        setState(() {
                         idxBtn = 2;
                        _saveString();
                        });
                      }, 
                      ),
                      InkWell( 
                      child: Container(
                        padding: new EdgeInsets.symmetric(horizontal: 3, vertical: 3), 
                        width: 100,
                        decoration: (idxBtn == 3) 
                        ? BoxDecoration(
                          border: Border.all(color: Colors.black)
                        )
                        : BoxDecoration(
                          //border: Border.all(color: Colors.black)
                        ),
                        child: Row(
                        children: [
                          Container( 
                            width: 30,
                            height: 30,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(4.0),
                              color: my_Rouge,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rouge",
                          ),
                        ],
                      ),
                      ),
                      onTap: () {                          
                        setState(() {
                         idxBtn = 3;
                        _saveString();
                        });
                      }, 
                      ),
                    ],
                    ),
                  ),
                ],
              ),
              ),
            Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container (
                    child: Text(
                      "Fond: ",
                    ),
                  ),
                 InkWell( 
                      child: Container(
                        padding: new EdgeInsets.symmetric(horizontal: 3, vertical: 3), 
                    //color: Colors.grey,
                    width: 100,
                    child: Row(
                      children: [
                        Container( 
                          width: 30,
                            height: 30,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(4.0),
                            color: my_Cyan,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Basique",
                        ),
                      ],
                    ),
                  ),
                   onTap: () {                          
                        setState(() {
                         idxBackground = 0;
                        _saveString();
                        });
                      }, 
                 ),
                 InkWell( 
                      child: Container(
                        padding: new EdgeInsets.symmetric(horizontal: 3, vertical: 3), 
                    //color: Colors.grey,
                    width: 100,
                    height: 80,
                    child: Column(
                      children: [
                        Container( 
                          
                          child: Image(
                            //color: Colors.white,
                            image: AssetImage('assets/icons/background_custom.jpg'),
                            //width: 100,
                            height: height/9,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Custom",
                        ),
                      ],
                    ),
                  ),
                  onTap: () {                          
                        setState(() {
                         idxBackground = 1;
                        _saveString();
                        });
                      },
                 ),  
                ],
             ),
            ),
          ],
    ),
        ),
    );
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (idxBtn == null) {
      idxBtn = 0;
    }
    prefs.setInt('idx_color_button_value', idxBtn);

    if (idxBackground == null) {
      idxBackground = 0;
    }
    prefs.setInt('idx_color_background_value', idxBackground);
   }

   Future _load() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {
         idxBtn = (prefs.getInt('idx_color_button_value'));
       if (idxBtn == null) {
         idxBtn = 0;
       }

        idxBackground = (prefs.getInt('idx_color_background_value'));
        if (idxBackground == null) {
          idxBackground = 0;
        }
       });
    }
}