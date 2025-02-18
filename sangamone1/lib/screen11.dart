import 'package:flutter/material.dart';
import 'package:sangamone1/util.dart';

class Screen11 extends StatelessWidget {
  const Screen11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App11(),
    );
  }
}

class App11 extends StatefulWidget {
  const App11({super.key});

  @override
  State<App11> createState() => _App11State();
}

class _App11State extends State<App11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: Apis.getWeather(577228), builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(snapshot.hasError){
          return Center(
            child: Text("Error Occured"),
          );
        }
        else if(snapshot.hasData){
          var data = snapshot.data;
          return ListTile(
            title: Text("${data}"),
          );
        }
        else{
          return Center(child: Text("No data"));
        }
      })
    );
  }
}
