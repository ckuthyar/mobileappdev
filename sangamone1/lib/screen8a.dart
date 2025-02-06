import 'package:flutter/material.dart';
import 'package:sangamone1/screen8b.dart';
import 'package:sangamone1/screen8c.dart';
import 'package:sangamone1/util.dart';

class Screen8a extends StatelessWidget {
  const Screen8a({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CapitalQuiz(),
    );
  }
}

class CapitalQuiz extends StatefulWidget {
  const CapitalQuiz({super.key});

  @override
  State<CapitalQuiz> createState() => _CapitalQuizState();
}

class _CapitalQuizState extends State<CapitalQuiz> {
  int sum = 0;
  List<String> Question = [
    "India", "USA", "UK", "France", "Italy", "Russia", "China", "Philippines", "Sri Lanka", "Japan"
  ];
  List<String> Answer = [
    "New Delhi", "Washington DC", "London", "Paris", "Rome", "Moscow", "Beijing", "Manila", "Colombo", "Tokyo"
  ];

  List<Quiz> list1 = [];

  Map<String, String> Ans = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Question.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("What is the Capital City of ${Question[index]}?"),
                subtitle: TextField(
                  onChanged: (value) {
                    setState(() {
                      Ans[Question[index]] = value.trim();
                    });
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              int score = 0;
              list1=[];
              for (int i = 0; i < Question.length; i++) {
                if (Ans[Question[i]] == Answer[i]) {
                  score++;
                  list1.add(Quiz(id: i,color: Colors.green,response: Ans[Question[i]],question: Question[i],answer: Answer[i],marks: 10));
                }
                else{
                  list1.add(Quiz(id: i,color: Colors.red,response: Ans[Question[i]],question: Question[i],answer: Answer[i],marks: 0));
                }
              }
              setState(() {
                sum = score;
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 20),
          Text("Result = ${sum*10} Marks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Quizresult(list1: list1,)));
      },
        label: Text("Result "),
        icon: Icon(Icons.table_chart),
          ),
    );
  }
}
