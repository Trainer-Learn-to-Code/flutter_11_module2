import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:audioplayers/audioplayers.dart';

class VideoRecordingApp1 extends StatefulWidget {
  @override
  _VideoRecordingApp1State createState() => _VideoRecordingApp1State();
}

class _VideoRecordingApp1State extends State<VideoRecordingApp1> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  AudioPlayer? _audioPlayer;
  bool _recording = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializeAudioPlayer();
  }

  void _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras![0], ResolutionPreset.high);
    await _controller!.initialize();
    setState(() {});
  }

  void _initializeAudioPlayer() {
    _audioPlayer = AudioPlayer();
  }

  void _startRecording() async {
    await _controller!.startVideoRecording();
    await _audioPlayer!.play(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    setState(() {
      _recording = true;
    });
  }

  void _stopRecording() async {
    await _controller!.stopVideoRecording();
    await _audioPlayer!.stop();
    setState(() {
      _recording = false;
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _audioPlayer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Video Recording App')),
      body: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: CameraPreview(_controller!),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(_recording ? Icons.stop : Icons.fiber_manual_record),
                  onPressed: _recording ? _stopRecording : _startRecording,
                  color: _recording ? Colors.red : Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
