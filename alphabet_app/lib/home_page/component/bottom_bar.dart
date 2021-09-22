import 'dart:async';
import 'package:alphabet_app/screen/slidablepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../list/letter_list.dart';
import '../../sound_recorder.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final recorder = SoundRecorder();
  final player = SoundPlayer();
  @override
  void initState() {
    super.initState();
    recorder.init();
    player.init();
  }

  void dispose() {
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
        Container(
          width: width / 5.5,
        ),
      ],
    );
  }

  Widget buildStart() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    return Listener(
      onPointerDown: (details) async {
        final isRecording = await recorder._record();
        setState(() {});
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            message: "Enregistrement de la voix ",
          ),
        );
      },
      onPointerUp: (details) async {
        final isRecording = await recorder._stop();
        setState(() {});
        showTopSnackBar(
          context,
          CustomSnackBar.info(message: "Fin de l'enregistrement"),
        );
      },
      child: SizedBox(
        width: width / 15,
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
            onPressed: () async {}),
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
      width: width / 15,
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
          // final isPlaying = await recorder._play();
          recorder.isRecording
              ? null
              : await player.togglePlaying(whenFinished: () {
                  setState(() {});
                });
          setState(() {});
        },
      ),
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
