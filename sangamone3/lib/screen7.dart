import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sangamone3/screen8.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App7(),
    );
  }
}

class App7 extends StatefulWidget {
  const App7({super.key});

  @override
  State<App7> createState() => _App7State();
}

class _App7State extends State<App7> {
  
  final channel = MethodChannel("com.example.sangamone3/sms");
  
  getData() async{
    var data = await channel.invokeMethod("getMethod");

    var data1 = jsonDecode(data);

    return data1;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder(future: getData(), builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
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
              return Center(
                child: ListView.builder(itemCount: data?.length,itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text("${data?[index]}"),
                    ),
                  );
                }),
              );
            }
            else{
              return Center(
                child: Text("No data found"),
              );
            }
          }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>App8()));
      }),
    );
  }
}
