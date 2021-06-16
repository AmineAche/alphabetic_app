import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../list/letter_list.dart';

class BottomBar extends StatefulWidget {
  //const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container( 
      height: height / 8,
      width: width / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             Container(
               width: width / 6,
              child: Button3D(
                width: width / 6,
                style: StyleOf3dButton(
                  backColor: Colors.transparent,
                  topColor: idxColorButton,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
                onPressed: () {
                  String lettre;
                  lettre = letter_1.toLowerCase();
                  if ((lettre == 'a') ||
                      (lettre == 'e') ||
                      (lettre == 'i') ||
                      (lettre == 'o') ||
                      (lettre == 'u') ||
                      (lettre == 'y')) {
                    lettre = alphabet[indiceletter_1 + 1];
                  }
                  Navigator.pushNamed(context, '/slide', arguments: lettre);
                },
                child: Text(
                  "RELIABLE",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          Container(
            width: width / 6,
            child: Button3D(
              width: width / 6,
              style: StyleOf3dButton(
                backColor: Colors.transparent,
                topColor: idxColorButton,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/accent',
                );
              },
              child: Text(
                "ACCENT",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
