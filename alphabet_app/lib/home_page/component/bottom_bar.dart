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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600].withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: height / 8,
      width: width / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width / 6,
            height: height / 8,
            child: ElevatedButton(
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
                  fontSize: height / 26,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(30),
                //shadowColor: MaterialStateProperty.all(
                //  Colors.black.withOpacity(1),
                //),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                    ),
                    side: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.green;
                    return idxColorButton;
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: width / 6,
            height: height / 8,
            child: ElevatedButton(
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
                "SYLLABE",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: height / 26,
                ),
              ),
              style: ButtonStyle(
                //elevation: MaterialStateProperty.all(30),
                //shadowColor: MaterialStateProperty.all(
                //Colors.black.withOpacity(1),
                //),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                    ),
                    side: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.green;
                    return idxColorButton;
                  },
                ),
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(),
          //   width: width / 6,
          //   child: Button3D(
          //     width: width / 6,
          //     style: StyleOf3dButton(
          //       backColor: Colors.transparent,
          //       topColor: idxColorButton,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10),
          //         bottomLeft: Radius.circular(0),
          //       ),
          //     ),
          //     onPressed: () {
          //       String lettre;
          //       lettre = letter_1.toLowerCase();
          //       if ((lettre == 'a') ||
          //           (lettre == 'e') ||
          //           (lettre == 'i') ||
          //           (lettre == 'o') ||
          //           (lettre == 'u') ||
          //           (lettre == 'y')) {
          //         lettre = alphabet[indiceletter_1 + 1];
          //       }
          //       Navigator.pushNamed(context, '/slide', arguments: lettre);
          //     },
          //     child: Text(
          //       "RELIABLE",
          //       style: GoogleFonts.lato(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   decoration: BoxDecoration(),
          //   width: width / 6,
          //   child: Button3D(
          //     width: width / 6,
          //     style: StyleOf3dButton(
          //       backColor: Colors.transparent,
          //       topColor: idxColorButton,
          //       borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(10),
          //         bottomRight: Radius.circular(0),
          //       ),
          //     ),
          //     onPressed: () {
          //       Navigator.pushNamed(
          //         context,
          //         '/accent',
          //       );
          //     },
          //     child: Text(
          //       "ACCENT",
          //       style: GoogleFonts.lato(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w700,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
