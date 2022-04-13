import 'dart:async';
import 'dart:io';
import 'package:alphabet_app/list/letter_list.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';

class Recorder extends StatefulWidget {
  final Function save;
  final int cardVisible;

  const Recorder({Key key, this.save, this.cardVisible}) : super(key: key);
  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  IconData _recordIcon = Icons.mic_none;
  MaterialColor colo = Colors.orange;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  bool stop = false;
  Recording _current;
  // Recorder properties
  FlutterAudioRecorder2 audioRecorder;
  static const end = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(statuses[Permission.microphone]);
    print(statuses[Permission.storage]);
    //bool hasPermission = await FlutterAudioRecorder.hasPermissions ?? false;
    if (statuses[Permission.microphone] == PermissionStatus.granted) {
      _currentStatus = RecordingStatus.Initialized;
      _recordIcon = Icons.mic;
    } else {}
  }

  @override
  void dispose() {
    _currentStatus = RecordingStatus.Unset;
    audioRecorder = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              (_current == null)
                  ? ""
                  : _current.duration.inSeconds.toString() + " secondes" ?? "0",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            stop == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: RaisedButton(
                          color: idxColorButton,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          shape: CircleBorder(),
                          child: Container(
                            width: width / 7.5,
                            height: height / 3,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: width / 8,
                            ),
                          ),
                        ),
                      ),
                      AvatarGlow(
                        glowColor: idxColorButton,
                        endRadius: width / 9,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        // child: RaisedButton(
                        //   // color: idxColorButton,
                        //   onPressed: () async {
                        //     await _onRecordButtonPressed();
                        //     setState(() {});
                        //   },
                        // shape: CircleBorder(),

                        child: InkWell(
                          onTap: () async {
                            await _onRecordButtonPressed();
                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundColor: idxColorButton,
                            radius: width / 11,
                            child: Icon(
                              _recordIcon,
                              color: Colors.white,
                              size: width / 8,
                            ),
                          ),
                        ),

                        // Container(
                        //   width: width / 7.5,
                        //   height: height / 3,
                        //   child: Icon(
                        //     _recordIcon,
                        //     color: Colors.white,
                        //     size: width / 8,
                        //   ),
                        //   //  Column(
                        //   //   children: [

                        //   // Padding(
                        //   //   padding: const EdgeInsets.all(8.0),
                        //   //   child: Text(
                        //   //     "S'enregistrer",
                        //   //     style: TextStyle(color: Colors.white),
                        //   //   ),
                        //   // ),
                        //   //   ],
                        //   // ),
                        // ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AvatarGlow(
                          glowColor: idxColorButton,
                          endRadius: width / 9,
                          duration: Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 100),
                          child: Material(
                            // Replace this child with your own
                            elevation: 1.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              child: Container(
                                width: width / 6,
                                height: height / 2,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "$lettertot !",
                                      style: TextStyle(
                                          color: idxColorButton,
                                          fontSize: width / 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              radius: width / 11,
                            ),
                          ),
                        ),

                        // RaisedButton(
                        //   color: colo,
                        //   onPressed: () async {
                        //     await _onRecordButtonPressed();
                        //     setState(() {});
                        //   },
                        //   shape: CircleBorder(),
                        //   child: Container(
                        //     width: width / 7.5,
                        //     height: height / 3,
                        //     child: Icon(
                        //       _recordIcon,
                        //       color: Colors.white,
                        //       size: width / 8,
                        //     ),
                        //   ),
                        // ),

                        RaisedButton(
                          color: Colors.orange,
                          onPressed: _currentStatus != RecordingStatus.Unset
                              ? _stop
                              : null,
                          shape: CircleBorder(),
                          child: Container(
                            width: width / 7.5,
                            height: height / 3,
                            child: Icon(
                              Icons.stop,
                              color: Colors.white,
                              size: width / 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Future<void> _onRecordButtonPressed() async {
    switch (_currentStatus) {
      case RecordingStatus.Initialized:
        {
          _recordo();
          break;
        }
      case RecordingStatus.Recording:
        {
          _pause();
          break;
        }
      case RecordingStatus.Paused:
        {
          _resume();
          break;
        }
      case RecordingStatus.Stopped:
        {
          _recordo();
          break;
        }
      default:
        break;
    }
  }

  _initial() async {
    if (widget.cardVisible == 3) {
      lettertot = letter_1 + letter_2 + letter_3;
    } else if (widget.cardVisible == 2) {
      lettertot = letter_1 + letter_2;
    } else {
      lettertot = letter_1;
    }

    Directory appDir = Platform.isAndroid
        ? await getExternalStorageDirectory() //FOR ANDROID
        : await getApplicationSupportDirectory();

    //Directory appDir = await getExternalStorageDirectory();
    String jrecord = 'Audiorecords';
    String dato = "${lettertot?.toString()}.wav";
    Directory appDirec =
        Directory("${appDir.path.replaceAll(' ', '')}/$jrecord/");

    if (await appDirec.exists()) {
      String patho = "${appDirec.path}$dato";

      Directory appDelete = Directory(patho);
      if (appDelete != null) {
        appDelete.delete(recursive: true);
      }
      print("path delete $appDelete");

      print("path for file11 ${patho}");
      // print(appDelete);

      audioRecorder =
          FlutterAudioRecorder2(patho, audioFormat: AudioFormat.WAV);

      await audioRecorder.initialized;
    } else {
      appDirec.create(recursive: true);
      // Fluttertoast.showToast(msg: "Start Recording , Press Start");
      String patho = "${appDirec.path}$dato";
      print("path for file22 ${patho}");
      audioRecorder =
          FlutterAudioRecorder2(patho, audioFormat: AudioFormat.WAV);
      await audioRecorder.initialized;
    }
  }

  _start() async {
    await audioRecorder.start();
    var recording = await audioRecorder.current(channel: 0);
    setState(() {
      _current = recording;
    });

    const tick = const Duration(milliseconds: 50);
    new Timer.periodic(tick, (Timer t) async {
      if (_currentStatus == RecordingStatus.Stopped) {
        t.cancel();
      }

      var current = await audioRecorder.current(channel: 0);
      // print(current.status);
      setState(() {
        _current = current;
        _currentStatus = _current.status;
      });
    });
  }

  _resume() async {
    await audioRecorder.resume();
    Fluttertoast.showToast(msg: "Reprise de l'enregistrement");
    setState(() {
      _recordIcon = Icons.pause;
      colo = Colors.red;
    });
  }

  _pause() async {
    await audioRecorder.pause();
    Fluttertoast.showToast(msg: "Pause");
    setState(() {
      _recordIcon = Icons.mic;
      colo = Colors.green;
    });
  }

  _stop() async {
    var result = await audioRecorder.stop();

    Fluttertoast.showToast(msg: "Fin de l'enregistrement");
    widget.save();
    setState(() {
      _current = result;
      _currentStatus = _current.status;
      // _current.duration = null;
      _recordIcon = Icons.mic;
      stop = false;
      Navigator.of(context).pop();
    });
  }

  Future<void> _recordo() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(statuses[Permission.microphone]);
    print(statuses[Permission.storage]);
    //bool hasPermission = await FlutterAudioRecorder.hasPermissions ?? false;
    if (statuses[Permission.microphone] == PermissionStatus.granted) {
      /* }
    bool hasPermission = await FlutterAudioRecorder.hasPermissions ?? false;

    if (hasPermission) {*/

      await _initial();
      await _start();
      Fluttertoast.showToast(msg: "Début de l'enregistrement");
      setState(() {
        _currentStatus = RecordingStatus.Recording;
        _recordIcon = Icons.pause;
        colo = Colors.red;
        stop = true;
      });
    } else {
      Fluttertoast.showToast(msg: "Autorisez le microphone");
    }

    Timer(Duration(seconds: 5), () {
      setState(() async {
        if (_current == await audioRecorder.stop()) {
          _stop();
          // Fluttertoast.showToast(msg: "Temps dépassé");
        }
      });
    });
  }
}
