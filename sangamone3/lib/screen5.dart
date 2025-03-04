import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App5(),
    );
  }
}


class App5 extends StatefulWidget {
  const App5({super.key});

  @override
  State<App5> createState() => _App5State();
}

class _App5State extends State<App5> {

  final channel = MethodChannel("com.example.sangamone3/sms");
  
  getInfo()async{
    var data = await channel.invokeMethod("getinfo");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: getInfo(), builder: (context,snapshot){
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
            return Center(
              child: Text("${snapshot.data}"),
            );
          }
          else{
            return Center(
              child: Text("No data found"),
            );
          }
        }),
      ),
    );
  }
}
