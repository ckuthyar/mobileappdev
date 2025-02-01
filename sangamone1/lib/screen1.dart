import 'package:flutter/material.dart';
import 'package:sangamone1/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();

  int a =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: tc1,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            Text("+",style: TextStyle(fontSize: 30),),
            TextField(
              controller: tc2,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ElevatedButton(onPressed: (){
            setState(() {
              a=int.parse(tc1.text)+int.parse(tc2.text);
            });
          }, child: Text("submit",style: TextStyle(color: Colors.white),),
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),),
            Text("$a",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Timings()));
      },
      child: Icon(Icons.arrow_forward_sharp),),
    );
  }
}
