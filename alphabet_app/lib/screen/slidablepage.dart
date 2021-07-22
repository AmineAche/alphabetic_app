import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audio_cache.dart';
//import '../color_list.dart';
import '../home_page/component/card_slidable.dart';
import '../constants.dart';
import '../list/letter_list.dart';
import '../list/list_audio.dart';

class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

String lettre;

class _SlidePageState extends State<SlidePage> {
  final FlutterTts flutterTts = FlutterTts();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1A.image, context);
    precacheImage(image1E.image, context);
    precacheImage(image1I.image, context);
    precacheImage(image1O.image, context);
    precacheImage(image1U.image, context);

    precacheImage(image2A.image, context);
    precacheImage(image2E.image, context);
    precacheImage(image2I.image, context);
    precacheImage(image2O.image, context);
    precacheImage(image2U.image, context);
    super.didChangeDependencies();
  }

  Future _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idxColorButtonsave = (prefs.getString('idx_color_button_values'));
      if (idxColorButtonsave == null) {
        print('null');
        idxColorButtonsave = 'FF8333e8';
      }
      value = int.parse(idxColorButtonsave, radix: 16);
      idxColorButton = new Color(value);

      idxColorBackgroundsave = (prefs.getString('idx_color_background_values'));
      if (idxColorBackgroundsave == null) {
        idxColorBackgroundsave = 'F5F5F5';
      }
      valueback = int.parse(idxColorBackgroundsave, radix: 16);
      idxColorBackground = new Color(valueback);
    });
  }

  var initialx;
  var initialy;
  var distancex;
  var distancey;
  int onetimesound;
  var etape = 0;
  double tangente;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    lettre = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: idxColorBackground,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 9,
                  height: height / 10,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.1,
                        blurRadius: 15,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.grey[600], width: 0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(70),
                    ),
                    color: idxColorButton,
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(right: width / 70),
                      child: IconButton(
                        iconSize: height / 20,
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(null),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width / 9,
                  height: height / 10,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.1,
                        blurRadius: 15,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.grey[600], width: 0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(70),
                    ),
                    color: idxColorButton,
                  ),
                  child: SizedBox(
                    child: IconButton(
                      iconSize: height / 20,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/settingPage');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (8 * height) / 10,
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  // onPanCancel: () {
                  //   print('pan cancel');
                  // },
                  // onPanDown: (_) {
                  //   print('pan down');
                  // },
                  onPanUpdate: (DragUpdateDetails details) {
                    //print('pan update'); // won't trigger
                    distancex = details.globalPosition.dx - initialx;
                    //print("Distance x : $distancex");
                    distancey = details.globalPosition.dy - initialy;

                    setState(() {
                      if (etape == 0) {
                        case1lettre(width);
                        //print(onetimesound);
                      } else if (etape == 1) {
                        duosound(width);
                        //print(onetimesound);
                      }
                    });
                  },
                  onPanStart: (DragStartDetails details) {
                    initialx = details.globalPosition.dx;
                    initialy = details.globalPosition.dy;
                    setState(() {
                      //onetimesound = 1;
                      firstsound(lettre);
                    });
                  },
                  onPanEnd: (DragEndDetails details) {
                    setState(() {
                      initialx = 0.0;
                      initialy = 0.0;
                      etape = 0;
                      onetimesound = 0;
                    });
                  },
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 5.0),
                    height: height / 7,
                    width: height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        lettre,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: height / 12, color: Colors.red),
                      ),
                    ),
                  ),
                  //   onPointerDown: (PointerDownEvent event) =>
                  //     setState(() =>
                  //      print("OnPointerDown  ==  $event"),
                  //      ),
                  // onPointerMove: (PointerMoveEvent event) =>
                  //     setState((){
                  //     print("PointerMoveEvent  ==  $event");
                  //     }
                  //      ),
                  // onPointerUp: (PointerUpEvent event) =>
                  //     setState(() =>
                  //      print("PointerUpEvent  ==  $event"),
                  //      ),
                  // behavior: HitTestBehavior.translucent,
                ),
                Container(
                  // color: Colors.red,
                  //height: double.infinity,
                  height: (8 * height) / 5,

                  alignment: Alignment.center, // This is needed
                  child: (onetimesound == 1)
                      ? image1A
                      : (onetimesound == 2)
                          ? image1E
                          : (onetimesound == 3)
                              ? image1I
                              : (onetimesound == 4)
                                  ? image1O
                                  : (onetimesound == 5)
                                      ? image1U
                                      : image1,
                  // child: Image.asset(
                  //   (onetimesound == 1)
                  //       ? "assets/fleches/Fleches_1_A.png"
                  //       : (onetimesound == 2)
                  //           ? "assets/fleches/Fleches_1_E.png"
                  //           : (onetimesound == 3)
                  //               ? "assets/fleches/Fleches_1_I.png"
                  //               : (onetimesound == 4)
                  //                   ? "assets/fleches/Fleches_1_O.png"
                  //                   : (onetimesound == 5)
                  //                       ? "assets/fleches/Fleches_1_U.png"
                  //                       : "assets/fleches/Fleches_1.png",

                  //   fit: BoxFit.contain,
                  //   height: (7 * height) / 10,

                  //   //width: 300,
                  // ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new GestureDetector(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: height / 8,
                          width: width / 10,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          child: Center(
                            child: Text(
                              'a',
                              style: TextStyle(
                                fontSize: height / 11,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          firstsound("a");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: height / 8,
                          width: width / 10,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          child: Center(
                            child: Text(
                              'e',
                              style: TextStyle(
                                  fontSize: height / 11, color: Colors.blue),
                            ),
                          ),
                        ),
                        onTap: () {
                          firstsound("e");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: height / 8,
                          width: width / 10,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          child: Center(
                            child: Text(
                              'i',
                              style: TextStyle(
                                  fontSize: height / 11, color: Colors.blue),
                            ),
                          ),
                        ),
                        onTap: () {
                          firstsound("i");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: height / 8,
                          width: width / 10,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          child: Center(
                            child: Text(
                              'o',
                              style: TextStyle(
                                  fontSize: height / 11, color: Colors.blue),
                            ),
                          ),
                        ),
                        onTap: () {
                          firstsound("o");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          height: height / 8,
                          width: width / 10,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 0.5),
                          ),
                          child: Center(
                            child: Text(
                              'u',
                              style: TextStyle(
                                  fontSize: height / 11, color: Colors.blue),
                            ),
                          ),
                        ),
                        onTap: () {
                          firstsound("u");
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blue,
                  //height: double.infinity,
                  height: (8 * height) / 10,

                  alignment: Alignment.center, // This is needed
                  child: (onetimesound == 1 && etape == 2)
                      ? image2A
                      : (onetimesound == 2 && etape == 2)
                          ? image2E
                          : (onetimesound == 3 && etape == 2)
                              ? image2I
                              : (onetimesound == 4 && etape == 2)
                                  ? image2O
                                  : (onetimesound == 5 && etape == 2)
                                      ? image2U
                                      : image2,
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //         color: Colors.red,
                  //         height: height / 8,
                  //         width: width / 10,
                  //         child: Center(child: Text("-->"))),
                  //     Container(
                  //         color: Colors.red,
                  //         height: height / 8,
                  //         width: width / 10,
                  //         child: Center(child: Text("-->"))),
                  //     Container(
                  //         color: Colors.red,
                  //         height: height / 8,
                  //         width: width / 10,
                  //         child: Center(child: Text("-->"))),
                  //     Container(
                  //         color: Colors.red,
                  //         height: height / 8,
                  //         width: width / 10,
                  //         child: Center(child: Text("-->"))),
                  //     Container(
                  //         color: Colors.red,
                  //         height: height / 8,
                  //         width: width / 10,
                  //         child: Center(child: Text("-->"))),
                  //   ],
                  // ),

                  // child: Image.asset(
                  //   (onetimesound == 1 && etape == 2)
                  //       ? "assets/fleches/Fleches_2_A.png"
                  //       : (onetimesound == 2 && etape == 2)
                  //           ? "assets/fleches/Fleches_2_E.png"
                  //           : (onetimesound == 3 && etape == 2)
                  //               ? "assets/fleches/Fleches_2_I.png"
                  //               : (onetimesound == 4 && etape == 2)
                  //                   ? "assets/fleches/Fleches_2_O.png"
                  //                   : (onetimesound == 5 && etape == 2)
                  //                       ? "assets/fleches/Fleches_2_U.png"
                  //                       : "assets/fleches/Fleches_2.png",

                  //   fit: BoxFit.contain,
                  //   height: (7 * height) / 10,

                  //   //width: 300,
                  // ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new GestureDetector(
                        child: Container(
                          padding: new EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    lettre,
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'a',
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          firstsound(lettre + "a");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          padding: new EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    lettre,
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'e',
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          firstsound(lettre + "e");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          padding: new EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    lettre,
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'i',
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          firstsound(lettre + "i");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          padding: new EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    lettre,
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'o',
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          firstsound(lettre + "o");
                        },
                      ),
                      new GestureDetector(
                        child: Container(
                          padding: new EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    lettre,
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 2.0),
                                height: height / 8,
                                width: width / 10,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: Center(
                                  child: Text(
                                    'u',
                                    style: TextStyle(
                                        fontSize: height / 11,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          firstsound(lettre + "u");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future firstsound(String letter) async {
    print("Akhi t es dans le premier son");
    await flutterTts.setVoice({"name": "fr-fr-x-frc-local", "locale": "fr-FR"});
    await flutterTts.setLanguage("fr-FR");
    await flutterTts.setPitch(1);
    await flutterTts.speak(letter);

    // if (audio.contains(letter + "_file.mp3")) {
    //   print('Akhi t es rentré dans le if');
    //   print(letter + "_file.mp3");
    //   audioCache.play(letter + "_file.mp3");
    //}
    //   else {
    //   print('Akhi t es pas rentré dans le if');
    // }
  }

  Future case1lettre(double width) async {
    if (distancex >= ((width * 20) / 100)) {
      print("omg t es dans les premiers bails.");
      //Premieres cases sont au minimum a une distance de 200 et max a 400
      tangente = (distancey.abs() / distancex);
      print("tangente:" + tangente.toString());
      if (distancey < 30 && distancey > -(30)) {
        if ((0.00 <= tangente) && (tangente <= 0.11) && (onetimesound != 3)) {
          onetimesound = 3;
          await flutterTts.speak("i");
        }
      } else if (distancey < -(30)) {
        //   Les 2 cases au dessus ont un y négatif.
        if ((0.48 <= tangente) && (tangente <= 0.75) && (onetimesound != 1)) {
          print("t es dans a");
          onetimesound = 1;
          await flutterTts.speak('a');
        }
        if ((0.18 <= tangente) && (tangente <= 0.45) && (onetimesound != 2)) {
          print("t es dans e");
          onetimesound = 2;
          await flutterTts.speak("e");
        }
      } else if (distancey > 30) {
        if ((0.18 <= tangente) && (tangente <= 0.45) && (onetimesound != 4)) {
          print("Tangentes = $tangente");
          onetimesound = 4;
          await flutterTts.speak('o');
        }
        if ((0.48 <= tangente) && (tangente <= 0.75) && (onetimesound != 5)) {
          print("Tangentes = $tangente");
          onetimesound = 5;
          await flutterTts.speak("u");
        }
        print("t es a la fin de y > 0 et onetime sound = " +
            onetimesound.toString());
        // Pour dire que l etape 1 est bien passé et que mtn on peut passer aux cases apres
      }
      etape = 1;
    } else {
      //print('La personne doit aller jusqu aux 1ere cases.');
    }
  }

  Future duosound(double width) async {
    Map phonetiques = {
      "be": "beu",
      "fe": "feu",
      "ge": "geu",
      "gue": "gueu",
      "to": "tau",
      "fo": "fau",
      "ye": "yeu",
      "ve": "veut",
      "pe": "peut",
      "ke": "que",
      "sov": "sove",
      "y": "ygrec",
      "aj": "a je",
      "ap": "apeux",
      "aq": "hack",
      "av": "have",
      "aw": "a ou",
      "az": "hazeu",
      "eb": "aibeu",
      "ef": "f",
      "eg": "egg",
      "ei": "ai"
    };

    MapEntry entryA = phonetiques.entries.firstWhere(
        (element) => element.key == lettre + 'a',
        orElse: () => null);

    MapEntry entryE = phonetiques.entries.firstWhere(
        (element) => element.key == lettre + 'e',
        orElse: () => null);

    MapEntry entryI = phonetiques.entries.firstWhere(
        (element) => element.key == lettre + 'i',
        orElse: () => null);

    MapEntry entryO = phonetiques.entries.firstWhere(
        (element) => element.key == lettre + 'o',
        orElse: () => null);

    MapEntry entryU = phonetiques.entries.firstWhere(
        (element) => element.key == lettre + 'u',
        orElse: () => null);

    if (distancex >= ((width * 57.3) / 100)) {
      //Premieres cases sont au minimum a une distance de 100 et max a 235
      if (onetimesound == 1) {
        if (entryA != null) {
          await flutterTts.speak(entryA.value);
        } else {
          await flutterTts.speak(lettre + "a");
        }
        print("tu as emprunté le bon chemin 1");
        //await flutterTts.speak(lettre + "a");
      } else if (onetimesound == 2) {
        print("tu as emprunté le bon chemin");
        if (entryE != null) {
          await flutterTts.speak(entryE.value);
        } else {
          await flutterTts.speak(lettre + "e");
        }
        //await flutterTts.speak(lettre + "e");
      } else if (onetimesound == 3) {
        print("tu as emprunté le bon chemin");
        if (entryI != null) {
          await flutterTts.speak(entryI.value);
        } else {
          await flutterTts.speak(lettre + "i");
        }
      } else if (onetimesound == 4) {
        print("tu as emprunté le bon chemin");
        if (entryO != null) {
          await flutterTts.speak(entryO.value);
        } else {
          await flutterTts.speak(lettre + "o");
        }
      } else if (onetimesound == 5) {
        print("tu as emprunté le bon chemin");
        if (entryU != null) {
          await flutterTts.speak(entryU.value);
        } else {
          await flutterTts.speak(lettre + "u");
        }
      }
      etape = 2;
      //print("t es a la fin de duo sound et Onetimesound est maintenant egale a : ");
      //print(onetimesound);
      //print("Tu n est pas aller assez loin pour activer les 2 dernieres cases.");
    } else {
      //rien
    }
  }
}
