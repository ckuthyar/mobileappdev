import 'package:flutter/material.dart';
import 'package:sangamone1/screen5.dart';
import 'package:sangamone1/screen7a.dart';
import 'package:sangamone1/screen8a.dart';

class App1 extends StatelessWidget {
  const App1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Temp(),
    );
  }
}

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello World"),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Colorbyvalues()));
      },
        child: Icon(Icons.arrow_forward_sharp),),
    );
  }
}
