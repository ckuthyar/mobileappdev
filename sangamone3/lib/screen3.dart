import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sangamone3/screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App3(),
    );
  }
}

class App3 extends StatefulWidget {
  const App3({super.key});

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {

  final channel = MethodChannel("com.example.sangamone3/sms");

  getWifi() async{
    var data = await channel.invokeMethod("scanWifi");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(future: getWifi(), builder: (context,snapshot){
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
            return Text("$data");
          }
          else{
            return Center(
              child: Text("No data found"),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>App4()))),
    );
  }
}
