import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sangamone3/screen7.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App6(),
    );
  }
}

class App6 extends StatefulWidget {
  const App6({super.key});

  @override
  State<App6> createState() => _App6State();
}

class _App6State extends State<App6> {
  
  final channel = MethodChannel("com.example.sangamone3/sms");

  getSimState()async{
    String data = await channel.invokeMethod("simstate");
    return data;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: getSimState(), builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
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
            return Center(
              child: Text("${data}"),
            );
          }
          else{
            return Center(
              child: Text("No data found"),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>App7()))),
    );
  }
}
