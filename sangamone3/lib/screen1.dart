import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App1(),
    );
  }
}

class App1 extends StatefulWidget {
  const App1({super.key});

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {



  final channel = MethodChannel("com.example.sangamone3/sms");
  var print1="";

  getprint() async{
    var data = await channel.invokeMethod("sms");
    setState(() {
      print1=data;
    });
  }
  
  @override
  void initState() {
    getprint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(print1),
      ),
    );
  }
}
