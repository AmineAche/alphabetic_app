import 'package:flutter/material.dart';

// Pour save/load les couleurs des boutons et fonds

String idxColorBackgroundsave = 'FFF5F5F5';
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
  "pe": "peut",
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
  "eg": "egg",
  "we": "wé",
  "xa": "géza",
  "ei": "ai"
};
//Fin Home Page
