 import 'dart:convert';
import 'package:http/http.dart';
import 'package:new_app/services/techapi.dart';

import 'newindia.dart';
import 'newsmodel.dart';
class Api_manager{
  Future<NewModel> getNews()async{
    var client = new Client();
    Uri uri = Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=40191c54976f41e896dbe10f89d3fa92');
    var response = (await client.get(uri));
    var jasonString = response.body;
     print(jasonString);
    Map<String, dynamic> jasonMap = json.decode(jasonString);
    var newModel =  NewModel.fromJson(jasonMap);
   // print(newModel.articles);
    return newModel;
  }
  Future<NewsIndia> getNewsIndia()async{
    var client = new Client();
    Uri uri = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=40191c54976f41e896dbe10f89d3fa92');
    var response = (await client.get(uri));
    var jasonString = response.body;
    print(jasonString);
    Map<String, dynamic> jasonMap = json.decode(jasonString);
    var newModel =  NewsIndia.fromJson(jasonMap);
    print('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    print(newModel.articles);
    return newModel;
  }
  Future<NewsTech> getTech()async{
    var client = new Client();
    Uri uri = Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=40191c54976f41e896dbe10f89d3fa92');
    var response = (await client.get(uri));
    var jasonString = response.body;
    print(jasonString);
    Map<String, dynamic> jasonMap = json.decode(jasonString);
    var newModel =  NewsTech.fromJson(jasonMap);
    // print(newModel.articles);
    return newModel;
  }
}