
import 'package:camera2/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late List<CameraDescription> cameralist;

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

  late CameraController controller;

  getdetails()async{
    cameralist = await availableCameras();
    setState(() {
      controller = CameraController(cameralist.first, ResolutionPreset.medium);
      controller.initialize();
    });
  }

  @override
  void initState(){
    Future.sync(getdetails);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  var flast = "off";

  @override
  Widget build(BuildContext context) {
    return CameraPreview(controller,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(onPressed: (){
          setState(() {
            setState(() {
              if(flast=="off"){
                flast="on";
                controller.setFlashMode(FlashMode.torch);
              }
              else if(flast=="on"){
                flast="off";
                controller.setFlashMode(FlashMode.off);
              }
            });

          });
        }, child:Icon(Icons.light_mode) )
      ],
    ),);
  }
}
