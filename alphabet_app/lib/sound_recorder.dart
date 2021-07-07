// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
// import 'package:permission_handler/permission_handler.dart';

// class SoundRecorder {
//   FlutterSoundRecorder _audioRecorder;
//   bool isRecorderInitialised = false;

//   bool get isRecording => _audioRecorder.isRecording;

//   Future init() async {
//     _audioRecorder = FlutterSoundRecorder();

//     final status = await Permission.microphone.request();
//     if (status != PermissionStatus.granted) {
//       throw RecordingPermissionException("Microphone permission");
//     }

//     await _audioRecorder.openAudioSession();
//     isRecorderInitialised = true;
//   }

//   void dispose() {
//     if (!isRecorderInitialised) return;

//     _audioRecorder.closeAudioSession();
//     _audioRecorder = null;
//     isRecorderInitialised = false;
//   }

//   final pathToSaveAudio = "audio_example.aac";

//   Future _record() async {
//     if (!isRecorderInitialised) return;

//     await _audioRecorder.startRecorder(toFile: pathToSaveAudio);
//   }

//   Future _stop() async {
//     if (!isRecorderInitialised) return;

//     await _audioRecorder.stopRecorder();
//   }

//   Future toggleRecording() async {
//     if (_audioRecorder.isStopped) {
//       await _stop();
//     } else {
//       await _record();
//     }
//   }
// }
