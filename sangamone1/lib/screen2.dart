import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Timings(),
    );
  }
}

class Timings extends StatefulWidget {
  const Timings({super.key});

  @override
  State<Timings> createState() => _TimingsState();
}

class _TimingsState extends State<Timings> {

  Stream stream = Stream.periodic(Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(stream: stream, builder: (context,snapshot){
          var dt1 = DateTime.now();
          var dt2 = DateTime.now().toUtc();
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text("UTC",style: TextStyle(fontSize: 50),),
                Text("$dt2",style: TextStyle(fontSize: 50),),
                Padding(padding: EdgeInsets.all(30)),
                Text("Local",style: TextStyle(fontSize: 50),),
                Text("$dt1",style: TextStyle(fontSize: 50),)
              ],
            ),
          );
        }),
      ),
    );
  }
}


