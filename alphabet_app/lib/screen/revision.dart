import 'package:alphabet_app/list/letter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'package:switcher_button/switcher_button.dart';

import '../constants.dart';

class RevisionPage extends StatefulWidget {
  RevisionPage({
    Key key,
    this.maj,
  }) : super(key: key);

  final bool maj;

  @override
  _RevisionPageState createState() => _RevisionPageState();
}

final FlutterTts flutterTts = FlutterTts();
AnimationController _animationController;

class _RevisionPageState extends State<RevisionPage>
    with SingleTickerProviderStateMixin {
  void initState() {
    _loadString();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _saveString();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //Container 1
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
                        padding: EdgeInsets.only(right: width / 70.0),
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
                    child: Text(
                      "$revisionidx / ${revision.length - 1}",
                      style: TextStyle(fontSize: 25),
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
              //Container 2
              child: Padding(
                padding: EdgeInsets.only(bottom: height / 4),
                child: Container(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 7, right: height / 20),
                            child: Container(
                              height: height / 10,
                              width: height / 10,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border:
                                    Border.all(color: idxColorButton, width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                  iconSize: height / 20,
                                  icon: Icon(
                                    Icons.restart_alt,
                                    color: Colors.black,
                                  ),
                                  tooltip: 'Réinitialiser',
                                  onPressed: () {
                                    setState(() {
                                      revisionidx = 0;
                                    });
                                  }),
                            ),
                          ),
                          new Flexible(
                            child: SwipeGestureRecognizer(
                              child: Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 3.0),
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
                                  //shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    maxWidth: width - 85,
                                    minWidth: width / 5,
                                    maxHeight: height / 2.5,
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text(
                                            widget.maj
                                                ? revision[revisionidx]
                                                    .toUpperCase()
                                                : revision[revisionidx]
                                                    .toLowerCase(),
                                            //"les oiseaux montent sur les arbres car",
                                            // "o",

                                            textAlign: TextAlign.center,

                                            style: TextStyle(
                                                fontSize: height / 7,
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onSwipeRight: () {
                                setState(() {
                                  print("$revisionidx / ${revision.length}");
                                  if (revisionidx == 0) {
                                    revisionidx = revision.length - 1;
                                  } else {
                                    revisionidx--;
                                  }
                                });
                              },
                              onSwipeLeft: () {
                                setState(() {
                                  print("$revisionidx / ${revision.length}");

                                  if (revisionidx == revision.length - 1) {
                                    revisionidx = 0;
                                  } else {
                                    revisionidx++;
                                  }
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 7, left: height / 20),
                            child: Container(
                              height: height / 10,
                              width: height / 10,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border:
                                    Border.all(color: idxColorButton, width: 2),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                  iconSize: height / 20,
                                  icon: Icon(
                                    Icons.volume_up,
                                    color: Colors.black,
                                  ),
                                  tooltip: 'Ecouter',
                                  onPressed: () {
                                    sound();
                                  }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 10,
                      ),

                      Container(
                        height: 30,
                        width: width / 1.5,
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
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,

                          gradient: LinearGradient(colors: [
                            //Colors.red,
                            //Colors.redAccent,
                            //Colors.orange,
                            //Colors.green
                            // Colors.black,
                            //Colors.grey,
                            //Colors.redAccent,
                            Colors.white,
                            idxColorButton,
                          ]),
                        ),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (_, __) {
                            return SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: null,
                                trackHeight: 0.5,
                                thumbColor: Colors.white,
                                overlayColor: Colors.red.withAlpha(1),
                              ),
                              child: Slider(
                                min: 0,
                                max: revision.length.toDouble() - 1,
                                value: revisionidx.toDouble(),
                                onChanged: (newValue) => {
                                  setState(() => revisionidx = newValue.toInt())
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //ici bouton
          ],
        ),
      ),
    );
  }

  _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (revisionidx == null) {
        revisionidx = 0;
      }
      prefs.setInt('indiceRev', revisionidx);
    });
  }

  _loadString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      revisionidx = (prefs.getInt('indiceRev'));
      if (revisionidx == null) {
        revisionidx = 0;
      }
    });
  }

  Future sound() async {
    await flutterTts.setVoice({"name": "Marie", "locale": "fr-FR"});
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.4);
    // await flutterTts.speak(revision[revisionidx]);

    Map change = {
      "PA": "pas",
      "PE": "peu",
      "PU": "pus",
      "LI": "li",
      "TY": "ti",
      "SA": "sa",
      "SU": "su",
      "VI": "vi",
      "NY": "ni",
      "NÊ": "ne",
      "LE TAPIS EST SALE": "LE TAPIS est SALE",
      "LE VÉLO EST PETIT": "LE VÉLO est PETIT",
      "FO": "faux",
      "FU": "FUT",
      "FÊ": "FE",
      "BE": "beu",
      "DÊ": "DE",
      "ZA": "za",
      "LE LILAS EST FANÉ": "LE LILAS est FANÉ",
      "LA BANANE EST MÛRE": "LA BANANE est MÛRE",
      "LA DAME EST À LA MODE": "LA DAME est à LA MODE",
      "LE VÉLO EST RAPIDE": "LE VÉLO est RAPIDE",
      "JULIE EST MALADE": "JULIE est MALADE",
      "CA": "ca",
      "CU": "cul",
      "CAROLE VA À L’ÉCOLE": "CAROLE VA à L’ÉCOLE",
      "CE": "ce",
      "CECI EST UNE LIME": "CECI est UNE LIME",
      "CECI EST UNE PUCE": "CECI est UNE PUCE",
      "LA POLICE EST LÀ": "LA POLICE est LÀ",
      "PHA": "fa",
      "PHO": "faux",
      "CHÊ": "che",
      "GA": "ga",
      "GUE": "gueux",
      "PAPA VA À LA GARE": "PAPA VA à LA GARE",
      "GE": "je",
      "GI": "ji",
      "LE PETIT CHAT EST ROUX": "LE PETIT CHAT est ROUX",
      "LOULOU EST SOUS LA DOUCHE": "LOULOU est SOUS LA DOUCHE",
      "OI": "wa",
      "BOI": "bois",
      "DOI": "doit",
      "GOI": "goit",
      "JOI": "joit",
      "NOI": "noix",
      "POI": "poix",
      "CHOI": "CHOIX",
      "FON": "fond",
      "GON": "gond",
      "JON": "jond",
      "LON": "long",
      "RON": "rond",
      "VON": "vont",
      "LE HÉRON EST SOUS LE PONT": "LE HÉRON est SOUS LE PONT",
      "CAN": "quand",
      "DAN": "dent",
      "FAN": "fend",
      "LAN": "lent",
      "MAN": "mens",
      "NAN": "n'en",
      "RAN": "rang",
      "SAN": "Sang",
      "TAN": "tant",
      "VAN": "vent",
      "CHAN": "chant",
      "LE CHAT EST SOUS LE BANC": "LE CHAT est SOUS LE BANC",
      "BEN": "banc",
      "CEN": "sans",
      "DEN": "dans",
      "FEN": "f'an",
      "GEN": "gens",
      "JEN": "j'en",
      "LEN": "lent",
      "MEN": "ment",
      "NEN": "n'en",
      "PEN": "pans",
      "REN": "rend",
      "SEN": "sent",
      "TEN": "tant",
      "VEN": "vend",
      "UN ENFANT": "un enfant",
      "IN": "un",
      "CIN": "SEINS",
      "DIN": "dain",
      "GIN": "j'un",
      "JIN": "j'un",
      "MIN": "m'un",
      "NIN": "nain",
      "PIN": "pain",
      "RIN": "rein",
      "SIN": "sain",
      "JAIN": "j'un",
      "RAIN": "rein",
      "CHAIN": "ch'un",
      "EIN": "un",
      "CEIN": "sain",
      "fEIN": "fin",
      "PEIN": "pain",
      "TEIN": "tin",
      "ELLE EST ENCEINTE": "ELLE est ENCEINTE",
      "CE N’EST PAS DE LA FAUTE DE NICOLAS":
          "ce N’EST PAS DE LA FAUTE DE NICOLAS",
      "TEAU": "tot",
      "IL EST BEAU": "IL est BEAU",
      "BET": "baie",
      "CET": "sais",
      "DET": "dès",
      "FET": "fè",
      "GET": "gé",
      "LET": "lé",
      "MET": "mé",
      "RET": "ré",
      "CAI": "sais",
      "DAI": "dais",
      "FAI": "fais",
      "NAI": "nait",
      "PAI": "paix",
      "TAI": "tè",
      "LE BALAI EST À CÔTÉ DE LA CHAISE": "LE BALAI est À CÔTÉ DE LA CHAISE",
      "EI": "ai",
      "BEI": "baie",
      "CEI": "sais",
      "DEI": "dè",
      "NEI": "nai",
      "PEI": "paix",
      "REI": "raie",
      "SEI": "sais",
      "TEI": "tais",
      "VEI": "vais",
      "EU": "EUX",
      "CEU": "CEUX",
      "DEU": "DEUX",
      "NEU": "NOEUD",
      "REU": "RE",
      "SEU": "CEUX",
      "TEU": "TE",
      "VEU": "VEux",
      "IL EST DANGEREUX": "IL est DANGEREUX",
      "EUR": "heure",
      "NEUR": "n'heure",
      "IEN": "y'un",
      "CIEN": "sien",
      "DIEN": "d'y'un",
      "NIEN": "n'y'un",
      "BASTIEN EST UN MAGICIEN": "BASTIEN est un MAGICIEN",
      "GAIL": "gaï",
      "LAIL": "l'aye",
      "MAIL": "maille",
      "NAIL": "n'aïe",
      "SAIL": "s'aïe",
      "TAIL": "thaï",
      "VAIL": "v'aïe",
      "EIL": "eille",
      "BEIL": "beye",
      "MEIL": "meille",
      "TEIL": "teille",
      "LA BOUTEILLE EST PLEINE": "LA BOUTEILLE est PLEINE",
      "EUIL": "oeil",
      "JOIN": "joint",
      "NICOLAS VA AU COIN CAR IL EST PUNI":
          "NICOLAS VA AU COIN CAR IL est PUNI",
      "IER": "ié",
      "BIER": "bié",
      "CIER": "sié",
      "PIER": "pié",
      "RIER": "rié",
      "SIER": "sié",
      "TIER": "tié",
      "GNE": "nieu",
      "GNO": "nio",
      "JE VIS A LA CAMPAGNE": "JE vit à la campagne",
      "ILL": "i yeu",
      "BILL": "bi y",
      "FILL": "fi y",
      "MILL": "Mi y",
      "NILL": "ni y",
      "PILL": "pi y",
      "QUILL": "quille",
      "SILL": "si y",
      "TILL": "ti y",
      "LA MAMAN AIME SA FILLE": "LA MAMAN AIME sa FILLE",
      "CRE": "creux",
      "PRE": "preu",
      "PRI": "pris",
      "PRÊ": "preu",
      "BRE": "breu",
      "BRI": "bris",
      "DRE": "dreu",
      "FRE": "freu",
      "FRI": "frit",
      "FRO": "fros",
      "FRU": "frue",
      "TRE": "treux",
      "TRU": "trut",
      "VRA": "vras",
      "VRE": "vreu",
      "VRI": "vrie",
      "VRO": "vreau",
      "CLA": "clat",
      "CLE": "cleux",
      "CLU": "clut",
      "FLI": "flie",
      "FLU": "flux",
      "GLA": "glas",
      "GLE": "gleu",
      "GLI": "glie",
      "PLE": "pleu",
      "AC": "aque",
      "EC": "èque",
      "IC": "yque",
      "UC": "uque",
      "OL": "all",
      "UL": "ulle",
      "É": "et",
      "ER": "et",
      "EZ": "et",
    };

    MapEntry entry = change.entries.firstWhere(
        (element) => element.key == revision[revisionidx],
        orElse: () => null);

    if (entry != null) {
      await flutterTts.speak(entry.value);
    } else {
      await flutterTts.speak(revision[revisionidx]);
    }
  }
}
