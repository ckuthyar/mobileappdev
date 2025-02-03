import 'package:flutter/material.dart';
import 'package:sangamone1/screen4a.dart';

class Screen3b extends StatelessWidget {
  const Screen3b({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Clockincitiesb(),
    );
  }
}

class Clockincitiesb extends StatefulWidget {
  const Clockincitiesb({super.key});

  @override
  State<Clockincitiesb> createState() => _ClockincitiesbState();
}

class _ClockincitiesbState extends State<Clockincitiesb> {

  List<String> list1 = ["Los Angeles","New York","London","Dubai","Bamgalore","Singapore","Tokyo","Sydney"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1)),
        builder: (context, snapshot) {
          DateTime city1 = DateTime.now().toUtc().subtract(Duration(hours: 8));
          DateTime city2 = DateTime.now().toUtc().subtract(Duration(hours: 5));
          DateTime city3 = DateTime.now().toUtc().subtract(Duration(hours: 0));
          DateTime city4 = DateTime.now().toUtc().add(Duration(hours: 4));
          DateTime city5 = DateTime.now().toUtc().add(Duration(hours: 5,minutes: 30));
          DateTime city6 = DateTime.now().toUtc().add(Duration(hours: 8));
          DateTime city7 = DateTime.now().toUtc().add(Duration(hours: 9));
          DateTime city8 = DateTime.now().toUtc().add(Duration(hours: 11));
          List<dynamic> list2 = [city1,city2,city3,city4,city5,city6,city7,city8];
          return ListView.builder(shrinkWrap: true,itemCount: list1.length,itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text("${list1[index]}",style: TextStyle(fontSize: 24),),
                subtitle: Text("${list2[index]}",style: TextStyle(fontSize: 24),),
              ),
            );
          });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EMICalculator()));
      },
        child: Icon(Icons.arrow_forward_sharp),),
    );
  }
}
