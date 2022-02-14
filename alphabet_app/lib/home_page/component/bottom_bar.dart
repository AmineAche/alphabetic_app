import 'dart:async';
import 'dart:io';
import 'package:alphabet_app/home_page/component/view.dart';
import 'package:alphabet_app/screen/revision.dart';
import 'package:alphabet_app/screen/slidablepage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import '../../list/letter_list.dart';
import '../../sound_recorder.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.visible}) : super(key: key);

  final int visible;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final recorder = SoundRecorder();
  final player = SoundPlayer();

  Directory appDir;
  List<String> records;
  bool isPlay = false;
  AudioPlayer advancedPlayer = AudioPlayer();
  int _totalTime;
  int _currentTime;
  double _percent = 0.0;
  int _selected = -1;

  @override
  void initState() {
    super.initState();
    records = [];
    //getExternalStorageDirectory()
    Platform.isAndroid
        ? getExternalStorageDirectory().then((value) {
            appDir = value;
            Directory appDirec =
                Directory("${appDir.path.replaceAll(' ', '')}/Audiorecords/");
            appDir = appDirec;
            appDir.list().listen((onData) {
              records.add(onData.path);
            }).onDone(() {
              records = records.reversed.toList();
              setState(() {});
            });
          })
        : getApplicationSupportDirectory().then((value) {
            appDir = value;
            Directory appDirec =
                Directory("${appDir.path.replaceAll(' ', '')}/Audiorecords/");
            appDir = appDirec;
            appDir.list().listen((onData) {
              records.add(onData.path);
            }).onDone(() {
              records = records.reversed.toList();
              setState(() {});
            });
          });
    recorder.init();
    player.init();
  }

  void dispose() {
    appDir = null;
    records = null;
    player.dispose();
    recorder.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: height / 8,

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
            ),
            color: idxColorButton,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600].withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          //height: 48,
          child: Row(
            children: [
              buildStart(),
              buildPlay(),
            ],
          ),
        ),
        Container(
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
                    int indicelettre;
                    indicelettre = indiceletter_1;

                    String lettre;
                    lettre = letter_1.toLowerCase();

                    if ((lettre == 'a') ||
                        (lettre == 'e') ||
                        (lettre == 'i') ||
                        (lettre == 'o') ||
                        (lettre == 'u') ||
                        (lettre == 'y')) {
                      indicelettre = indiceletter_1 + 1;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SlidePage(
                                indiceletterbefore: indicelettre,
                                letterMaj: activeMaj,
                              )),
                    );
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
            ],
          ),
        ),
        SizedBox(
          width: width / 6,
          height: height / 8,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RevisionPage(
                          maj: activeMaj,
                        )),
              );
            },
            child: Text(
              "REVISION",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: height / 26,
              ),
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(30),
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
      ],
    );
  }

  Widget buildStart() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final icon = Icons.mic;
    return Listener(
      onPointerDown: (details) async {
        setState(() {});
      },
      onPointerUp: (details) async {
        setState(() {});
      },
      child: SizedBox(
        width: width / 13,
        height: height / 8,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(idxColorButton),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
            ),
            child: Icon(
              icon,
              size: height / 20,
            ),
            onPressed: () async {
              show(context);
            }),
      ),
    );
  }

  Widget buildPlay() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final isPlaying = player.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    //final text = isPlaying ? 'Stop Playing' : 'Play Recording';

    return SizedBox(
      height: height / 8,
      width: width / 13,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(idxColorButton),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(0),
              ),
              side: BorderSide(color: Colors.grey, width: 0.5),
            ),
          ),
        ),
        child: Icon(
          icon,
          size: height / 20,
        ),
        onPressed: () async {
          setState(() {
            if (widget.visible == 3) {
              lettertot = letter_1 + letter_2 + letter_3;
            } else if (widget.visible == 2) {
              lettertot = letter_1 + letter_2;
            } else {
              lettertot = letter_1;
            }

            isPlay = true;
          });
          //print(appDir.path.replaceAll(' ', ''));

          String path = "${appDir.path.replaceAll(' ', '')}$lettertot.wav";
          bool directoryExists = await Directory(path).exists();
          bool fileExists = await File(path).exists();
          if (directoryExists || fileExists) {
            print(path);
            advancedPlayer.play(path, isLocal: true);
          } else {
            Fluttertoast.showToast(
                msg: "Il faut d'abord créer un enregistrement.");
          }

          setState(() {});
        },
      ),
    );
  }

  _onFinish() {
    records.clear();
    print(records.length.toString());
    appDir.list().listen((onData) {
      records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }

  void show(
    BuildContext context,
  ) {
    showModalBottomSheet<void>(
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 200,
            color: Colors.white70,
            child: Container(
              child: Recorder(
                cardVisible: widget.visible,
                save: _onFinish,
              ),
            ));
      },
    );
  }
}

class SoundPlayer {
  FlutterSoundPlayer _audioPlayer;
  bool get isPlaying => _audioPlayer.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer.openAudioSession();
    print('oe');
  }

  void dispose() {
    _audioPlayer.closeAudioSession();
    _audioPlayer = null;
    print('oe2');
  }

  Future _play(VoidCallback whenFinished) async {
    await _audioPlayer.startPlayer(
      fromURI: pathToSaveAudio,
      whenFinished: whenFinished,
    );
  }

  Future _stop() async {
    await _audioPlayer.stopPlayer();
    print('Stop');
  }

  Future togglePlaying({VoidCallback whenFinished}) async {
    if (!_audioPlayer.isStopped) {
      await _stop();
    } else {
      await _play(whenFinished);
    }
  }
}

class SoundRecorder {
  FlutterSoundRecorder _audioRecorder;
  bool isRecorderInitialised = false;

  bool get isRecording => _audioRecorder.isRecording;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException("Microphone permission");
    }

    await _audioRecorder.openAudioSession();
    isRecorderInitialised = true;
    print('oe');
  }

  void dispose() {
    if (!isRecorderInitialised) return;

    _audioRecorder.closeAudioSession();
    _audioRecorder = null;
    isRecorderInitialised = false;
    print('oe2');
  }

  Future _record() async {
    if (!isRecorderInitialised) return;
    print("start");
    await _audioRecorder.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async {
    if (!isRecorderInitialised) return;
    print('Stop');
    await _audioRecorder.stopRecorder();
  }

  Future toggleRecording() async {
    if (!_audioRecorder.isStopped) {
      await _stop();
    } else {
      await _record();
    }
  }
}
