import 'package:flutter/material.dart';
import 'package:sangamone1/screen5.dart';

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

  emicalculator(){
    var p = int.parse(principal.text);
    var t = int.parse(time.text);
    var r = int.parse(rate.text);
    var si = (p*t*r)/100;
    var amt = p+si;
    emi = amt/(t*12);
  }


  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: principal,
            ),
            TextField(
              controller: time,
            ),
            TextField(
              controller: rate,
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                emicalculator();
                print(emi);
              });
            }, child: Text("Submit")),
            Text("${emi}")
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Colorbyvalues()));
        },
          child: Icon(Icons.arrow_forward_sharp),),
      )
    );
  }
}
