import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

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



class Apis{

  static getWeather(int zip)async{
    var uri = Uri.parse("");
    var response = await http.get(uri,
    headers: {"Content-type":"Application/json"});
    if (response.statusCode==200){
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }
  }

}