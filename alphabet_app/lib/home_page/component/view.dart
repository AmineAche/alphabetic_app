import 'dart:async';
import 'dart:io';
import 'package:alphabet_app/list/letter_list.dart';
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
                  ? "Temps : 0:0:0:0 secondes"
                  : _current.duration.toString() + " secondes" ?? "0:0:0:0",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            stop == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          child: RaisedButton(
                            color: Colors.orange,
                            onPressed: null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                                width: 80,
                                height: 115,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Retour",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.orange,
                        onPressed: () async {
                          await _onRecordButtonPressed();
                          setState(() {});
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Icon(
                                _recordIcon,
                                color: Colors.white,
                                size: 80,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "S'enregistrer",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          color: colo,
                          onPressed: () async {
                            await _onRecordButtonPressed();
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Icon(
                              _recordIcon,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.orange,
                          onPressed: _currentStatus != RecordingStatus.Unset
                              ? _stop
                              : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Icon(
                              Icons.stop,
                              color: Colors.white,
                              size: 50,
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
      Fluttertoast.showToast(msg: "Start Recording , Press Start");
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
    Fluttertoast.showToast(msg: "Fin de l'enregistrement , Fichier sauvegardé");
    widget.save();
    setState(() {
      _current = result;
      _currentStatus = _current.status;
      // _current.duration = null;
      _recordIcon = Icons.mic;
      stop = false;
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
      Fluttertoast.showToast(msg: "Allow App To Use Mic");
    }

    Timer(Duration(seconds: 5), () {
      setState(() {
        Fluttertoast.showToast(msg: "Temps dépassé");

        _stop();
      });
    });
  }
}
