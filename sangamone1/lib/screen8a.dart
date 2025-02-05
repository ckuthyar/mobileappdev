import 'package:flutter/material.dart';

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
              for (int i = 0; i < Question.length; i++) {
                if (Ans[Question[i]] == Answer[i]) {
                  score++;
                }
              }
              setState(() {
                sum = score;
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 20),
          Text("Result = $sum", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
