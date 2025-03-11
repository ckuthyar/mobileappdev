import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen8 extends StatelessWidget {
  const Screen8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App8(),
    );
  }
}

class App8 extends StatefulWidget {
  const App8({super.key});

  @override
  State<App8> createState() => _App8State();
}

class _App8State extends State<App8> {

  String data1 ="";

  final channel = MethodChannel("com.example.sangamone3/sms");

  getPostMethod() async{
    var data = await channel.invokeMethod("postMethod");
    setState(() {
      data1 = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(child : Text("Click Here:- ${data1}"),
        onTap: getPostMethod,),
      ),
    );
  }
}
