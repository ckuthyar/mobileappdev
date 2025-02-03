import 'package:flutter/material.dart';

class Screen3c extends StatelessWidget {
  const Screen3c({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CitiesClock(),
    );
  }
}

class CitiesClock extends StatefulWidget {
  const CitiesClock({super.key});

  @override
  State<CitiesClock> createState() => _CitiesClockState();
}

class _CitiesClockState extends State<CitiesClock> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1)),
        builder: (context, snapshot) {
          DateTime dt = DateTime.now().toUtc();
          return Column(
            children: [
              Container(
                child:Text("Los Angeles",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.subtract(Duration(hours: 8))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("New York",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.subtract(Duration(hours: 5))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("London",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.subtract(Duration(hours: 0))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("Dubai",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.add(Duration(hours: 4))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("Bangalore",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.add(Duration(hours: 5,minutes: 30))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("Singapore",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.add(Duration(hours: 8))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("Tokyo",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.add(Duration(hours: 9))}",style: TextStyle(fontSize: 30),),
              Container(
                child: Text("Sydney",style: TextStyle(fontSize: 30),),
              ),
              Text("${dt.add(Duration(hours: 11))}",style: TextStyle(fontSize: 30),),

            ],
          );
        }
      ),
    );
  }
}
