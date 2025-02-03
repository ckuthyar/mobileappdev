import 'package:flutter/material.dart';

class Screen7a extends StatelessWidget {
  const Screen7a({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChessBoard(),
    );
  }
}

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(itemCount: 64,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), itemBuilder: (context,index){
        int row = index~/8;
        int col = index%8;
        return Container(
          decoration: BoxDecoration(
            color: (row+col)%2==0 ?Colors.black:Colors.white,
            border: Border.all(color: Colors.black,width: 1)
          ),
        );
      }),
    );
  }
}
