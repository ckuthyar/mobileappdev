import 'package:flutter/material.dart';
import 'package:sangamone1/screen3b.dart';

class Screen3a extends StatelessWidget {
  const Screen3a({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Clockincities(),
    );
  }
}

class Clockincities extends StatefulWidget {
  const Clockincities({super.key});

  @override
  State<Clockincities> createState() => _ClockincitiesState();
}

class _ClockincitiesState extends State<Clockincities> {

  List<dynamic> cities = ["Los Angeles","New York","London","Dubai","Bangalore","Singapore","Tokyo","Sydney"];
  List<dynamic> timings = [[8,5,0],["4:0","5:30","8:0","9:0","11:0"]];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(shrinkWrap: true,itemCount: timings[0].length,itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text("${cities[index]}"),
                subtitle: Text("${DateTime.now().toUtc().subtract(Duration(hours: timings[0][index],))}"),
              ),
            );
          }),
          ListView.builder(shrinkWrap: true,itemCount: timings[1].length,itemBuilder: (context,index){
            num indx = index + timings[0].length;
            var values = timings[1][index].split(":");
            return Card(
              child: ListTile(
                title: Text("${cities[int.parse("$indx")]}"),
                subtitle: Text("${DateTime.now().toUtc().add(Duration(hours: int.parse(values[0]),minutes: int.parse(values[1])))}"),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Clockincitiesb()));
      },
        child: Icon(Icons.arrow_forward_sharp),),
    );
  }
}

