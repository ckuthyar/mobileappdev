import 'package:flutter/material.dart';
import 'package:sangamone1/screen6.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Colorbyvalues(),
    );
  }
}

class Colorbyvalues extends StatefulWidget {
  const Colorbyvalues({super.key});

  @override
  State<Colorbyvalues> createState() => _ColorbyvaluesState();
}

class _ColorbyvaluesState extends State<Colorbyvalues> {

  int r = 0;
  int g = 0;
  int b = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                r = int.parse(value);
              });
            },
          ),
          TextField(
            onChanged: (value){
              setState(() {
                g = int.parse(value);
              });
            },
          ),
          TextField(
            onChanged: (value){
              setState(() {
                b = int.parse(value);
              });
            },
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 400,
            color: Color.fromRGBO(r, g, b, 1),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Colorpalet()));
      },
        child: Icon(Icons.arrow_forward_sharp),),
    );
  }
}

