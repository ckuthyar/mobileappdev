import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera2/camera.dart';


class Screen10 extends StatelessWidget {
  const Screen10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App10(),
    );
  }
}

class App10 extends StatefulWidget {
  const App10({super.key});

  @override
  State<App10> createState() => _App10State();
}

class _App10State extends State<App10> {

  late CameraController controller1;
  XFile ?filepath;

  flash(){
    setState(() {
      controller1.setFlashMode(FlashMode.torch);
    });
  }

  @override
  void initState(){
    camerainit();
    super.initState();
  }

  void dispose(){
    controller1.dispose();
    super.dispose();
  }

  camerainit()async{
    List<CameraDescription> cameraDescription = await availableCameras();
    controller1 = CameraController(cameraDescription.first, ResolutionPreset.medium);
    await controller1.initialize();
    setState(() { });
  }

  videorecord(){
    setState(() {
      controller1.startVideoRecording();
      controller1.setFlashMode(FlashMode.torch);
    });
  }

  cancelvideo(){
    setState(() {
      controller1.stopVideoRecording();
      controller1.setFlashMode(FlashMode.off);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CameraPreview(controller1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(onPressed: (){
          setState(() async{
            filepath = await controller1.takePicture();
          });
        }, icon: Icon(Icons.camera),iconSize: 100,color: Colors.white,),
        IconButton(onPressed: (){
          setState(() {
            videorecord();
          });
        }, icon: Icon(Icons.video_call),iconSize: 100,color: Colors.white,),
        IconButton(onPressed: (){
          setState(() {
            cancelvideo();
          });
        }, icon: Icon(Icons.videocam_off),iconSize: 100,color: Colors.white,),
      ],
    ),
    );
  }
}
