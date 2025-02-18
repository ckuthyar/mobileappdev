import 'package:flutter/material.dart';
import 'package:sangamone1/screen3c.dart';
import 'package:sangamone1/screen5.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cites(),
    );
  }
}

class Cites extends StatefulWidget {
  const Cites({super.key});

  @override
  State<Cites> createState() => _CitesState();
}

class _CitesState extends State<Cites> {

  List<String> list1 = ["Los Angeles","New York","London","Dubai","Bamgalore","Singapore","Tokyo","Sydney"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cites"),
      ),
      body: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          DateTime city1 = DateTime.now().toUtc().subtract(const Duration(hours: 8));
          DateTime city2 = DateTime.now().toUtc().subtract(const Duration(hours: 5));
          DateTime city3 = DateTime.now().toUtc().subtract(const Duration(hours: 0));
          DateTime city4 = DateTime.now().toUtc().add(const Duration(hours: 4));
          DateTime city5 = DateTime.now().toUtc().add(const Duration(hours: 5,minutes: 30));
          DateTime city6 = DateTime.now().toUtc().add(const Duration(hours: 7,minutes: 30));
          DateTime city7 = DateTime.now().toUtc().add(const Duration(hours: 8,minutes: 30));
          DateTime city8 = DateTime.now().toUtc().add(const Duration(hours: 10,minutes: 30));
          List<dynamic> list2 = [city1,city2,city3,city4,city5,city6,city7,city8];
          return ListView.builder(shrinkWrap: true,itemCount: list1.length,itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(list1[index],style: const TextStyle(fontSize: 24),),
                subtitle: Text("${list2[index]}",style: const TextStyle(fontSize: 24),),
              ),
            );
          });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CitiesClock()));
      },
      child: const Icon(Icons.arrow_forward_sharp),),
    );
  }
}
