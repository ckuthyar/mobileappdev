import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App4(),
    );
  }
}

class App4 extends StatefulWidget {
  const App4({super.key});

  @override
  State<App4> createState() => _App4State();
}

class _App4State extends State<App4> {
  
  final channel = MethodChannel("com.example.sangamone3/sms");
  
  getLocation()async{
    var data = await channel.invokeMethod("location");
    return data;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: getLocation(), builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          else if(snapshot.hasData){
            return Center(
              child: Text("${snapshot.data}"),
            );
          }
          else{
            return Center(
              child: Text("no data found"),
            );
          }
        }),
      ),
    );
  }
}
