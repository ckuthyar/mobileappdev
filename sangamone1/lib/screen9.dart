import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Screen9 extends StatelessWidget {
  const Screen9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App9(),
    );
  }
}


class App9 extends StatefulWidget {
  const App9({super.key});

  @override
  State<App9> createState() => _App9State();
}

class _App9State extends State<App9> {

  @override
  void initState() {
    getlocation();
    super.initState();
  }

  var latitude = 0.0;
  var longitude =0.0;
  var altitude =0.0;

  Future getlocation() async{
    Location location = Location();
    location.requestPermission();
    try{
      var location1 = await location.getLocation();
      print(location1.latitude);
      setState(() {
        longitude=location1.longitude!;
        latitude=location1.latitude!;
        altitude=location1.altitude!;
      });
    }
    catch(e){
      print("Error $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "Latitude: $latitude \n",style: TextStyle(fontSize: 30,color: Colors.red)),
                TextSpan(text: "Longitude: $longitude\n",style: TextStyle(fontSize: 30,color: Colors.black)),
                TextSpan(text: "Altitude: $altitude",style: TextStyle(fontSize: 30,color: Colors.green))
              ],style: TextStyle(color: Colors.black)
            ),),
            ElevatedButton(onPressed: getlocation, child: Text("Get Location"))
          ],
        ),
      ),
    );
  }
}
