import 'package:flutter/material.dart';
import 'package:sangamone1/util.dart';


class Screen8c extends StatelessWidget {
  List<Quiz>? list1;
  Screen8c({super.key,this.list1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quizresult(list1: list1,),
    );
  }
}


class Quizresult extends StatefulWidget {
  List<Quiz>? list1;
  Quizresult({super.key,this.list1});

  @override
  State<Quizresult> createState() => _QuizresultState();
}

class _QuizresultState extends State<Quizresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text("QNo",textAlign: TextAlign.center,),
                width: MediaQuery.sizeOf(context).width/4,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.black,width: 1)
                ),),
              Container(child: Text("Answer",textAlign: TextAlign.center,),
                width: MediaQuery.sizeOf(context).width/4,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.black,width: 1)
                ),),
              Container(child: Text("your",textAlign: TextAlign.center,),
                width: MediaQuery.sizeOf(context).width/4,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.black,width: 1)
                ),),
              Container(child: Text("marks",textAlign: TextAlign.center),
                width: MediaQuery.sizeOf(context).width/4,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(color: Colors.black,width: 1)
                ),),
            ],
          ),
          Column(
              children: widget.list1!.map((value){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: Text("${value.id}",textAlign: TextAlign.center,),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 1)
                            ),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Text("${value.answer}",textAlign: TextAlign.center,),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 1)
                            ),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Text("${value.response}",textAlign: TextAlign.center,style: TextStyle(color: value.color),),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 1)
                            ),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(child: Text("${value.marks}",textAlign: TextAlign.center,style: TextStyle(color: value.color),),
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black,width: 1)
                            ),),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList()
          ),
        ],
      ),
    );
  }
}
