import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sangamone3/screen3.dart';
import 'package:sangamone3/screen4.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App2(),
    );
  }
}

class App2 extends StatefulWidget {
  const App2({super.key});

  @override
  State<App2> createState() => _App2State();
}

class _App2State extends State<App2> {

  final channel = MethodChannel("com.example.sangamone3/sms");

  getdevices()async{
    return await channel.invokeMethod("scanBlue");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: getdevices(), builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(snapshot.hasError){
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        else if(snapshot.hasData){
          var data = snapshot.data;
          return Center(child: Text("${data}",style: TextStyle(
            fontSize: 30,
          ),));
        }
        else{
          return Center(
            child: Text("no data found"),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>App3()))),
    );
  }
}
