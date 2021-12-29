import 'package:alphabet_app/list/letter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildStart(),
          buildPlay(),
        ],
      ),
    );
  }

  Widget buildStart() {
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = isRecording ? 'STOP' : 'Start';
    return ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(
          text,
        ),
        onPressed: () async {
          // final isRecording = await recorder.toggleRecording();
          // setState(() {});
        });
  }

  Widget buildPlay() {
    final isPlaying = player.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    final text = isPlaying ? 'Stop Playing' : 'Play Recording';

    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        text,
      ),
      onPressed: () async {
        // await player.togglePlaying(whenFinished: () {
        //   setState(() {});
        // });
        // setState(() {});
      },
    );
  }
}

final pathToSaveAudio = 'example.aac';

class SoundPlayer {
  FlutterSoundPlayer _audioPlayer;
  bool get isPlaying => _audioPlayer.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer.openAudioSession();
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
