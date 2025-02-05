import 'package:flutter/material.dart';
import 'package:sangamone1/screen5.dart';
import 'package:sangamone1/temp.dart';

class Screen4a extends StatelessWidget {
  const Screen4a({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EMICalculator(),
    );
  }
}

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}


class _EMICalculatorState extends State<EMICalculator> {
  
  TextEditingController principal = TextEditingController();
  TextEditingController time =TextEditingController();
  TextEditingController rate = TextEditingController();
  var emi =0.0;
  var amt = 0.0;

  emicalculator(){
    var p = int.parse(principal.text);
    var t = int.parse(time.text);
    var r = int.parse(rate.text);
    var si = (p*t*r)/100; 
    amt = p+si; 
    emi = amt/(t*12).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: TextField(
                controller: principal,
                  style: TextStyle(fontSize: 30,),
              ),
            ),
            TextField(
              controller: time,
                style: TextStyle(fontSize: 30),
            ),
            TextField(
              controller: rate,
                style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                emicalculator();
                print(emi);
              });
            }, child: Text("Submit",style: TextStyle(fontSize: 30)),),
            Text("EMI:- ${emi.toInt()}",style: TextStyle(fontSize: 30),),
            Text("Total Amount :- $amt",style: TextStyle(fontSize: 30),)
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Temp()));
        },
          child: Icon(Icons.arrow_forward_sharp),),
      )
    );
  }
}
