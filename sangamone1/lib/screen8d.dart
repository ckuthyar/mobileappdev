import 'package:flutter/material.dart';
import 'package:sangamone1/screen8e.dart';

class Screen8d extends StatelessWidget {
  const Screen8d({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App8d(),
    );
  }
}

class App8d extends StatefulWidget {
  const App8d({super.key});

  @override
  State<App8d> createState() => _App8dState();
}

class _App8dState extends State<App8d> {

  List<String> Question = [
    "India", "USA", "UK", "France", "Italy", "Russia", "China", "Philippines", "Sri Lanka", "Japan"
  ];
  List<String> Answer = [
    "New Delhi", "Washington DC", "London", "Paris", "Rome", "Moscow", "Beijing", "Manila", "Colombo", "Tokyo"
  ];

  int index = 0;


  
  Map<dynamic,dynamic> correctAnswers = {};
  Map<dynamic,dynamic> map1 = {};
  TextEditingController response = TextEditingController();


  String Qv = "";
  @override
  Widget build(BuildContext context) {
    setState(() {
      Question.forEach((value) => correctAnswers[value]=Answer[Question.indexOf(value)] );
    });
    print(correctAnswers);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text("What is the Capital of ${Question[index]}",style: TextStyle(fontSize: 30),),
                subtitle: TextField(
                  controller: response,
                    style: TextStyle(fontSize: 30)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        index==0?null:index--;
                        response.text=map1[Question[index]];
                      });
                    },
                    child: Text("Previous",style: TextStyle(fontSize: 30)),
                  ),
                  index!=Question.length-1?ElevatedButton(onPressed: (){
                    setState(() {
                      map1[Question[index]]=response.text;
                      index==Question.length-1?null:index++;
                      response.text=map1[Question]==null?"":map1[Question[index]];
                      response.clear();
                      print(map1);
                    });
                  }, child: Text("Next",style: TextStyle(fontSize: 30))):
                      ElevatedButton(onPressed: (){
                        setState(() {
                          Qv="Quiz Over";
                        });
                      }, child: Text("Submit",style: TextStyle(fontSize: 30,color: Colors.white)),
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                      ),
                ],
              ),
              Text("$Qv"),
              Qv==""?Container():ListView.builder(shrinkWrap: true,itemCount: Question.length,itemBuilder: (context,index){
                return Text("${map1[Question[index]]}, ${Answer[index]}",style: TextStyle(fontSize: 26,color: map1[Question[index]]!=Answer[index]?Colors.red:Colors.black),);
              })
            ],
          ),
        ),
      ),
    );
  }
}
