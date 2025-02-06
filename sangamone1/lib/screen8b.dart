import 'package:flutter/material.dart';
import 'package:sangamone1/util.dart';


class Screen8b extends StatelessWidget {
  List<Quiz>? list1;
  Screen8b({super.key,this.list1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizResult(list1: list1,),
    );
  }
}

class QuizResult extends StatefulWidget {
  List<Quiz>? list1;
  QuizResult({super.key,this.list1});

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {


  @override
  Widget build(BuildContext context) {
    print(widget.list1?.map((value)=>value.jsonconv()).toList());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children:
            widget.list1!.map((value){
              Color? clr = value.color;
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: Text("${value.id}")),
                  Container(child: Text("${value.answer}")),
                  Container(child: Text("${value.response}")),
                  Container(child: Text("${value.marks}",style: TextStyle(color: clr),)),
                ],
              );
            }).toList(),
        ),
      ),
    );
  }
}
