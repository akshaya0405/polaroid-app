import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'collage_screen.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (imagePaths.length >= 3) return;

    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      setState(() {
        imagePaths.add(image.path);
      });

      if (imagePaths.length == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollageScreen(images: imagePaths),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CameraPreview(_controller),
                Positioned(
                  bottom: 20,
                  child: FloatingActionButton(
                    onPressed: _takePicture,
                    child: Icon(Icons.camera),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
