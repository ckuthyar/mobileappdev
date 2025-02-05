import 'package:flutter/material.dart';
import 'package:sangamone1/screen7a.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Colorpalet(),
    );
  }
}


class Colorpalet extends StatefulWidget {
  const Colorpalet({super.key});

  @override
  State<Colorpalet> createState() => _ColorpaletState();
}

class _ColorpaletState extends State<Colorpalet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(shrinkWrap: true,itemCount: 3,itemBuilder: (context,index){
            return Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              child: GridView.builder(itemCount: 8,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),itemBuilder: (context,index1){
                return Container(
                  color: Color.fromRGBO(index==0?255:0, index==1?255:0, index==2?255:0, 1/(index1+1)),
                );
              },),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChessBoard()));
      },
        child: Icon(Icons.arrow_forward_sharp),),
    );
  }
}

