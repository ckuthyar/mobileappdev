import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sangamone1/screen9.dart';

class Screen8e extends StatelessWidget {
  const Screen8e({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App1(),
    );
  }
}

class App1 extends StatefulWidget {
  const App1({super.key});

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {

  List<String> Question = [
    "India", "USA", "UK", "France", "Italy", "Russia", "China", "Philippines", "Sri Lanka", "Japan"
  ];
  List<String> Answer = [
    "New Delhi", "Washington DC", "London", "Paris", "Rome", "Moscow", "Beijing", "Manila", "Colombo", "Tokyo"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableWidget(json: """[{"Marks":"10","Question":"India","Answer":"New Delhi"}]"""),

    );
  }

  Widget TableWidget({required String json}){
    var list1;
    try{
      list1=jsonDecode(json);
      List keys = list1!.first.keys.toList();
      List<List<dynamic>> list2 =[];
      for (String i in keys){
        var data = list1.map((value)=>value[i]).toList();
        list2.add(data);
      }
      return GridView.builder(itemCount: keys.length+(keys.length*list1.length).toInt(),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: keys.length,childAspectRatio: 3), itemBuilder: (context,index){
        int value = index~/keys.length==0?index:index-keys.length;
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 1),
            color: index~/keys.length==0?Colors.yellow:Colors.transparent
          ),
          child: index~/keys.length==0?Center(child: Text("${keys[index]}",style: TextStyle(fontWeight: FontWeight.bold),)):Center(child: Text("${list2[value%keys.length][value~/keys.length]}")),
        );
      });
    }
    catch(e){
      debugPrint("Error: Json String not correct");
      return Center(child: Text("Error: Json String not correct"));
    }
  }
}

/*
* ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount: 4,itemBuilder: (context,index){
        return Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width/4,
              child: ListView.builder(shrinkWrap: true,itemCount: 4,itemBuilder: (context,index1){
                return Text("data");
              }),
            ),
          ],
        );
      })*/

/*GridView.builder(itemCount: 40,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 3), itemBuilder: (context,index){
        return Container(
            child: index%4==0?Text("${Question[index~/4]}"):index%4==1?Text("${Answer[index~/4]}"):index%4==2?Text("${Question[index~/4]}"):Text("${Answer[index~/4]}"),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 1)
          ),
        );
      })*/