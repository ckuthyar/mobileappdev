import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App1(),
    );
  }
}

class App1 extends StatefulWidget {
  const App1({super.key});

  @override
  State<App1> createState() => _App1State();
}

class _App1State extends State<App1> {

  final channel = MethodChannel("com.example.sangamone3/sms");
  var print1="";

  getprint() async{
    await channel.invokeMethod("smsSend",{"Phonenumber":tec1.text,"Text":tec2.text});
  }

  receive() async{
    var data = await channel.invokeMethod("readSms");
    return data;
  }
  @override
  void initState() {
    receive();
    super.initState();
  }

  TextEditingController tec1 = TextEditingController();
  TextEditingController tec2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              controller: tec1,
            ),
            TextField(
              controller: tec2,
            ),
            ElevatedButton(onPressed: (){
              getprint();
            }, child: Text("Send SMS")),
            
            FutureBuilder(future: receive(), builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
              var data = snapshot.data;
              return ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 20,itemBuilder: (context,index){
                return ListTile(
                  title: Text("${data?[index]["address"]}"),
                  subtitle: Text("${data?[index]["body"]}"),
                );
              });
            })
          ],
        ),
      ),
    );
  }
}
