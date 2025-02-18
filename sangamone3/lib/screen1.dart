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

  List<Map<dynamic,dynamic>> list1 = [
    {
      "name":"Chandrashekar Rao Kuthyar",
      "mobile":9481851276
    },
    {
      "name":"Abhishek Kini",
      "mobile":9844101520
    },
    {
      "name":"Seetharam",
      "mobile":9008321705
    },
    {
      "name":"Kishan",
      "mobile":9894153983
    },
    {
      "name":"Sivashankar",
      "mobile":8762467173
    },

  ];

  final channel = MethodChannel("com.example.sangamone3/sms");
  var print1="";

  getprint() async{
    var data = await channel.invokeMethod("print");
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
