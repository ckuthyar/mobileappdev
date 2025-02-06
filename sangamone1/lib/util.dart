import 'dart:convert';
import 'dart:ui';

class Quiz{
  int? id;
  Color? color;
  String? question;
  String? answer;
  String? response;
  int? marks;

  Quiz({this.id,this.color,this.question,this.answer,this.response,this.marks});

  Map<dynamic,dynamic> jsonconv(){
    return {
      "id": id,
      "question": question,
      "answer":answer,
      "response":response,
      "marks":marks
    };
  }
}