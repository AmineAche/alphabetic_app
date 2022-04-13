import 'package:alphabet_app/list/letter_list.dart';
import 'package:alphabet_app/main.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/card_bouton.dart';
import 'home_page.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

// _storeOnBoardInfo() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   isViewed = 1;
//   await prefs.setInt('onBoard', isViewed);
// }

// double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

class _OnBoardingState extends State<OnBoarding> {
  List<PageViewModel> getPages(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return [
      PageViewModel(
        decoration: PageDecoration(
          fullScreen: true,
          imageAlignment: Alignment.center,
        ),
        image: Image.asset(
          "assets/fleches/gifLettres.gif",
        ),
        title: "",
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          fullScreen: true,
          imageAlignment: Alignment.center,
        ),
        image: Image.asset("assets/fleches/carteFleche.gif"),
        title: "",
        body: "",
      ),
      PageViewModel(
        decoration: PageDecoration(
          fullScreen: true,
          imageAlignment: Alignment.center,
        ),
        image: Image.asset("assets/fleches/son.gif"),
        title: "",
        body: "",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        scrollPhysics: BouncingScrollPhysics(),
        curve: Curves.elasticIn,
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: idxColorButton,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
        done: Text(
          "J'ai compris",
          style: TextStyle(
            color: idxColorButton,
          ),
        ),
        onDone: () async {
          // print("avant : $isViewed");

          // await _storeOnBoardInfo();

          // print("après : $isViewed");

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        },
        rawPages: [],
        pages: getPages(context),
        globalBackgroundColor: Colors.white,
        skip: Text(
          'Passer',
          style: TextStyle(
            color: idxColorButton,
          ),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: idxColorButton,
        ),
        showNextButton: true,
        showSkipButton: true,
      ),
    );
  }
}
