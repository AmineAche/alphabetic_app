import 'package:flutter/material.dart';
import 'dart:io';

// Pour save/load les couleurs des boutons et fonds

String idxColorBackgroundsave = 'FFffffff';
int valueback = int.parse(idxColorBackgroundsave, radix: 16);
Color idxColorBackground = new Color(valueback);

String idxColorButtonsave = 'FF8333e8';
int value = int.parse(idxColorButtonsave, radix: 16);
Color idxColorButton = new Color(value);

String idxColorConsave = 'FFff0000';
int valuecons = int.parse(idxColorConsave, radix: 16);
Color idxColorConsonne = new Color(valuecons);

String idxColorVoyellesave = 'FF0b16e2';
int valuevoy = int.parse(idxColorVoyellesave, radix: 16);
Color idxColorVoyelle = new Color(valuevoy);

String idxBtnSave;
String idxBackSave;
String idxVoySave;
String idxConsSave;
bool isCons;

// Accent Page variable

int lettreidx = 0;
int accentidx = 0;
bool activeMaj = false;
bool revisionMaj = false;

int revisionidx = 0;

int doubleidx = 0;

var doubleSyllabes = [
  "ch",
  "qu",
  "wh",
];

var revision = [
  "a",
  "e",
  "i",
  "o",
  "u",
  "y",
  "PA",
  "PE",
  "PI",
  "PO",
  "PU",
  "PY",
  "PAPA",
  "PAPY",
  "PIPO",
  "POPI",
  "PIPE",
  "PIPI",
  "PAPE",
  "LA",
  "LE",
  "LI",
  "LO",
  "LU",
  "LY",
  "LA PILE",
  "LA PIPE",
  "LE POLO",
  "LA PILULE",
  "TA",
  "TE",
  "TI",
  "TO",
  "TU",
  "TY",
  "LE TIPI",
  "LE TUTU",
  "LA TULIPE",
  "LE PILOTE",
  "LA PATATE",
  "LA PELOTE",
  "RA",
  "RE",
  "RI",
  "RO",
  "RU",
  "RY",
  "LIRE",
  "RIRE",
  "TIRE",
  "PIRE",
  "RÔTI",
  "LE PIRATE",
  "LA RATE",
  "LA TIRELIRE",
  "SA",
  "SE",
  "SI",
  "SO",
  "SU",
  "SY",
  "SUR",
  "SALIR",
  "LA TASSE",
  "SALE",
  "SALI",
  "LA SALLE",
  "LE SILO",
  "PÉ",
  "LÉ",
  "TÉ",
  "RÉ",
  "SÉ",
  "PÈ",
  "LÈ",
  "TÈ",
  "RÈ",
  "SÈ",
  "PÊ",
  "LÊ",
  "TÊ",
  "RÊ",
  "SÊ",
  "LA TÊTE",
  "LA TÉTÉE",
  "LE TOLLÉ",
  "VA",
  "VE",
  "VI",
  "VO",
  "VU",
  "VY",
  "VÉ",
  "VOLE",
  "LA LAVE",
  "LAVÉ",
  "AVALÉ",
  "VITE",
  "LE VÉLO",
  "LA VIPÈRE",
  "NA",
  "NE",
  "NI",
  "NO",
  "NU",
  "NY",
  "NÉ",
  "NÈ",
  "NÊ",
  "LA LUNE",
  "LA NOTE",
  "LE PIANO",
  "L’ÉPINE",
  "LE REVENU",
  "UN",
  "UNE",
  "UN PILOTE",
  "UN PIRATE",
  "UNE TULIPE",
  "UNE TAPE",
  "ET",
  "LE PIRATE ET LA PIPE",
  "LA TULIPE ET LE LILAS",
  "EST",
  "LE TAPIS EST SALE",
  "LE VÉLO EST PETIT",
  "FA",
  "FE",
  "FI",
  "FO",
  "FU",
  "FÊ",
  "FINI",
  "FANÉ",
  "LA FARINE",
  "LA FÊTE",
  "MA",
  "ME",
  "MI",
  "MO",
  "MU",
  "MÈ",
  "UN AMI",
  "UN MUR",
  "UNE MOTO",
  "UNE MAMIE",
  "LA MARINE",
  "UNE TOMATE",
  "BA",
  "BE",
  "BI",
  "BO",
  "BU",
  "BÉ",
  "UN BOA",
  "UN BÉBÉ",
  "UNE ROBE",
  "UNE BANANE",
  "JA",
  "JE",
  "JI",
  "JO",
  "JU",
  "JOLIE",
  "UNE JUPE",
  "LE JUDO",
  "JE LIS",
  "DA",
  "DE",
  "DI",
  "DO",
  "DU",
  "DÉ",
  "DÈ",
  "DÊ",
  "UNE DAME",
  "UN RADIS",
  "LA SALADE",
  "UN DOMINO",
  "ZA",
  "ZE",
  "ZI",
  "ZO",
  "ZU",
  "ZÉ",
  "ZÈ",
  "UN ZOO",
  "ZÉLÉ",
  "LE ZÈLE",
  "PAPA",
  "PILULE",
  "PILE",
  "PAPI",
  "PIPO",
  "PULL",
  "PILOTE",
  "TULIPE",
  "PIRATE",
  "RIRE",
  "LIRE",
  "SALE",
  "SALI",
  "VOLE",
  "VÉLO",
  "VITE",
  "LUNE",
  "PUNI",
  "FINI",
  "FANÉ",
  "MOTO",
  "FUMÉE",
  "BÉBÉ",
  "BANANE",
  "ROBE",
  "JOLI",
  "JUPE",
  "MADAME",
  "SAMEDI",
  "MALADE",
  "MODE",
  "LE PIRATE A UNE PIPE",
  "LE SIROP A SALI LE TAPIS",
  "LE VÉLO VA VITE",
  "LE LILAS EST FANÉ",
  "PAPA A UNE MOTO",
  "LA BANANE EST MÛRE",
  "MARIE A UNE JOLIE ROBE",
  "JULIE A UNE JOLIE JUPE",
  "LA DAME EST À LA MODE",
  "LE VÉLO EST RAPIDE",
  "JULIE EST MALADE",
  "JE LIS LE SAMEDI",
  "LA MOTO VA VITE LÀ",
  "LA MOTO VA VITE",
  "KA",
  "KE",
  "KI",
  "KO",
  "KU",
  "CA",
  "CO",
  "CU",
  "UN CANAPÉ",
  "LE CACAO",
  "CAROLE",
  "CAROLINE",
  "NICOLAS",
  "ÉCOLE",
  "LA COLONNE",
  "UN CUBE",
  "LA CULOTTE",
  "NICOLAS A BU DU CACAO",
  "CAROLE VA À L’ÉCOLE",
  "CAROLINE A UNE JOLIE NAPPE",
  "QUA",
  "QUE",
  "QUI",
  "QUO",
  "QUÉ",
  "CE",
  "CI",
  "ÇA",
  "ÇO",
  "ÇU",
  "LE CINÉMA",
  "UN CIRQUE",
  "FACILE",
  "CECI",
  "UNE PUCE",
  "LA LIMACE",
  "LIRE C'EST FACILE",
  "CECI EST UNE LIME",
  "CECI EST UNE PUCE",
  "ÇA VA ? C'EST UNE PUCE",
  "LA POLICE EST LÀ",
  "CÉLINE VA AU CINÉMA",
  "PHA",
  "PHE",
  "PHI",
  "PHO",
  "UN HARICOT",
  "UN PHOQUE",
  "LA PHARMACIE",
  "CHA",
  "CHE",
  "CHI",
  "CHO",
  "CHU",
  "CHÉ",
  "CHÊ",
  "CHÈ",
  "LE CHAT",
  "UNE ÉCHARPE",
  "CHAQUE",
  "CHACUN",
  "LA CHASSE",
  "UN CHAR",
  "UNE VACHE",
  "LE CHEVAL",
  "LA TÂCHE",
  "LE CACHE-CACHE",
  "UNE CHEMISE",
  "LA CHIPIE",
  "LA MACHINE",
  "LA CHUTE",
  "UN PARACHUTE",
  "LE CHOCOLAT",
  "NICOLAS A BU DU CHOCOLAT",
  "LE PETIT CHAT SE CACHE",
  "CAROLINE A VU UNE VACHE",
  "JULIE CHUCHOTE CHUT",
  "GA",
  "GO",
  "GU",
  "GUE",
  "GUI",
  "GUY",
  "GUÉ",
  "GUÊ",
  "LA GARE",
  "UNE BAGARRE",
  "LA GARDERIE",
  "UN MAGAZINE",
  "LE GALOP",
  "UNE GOMME",
  "JE RIGOLE",
  "UN LÉGUME",
  "LA BAGUE",
  "UNE GUITARE",
  "LE GUIDE",
  "UNE GUÊPE",
  "UN GUÉPARD",
  "PAPA VA À LA GARE",
  "JULIE A UNE JOLIE BAGUE",
  "RÉMI A UNE GUITARE",
  "NICOLAS A VU UNE GUÊPE",
  "GE",
  "GI",
  "GEA",
  "UNE PAGE",
  "LA NAGE",
  "UNE TIGE",
  "LE GARAGE",
  "LA GIRAFE",
  "UNE GITANE",
  "L'ÉCOLOGIE",
  "RÉMY NAGE VITE",
  "NICOLAS LIT UNE PAGE",
  "LA GITANE A UNE JUPE",
  "JULIE A VU UNE IMAGE DE LA GIRAFE",
  "LA TULIPE A UNE JOLIE TIGE",
  "OU",
  "BOU",
  "COU",
  "DOU",
  "FOU",
  "GOU",
  "JOU",
  "LOU",
  "MOU",
  "NOU",
  "POU",
  "ROU",
  "SOU",
  "TOU",
  "VOU",
  "ZOU",
  "CHOU",
  "UN HIBOU",
  "LA ROUE",
  "ROUX",
  "DOUX",
  "DOUCE",
  "LA MOUCHE",
  "NOUS",
  "VOUS",
  "LE LOUP",
  "LA JOUE",
  "LA DOUCHE",
  "UNE BOULE",
  "JE ROULE",
  "UN FOU",
  "LE PETIT CHAT EST ROUX",
  "LOLA JOUE À LA BALLE",
  "LA BOULE ROULE SOUS LES CANAPÉS",
  "LOULOU EST SOUS LA DOUCHE",
  "OI",
  "BOI",
  "COI",
  "DOI",
  "FOI",
  "GOI",
  "JOI",
  "LOI",
  "MOI",
  "NOI",
  "POI",
  "ROI",
  "SOI",
  "TOI",
  "VOI",
  "CHOI",
  "LE MOIS",
  "LA LOI",
  "LA NOIX",
  "LE BOIS",
  "LE ROI",
  "LA JOIE",
  "LA VOIX",
  "LA VOIE",
  "LE DOIGT",
  "LE TOIT",
  "TOI ET MOI",
  "UNE ÉTOILE",
  "LE NOIR",
  "BOIRE",
  "ON",
  "BON",
  "CON",
  "DON",
  "FON",
  "GON",
  "JON",
  "LON",
  "MON",
  "NON",
  "PON",
  "RON",
  "SON",
  "TON",
  "VON",
  "CHON",
  "UN BONBON",
  "UN BALLON",
  "LE SAVON",
  "LE MELON",
  "LONG",
  "LONGUE",
  "NON",
  "UN PONT",
  "LE ROND",
  "LE BIBERON",
  "UN AVION",
  "LE MOUTON",
  "UN BOUCHON",
  "LE HÉRON A UN LONG COU",
  "LE HÉRON EST SOUS LE PONT",
  "LE POISSON NAGE",
  "LE HÉRON PÊCHE LE POISSON",
  "AN",
  "BAN",
  "CAN",
  "DAN",
  "FAN",
  "GAN",
  "JAN",
  "LAN",
  "MAN",
  "NAN",
  "PAN",
  "RAN",
  "SAN",
  "TAN",
  "VAN",
  "CHAN",
  "LA MAMAN",
  "DANS",
  "UN RUBAN",
  "LA MANCHE",
  "UN PANTALON",
  "AVANT",
  "UNE CHANSON",
  "UN BANC",
  "LE FANTÔME",
  "UN GANT",
  "LE GÉANT",
  "LA LANCE",
  "MAMAN CHANTE UNE CHANSON",
  "RÉMI A VU UN FANTÔME",
  "LE CHAT EST SOUS LE BANC",
  "LE GÉANT A MIS SON PANTALON",
  "EN",
  "BEN",
  "CEN",
  "DEN",
  "FEN",
  "GEN",
  "JEN",
  "LEN",
  "MEN",
  "NEN",
  "PEN",
  "REN",
  "SEN",
  "TEN",
  "VEN",
  "CHEN",
  "LA VENTE",
  "LA RENTE",
  "UNE PENTE",
  "LENTE",
  "LES GENS",
  "UNE FENTE",
  "LA DENT",
  "LE MENTON",
  "DU VENT",
  "ENCORE",
  "CENT",
  "UN ENFANT",
  "LA TENTE",
  "LE PARENT",
  "LENTEMENT",
  "UNE ENVELOPPE",
  "IN",
  "BIN",
  "CIN",
  "DIN",
  "FIN",
  "GIN",
  "JIN",
  "LIN",
  "MIN",
  "NIN",
  "PIN",
  "RIN",
  "SIN",
  "TIN",
  "VIN",
  "UN MARIN",
  "LE MATIN",
  "MALIN",
  "LE LAPIN",
  "UN PINSON",
  "LA DINDE",
  "LE PÉPIN",
  "UN LUTIN",
  "LE MOULIN",
  "LE PATIN",
  "UN SINGE",
  "CINQ",
  "LE LAPIN SE LÈVE LE MATIN",
  "LE PETIT MARIN TIRE LA VOILE",
  "LE PINSON CHANTE SOUS LE SAPIN",
  "AIN",
  "BAIN",
  "CAIN",
  "DAIN",
  "FAIN",
  "GAIN",
  "JAIN",
  "LAIN",
  "MAIN",
  "NAIN",
  "PAIN",
  "RAIN",
  "SAIN",
  "TAIN",
  "VAIN",
  "CHAIN",
  "LE PAIN",
  "UN BAIN",
  "LA MAIN",
  "LE COPAIN",
  "UN NAIN",
  "LE TERRAIN",
  "UN HUMAIN",
  "SOUDAIN",
  "UN ROMAIN",
  "UN AMÉRICAIN",
  "CHÂTAIN",
  "LE POULAIN",
  "EIN",
  "CEIN",
  "FEIN",
  "GEIN",
  "PEIN",
  "REIN",
  "SEIN",
  "TEIN",
  "IL ÉTEINT",
  "JE PEINS",
  "TU PEINS",
  "IL PEINT",
  "ELLE EST ENCEINTE",
  "UNE PEINTURE",
  "LA CEINTURE",
  "UNE TEINTURE",
  "AU",
  "BAU",
  "CAU",
  "DAU",
  "FAU",
  "GAU",
  "JAU",
  "LAU",
  "MAU",
  "NAU",
  "PAU",
  "RAU",
  "SAU",
  "TAU",
  "VAU",
  "CHAU",
  "UNE AUTO",
  "JAUNE",
  "JE SAUTE",
  "CHAUD",
  "CHAUDE",
  "AUSSI",
  "UNE FAUTE",
  "LA TAUPE",
  "UNE ÉPAULE",
  "FAUX",
  "UN CAUCHEMAR",
  "LE DAUPHIN",
  "LÀ-HAUT",
  "LA CHAUSSURE",
  "DES CHEVAUX",
  "UN CHEVAL",
  "ALAIN ROULE DANS SON AUTO JAUNE",
  "CE N’EST PAS DE LA FAUTE DE NICOLAS",
  "LA SAUCE DU SAUMON",
  "EAU",
  "BEAU",
  "SEAU",
  "DEAU",
  "LEAU",
  "MEAU",
  "NEAU",
  "PEAU",
  "REAU",
  "SEAU",
  "TEAU",
  "VEAU",
  "IL EST BEAU",
  "UN CHÂTEAU",
  "LE GÂTEAU",
  "UN RIDEAU",
  "LE VEAU",
  "LA PEAU",
  "UN OISEAU",
  "DES CISEAUX",
  "L’EAU",
  "LE CHAPEAU",
  "UN CADEAU",
  "NOUVEAU",
  "ET",
  "BET",
  "CET",
  "DET",
  "FET",
  "GET",
  "JET",
  "LET",
  "MET",
  "NET",
  "PET",
  "RET",
  "UN JOUET",
  "LE POULET",
  "UN CHALET",
  "LE GALET",
  "UN LACET",
  "LE BUFFET",
  "LA FORÊT",
  "LE MURET",
  "UN VOLET",
  "LE FILET",
  "UN GILET",
  "LE BALLET",
  "UN TABOURET",
  "LE GOBELET",
  "UN BONNET",
  "RÉMIN A MANGÉ UN POULET A MIDI",
  "LE PETIT POUCET PORTE DES GALETS",
  "IL Y A DES JOUETS DANS LE CHALET",
  "AI",
  "BAI",
  "CAI",
  "DAI",
  "FAI",
  "GAI",
  "LAI",
  "MAI",
  "NAI",
  "PAI",
  "RAI",
  "SAI",
  "TAI",
  "VAI",
  "CHAI",
  "LE LAIT",
  "UN BALAI",
  "MAIS",
  "LA PAIX",
  "FAIRE",
  "UN RAISIN",
  "IL A RAISON",
  "DU RAISIN",
  "LA MAISON",
  "UNE CHAISE",
  "LA LAINE",
  "UNE SEMAINE",
  "IL AIME",
  "UNE CHÂTAIGNE",
  "LE CHAT BOIT LE LAIT",
  "PAPA CHERCHE LE BALAI",
  "LE BALAI EST À CÔTÉ DE LA CHAISE",
  "PAPA A FAIT UN BEAU GÂTEAU",
  "EI",
  "BEI",
  "CEI",
  "DEI",
  "LEI",
  "MEI",
  "NEI",
  "PEI",
  "REI",
  "SEI",
  "TEI",
  "VEI",
  "LA BALEINE",
  "UNE REINE",
  "LA NEIGE",
  "LA PEINE",
  //"GEIGE",
  "LE PEIGNE",
  "LA SEINE",
  "UNE VEINE",
  "SEIZE",
  // "X",
  // "XA",
  // "XE",
  // "XÉ",
  // "XI",
  // "XY",
  "LE TAXI",
  "LA BOXE",
  "RELAX",
  "RELAXATION",
  "DU HOUX",
  "LA PAIX",
  "LA TOUX",
  "EU",
  "BEU",
  "CEU",
  "DEU",
  "FEU",
  "GEU",
  "JEU",
  "LEU",
  "MEU",
  "NEU",
  "PEU",
  "REU",
  "SEU",
  "TEU",
  "VEU",
  "DEUX",
  "UN AMOUREUX",
  "LE NEVEU",
  "LES CHEVEUX",
  "LA VOLEUSE",
  "UN JEU",
  "LA QUEUE",
  "IL EST DANGEREUX",
  "PEU",
  "PARESSEUX",
  "HEUREUX",
  "LE FEU",
  "NINON A UN BEAU JEU",
  "NE JOUE PAS AVEC LE FEU",
  "PAPA AIME SES NEVEUX",
  "MAMAN LAVE SES CHEVEUX",
  "EUR",
  "BEUR",
  "COEUR",
  "DEUR",
  "LEUR",
  "MEUR",
  "NEUR",
  "PEUR",
  // "REUR",
  "SEUR",
  "TEUR",
  "VEUR",
  // "CHEUR",
  "IEN",
  "BIEN",
  "CIEN",
  "DIEN",
  "FIEN",
  "GIEN",
  "LIEN",
  "MIEN",
  "NIEN",
  "PIEN",
  "RIEN",
  "SIEN",
  "TIEN",
  "VIEN",
  "UN CHIEN",
  "LE MAGICIEN",
  "JULIEN",
  "ADRIEN",
  "UN INDIEN",
  "IL VIENT",
  "TU TIENS",
  "RIEN",
  "SIEN",
  "SIENNE",
  "BIEN",
  "LE MÉCANICIEN",
  "JULIEN A UN CHIEN",
  "JULIEN MANGE DU POISSON",
  "BASTIEN EST UN MAGICIEN",
  "JULIEN A DE LA PEINE",
  "LE MÉCANICIEN RÉPARE LE CAMION",
  "AIL",
  "BAIL",
  "CAIL",
  "DAIL",
  "FAIL",
  "GAIL",
  "LAIL",
  "MAIL",
  "NAIL",
  "PAIL",
  "RAIL",
  "SAIL",
  "TAIL",
  "VAIL",
  "LA PAGAILLE",
  "UNE PAILLE",
  "LE RAIL",
  "UN ÉPOUVANTAIL",
  "UN ÉVENTAIL",
  "LE CAILLOU",
  "LA MÉDAILLE",
  "UN CHANDAIL",
  "MARION MANGE DE L’AIL",
  "LA LOCOMOTIVE ROULE SUR LES RAILS",
  "LES ENFANTS ONT MIS LA PAGAILLE",
  "EIL",
  "BEIL",
  "LEIL",
  "MEIL",
  "REIL",
  "SEIL",
  "TEIL",
  "VEIL",
  "UN RÉVEIL",
  "LE SOLEIL",
  "LA VEILLE",
  "UNE ABEILLE",
  "LA BOUTEILLE",
  "E SOMMEIL",
  "PAREIL",
  "UN CONSEIL",
  "L’OREILLE",
  "UN ORTEIL",
  "LA CORBEILLE",
  "UN ÉVEIL",
  "LE SOLEIL S’EST LEVÉ",
  "UNE ABEILLE BUTINE UNE FLEUR",
  "LE RÉVEIL SONNE",
  "LA BOUTEILLE EST PLEINE",
  "EUIL",
  "DEUIL",
  "REUIL",
  "SEUIL",
  "TEUIL",
  "VEUIL",
  "UN FAUTEUIL",
  "UN ÉCUREUIL",
  "LA FEUILLE",
  "LE SEUIL",
  "UN CHEVREUIL",
  "LE BOUVREUIL",
  "PAPA A DÉPLACÉ LE FAUTEUIL",
  "ADRIEN DÉCOUPE SA FEUILLE",
  "LES FEUILLES TOMBE EN AUTOMNE",
  "LE SEUIL DE LA MAISON",
  // "OIN",
  "COIN",
  "FOIN",
  "JOIN",
  "LOIN",
  "MOIN",
  "POIN",
  "SOIN",
  "LOIN",
  "UN COIN",
  "LE FOIN",
  "MOINS",
  "LE POINT",
  "COINCER",
  "LOINTAIN",
  "POINTU",
  "SOIN",
  "NICOLAS VA AU COIN CAR IL EST PUNI",
  "RÉMI HABITE LOIN DE LA MAISON",
  "LA VACHE MANGE DU FOIN",
  "LEA A MARQUé un point",
  "IER",
  "BIER",
  "CIER",
  "DIER",
  "LIER",
  "MIER",
  "NIER",
  "PIER",
  "RIER",
  "SIER",
  "TIER",
  "LE CAHIER",
  "DU PAPIER",
  "UN CHEVALIER",
  "LE PANIER",
  "UN POMMIER",
  "LE POIRIER",
  "UN CERISIER",
  "LE BÉLIER",
  "UN POMPIER",
  "LE COLLIER",
  "LA PIERRE",
  "UN SALADIER",
  "LE SENTIER",
  "UN ROUTIER",
  "LE SOULIER",
  "LE CHEVALIER A DÉFENDU LE CHÂTEAU",
  "ANNIE A FAIT UN VOILIER EN PAPIER",
  "JULIEN éCRIT DANS SON CAHIER",
  "SIMON DORT SOUS UN POMMIER",
  // "GN",
  "GNA",
  "GNE",
  "GNO",
  "GNON",
  "GAGNÉ",
  "LA CAMPAGNE", "UN AGNEAU",
  "LA MONTAGNE",
  "UN CHAMPIGNON",
  "LA CIGOGNE",
  "UN CYGNE NOIR",
  "LE PEIGNE",
  "LA MONTAGNE EST HAUTE",
  "IL Y A DES CHAMPIGNONS",
  "BRAVO",
  "TU as GAGNÉ UNE IMAGE POKÉMON",
  "JE VIS A LA CAMPAGNE",
  "ILL",
  "BILL",
  "FILL",
  "MILL",
  "NILL",
  "PILL",
  "QUILL",
  "SILL",
  "TILL",
  "LA FILLE",
  "UNE BILLE",
  "LA QUILLE",
  "HABILLER",
  "LA VANILLE",
  "JUILLET",
  "IL SAUTILLE",
  "UN BILLET",
  "LA CHENILLE",
  "UN PAPILLON",
  "LA FAMILLE",
  "LE SILLON",
  "LES ENFANTS JOUENT AUX BILLES",
  "LA MAMAN AIME SA FILLE",
  "LA FAMILLE DE MON PÈRE VIT À MANILLE",
  "LA CHENILLE DEVIENT PAPILLON",
  "CRA",
  "CRE",
  "CRI",
  "CRO",
  "CRU",
  "LE CRATÈRE",
  "LA CREVETTE",
  "UN CRI",
  "LE CROCHET",
  "UNE CRUCHE",
  "PRA",
  "PRE",
  "PRI",
  "PRO",
  "PRU",
  "PRÉ",
  "PRÈ",
  "PRÊ",
  "LA PRATIQUE",
  "LE PREMIER",
  "UN PRIX",
  "LE PROCHAIN",
  "SOIS PRUDENT",
  "LE PRÊTE",
  "BRA",
  "BRE",
  "BRI",
  "BRO",
  "BRU",
  "BRAS",
  "LA BREBIS",
  "UN ABRI",
  "LA BROCHE",
  "UNE BRUTE",
  "DRA",
  "DRE",
  "DRI",
  "DRO",
  "DRU",
  "UN DRAP",
  "RENDRE",
  "LA PERDRIX",
  "DRÔLE",
  "FRA",
  "FRE",
  "FRI",
  "FRO",
  "FRU",
  "FRAGILE",
  "LA GAUFRE",
  "LA FRITURE",
  "DU FROMAGE",
  "LE FRUIT",
  "GRA",
  "GRE",
  "GRI",
  "GRO",
  "GRU",
  "GRAS",
  "UN GRENIER",
  "LA GRILLE",
  "LE GROGNON",
  "UNE GRUE",
  "TRA",
  "TRE",
  "TRI",
  "TRO",
  "TRU",
  "LE TRAVAIL",
  "QUATRE",
  "ELLE TRICOTE",
  "TROP",
  "VENTRU",
  "VRA",
  "VRE",
  "VRI",
  "VRO",
  // "VRU",
  "UN OUVRAGE",
  "IL OUVRE",
  "LA VRILLE",
  "UN IVROGNE",
  "CLA",
  "CLE",
  "CLI",
  "CLO",
  "CLU",
  "LA CLASSE",
  "UN ORACLE",
  "LE CLIMAT",
  "LA CLOCHE",
  "UNE ENCLUME",
  "FLA",
  "FLE",
  "FLI",
  "FLO",
  "FLU",
  "LA FLAQUE",
  "UN TRÈFLE",
  "LE CONFLIT",
  "UN FLOT",
  "LE FLUX",
  "UNE FLÛTE",
  "GLA",
  "GLE",
  "GLI",
  "GLO",
  "GLU",
  "LA GLACE",
  "UN AIGLE",
  "LA GLAISE",
  "LA GLISSE",
  "UN GLOBULE",
  "LA GLUE",
  "PLA",
  "PLE",
  "PLI",
  "PLO",
  "PLU",
  "LA PLACE",
  "LE PEUPLE",
  "UN PILLAGE",
  "UN PLOT",
  "LA PLUME",
  "AC",
  "EC",
  "IC",
  "OC",
  "UC",
  "UN SAC",
  "LE BEC",
  "LE TIC-TAC",
  "LE ROC",
  "LE SUCRE",
  "AL",
  "EL",
  "IL",
  "OL",
  "UL",
  "UN CHEVAL",
  "ELLE",
  "IL",
  "LE BOL",
  "LE RECUL",
  "É",
  "ER",
  "EZ",
  "ED",
  "ES",
  "ÉTÉ",
  "MANGER",
  "LEVER",
  "BOUGER",
  "CHEZ",
  "UN NEZ",
  "ASSEZ",
  "LE PIED",
  "LES",
  "DES",
  "MES",
  "NATIONAL",
  "LE CINÉMA",
  "SPATIAL",
  "LA CIRE",
  "UNE ACTION",
  "LE CIRQUE",
  "LA RÉCRÉATION",
  "LE CIRAGE",
  "UN VOISIN",
  "LE GAZON",
  "UN COUSIN",
  "LE ZOO",
  "UN POISON",
  "LE LÉZARD",
  "UN VASE",
  "LE ZÈBRE",
  "UN BŒUF",
  "UN ŒUF",
  "LA SŒUR",
  "UN CŒUR",
  "L’EXERCICE",
  "EXAGÉRÉ",
  "EXAMINÉ",
  "LE WAGON"
];

var voyelle = ['a', 'e', 'i', 'o', 'u', 'y'];

var voyelleaccent = [
  'à',
  'â',
  'é',
  'è',
  'ê',
  'ë',
  'î',
  'ï',
  'ô',
  'ù',
  'û',
  'ü'
];

// Fin Accent Page variable

//Home Page

var lettertot;
int indiceletter_1 = 0;
int indiceletter_2 = 1;
int indiceletter_3 = 2;
var letter_1 = alphabet[indiceletter_1];
var letter_2 = alphabet[indiceletter_2];
var letter_3 = alphabet[indiceletter_3];
int visibilityidx = 1;

var alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];

Map phonetiques = {
  "be": "beu",
  //"co": "so",
  //"cu": "su",
  "fe": "feu",
  //"fo": "fau",
  //"fu": "fut",
  "ge": "gueu",
  //"gi": "ji",
  "gue": "gueu",
  //"hu": "u",
  "ke": "que",
  //"ko": "co",
  //"ku": "q",
  "to": "tau",
  //"ye": "yeu",
  //"ve": "veut",
  "pe": "peu",
  //"sov": "sove",
  //"y": "ygrec",
  "aj": "a je",
  "ap": "apeux",
  //"aq": "hack",
  //"av": "have",
  "aw": "a ou",
  // "az": "hazeu",
  //"eb": "aibeu",
  //"ef": "f",
  "qa": "ka",
  //"qo": "co",
  "qe": "que",
  "qu": "q",
  "eg": "aigg",
  "we": "wé",
  //"xa": "géza",
  "pl": "p l",
  "pr": "p r",
  "ei": "ai"
};

Map phonetiques2 = {
  "be": "beu",
  "co": "so",
  "cu": "su",
  "fe": "feu",
  "fo": "fau",
  "fu": "fut",
  "ge": "gueu",
  "gi": "ji",
  "gue": "gueu",
  "hu": "u",
  "ke": "que",
  "ko": "co",
  "ku": "q",
  "to": "tau",
  "ye": "yeu",
  "ve": "veut",
  "pe": "peu",
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
  "qa": "ka",
  "qo": "co",
  "qe": "que",
  "qu": "q",
  "eg": "aigg",
  "xu": "x u",
  "we": "wé",
  //"xa": "géza",
  "pl": "p l",
  "pr": "p r",
  "ei": "ai"
};
//Fin Home Page
