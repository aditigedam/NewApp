import 'dart:convert';
import 'package:http/http.dart';

import 'newsmodel.dart';
class Api_manager{
  Future<NewModel> getNews()async{
    var client = new Client();
    Uri uri = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=40191c54976f41e896dbe10f89d3fa92');
    var response = (await client.get(uri));
    var jasonString = response.body;
    print(jasonString);
    Map<String, dynamic> jasonMap = json.decode(jasonString);
    var newModel =  NewModel.fromJson(jasonMap);
    print(newModel.articles);
    return newModel;
  }
}