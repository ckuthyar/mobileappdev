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
      body: FutureBuilder(future: Apis.getWeather(577228), builder: (context,AsyncSnapshot<dynamic> snapshot){
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
          Map? data = snapshot.data;
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.5,
              height: MediaQuery.of(context).size.height/1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red,Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp),
              ),
              alignment: Alignment.center,
              child: DefaultTextStyle(style: TextStyle(color: Colors.white,fontSize: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Temperature: ${data?["main"]["temp"]}"),
                  Text("Pressure: ${data?["main"]["pressure"]}"),
                  Text("Humidity: ${data?["main"]["humidity"]}"),
                  Text("Sea Level: ${data?["main"]["sea_level"]}"),
                  Text("Visibility: ${data?["visibility"]}"),
                ],
              )),
            ),
          );
        }
        else{
          return Center(child: Text("No data"));
        }
      })
    );
  }
}
