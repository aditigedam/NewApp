import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens/home.dart';
import 'screens/loading.dart';

void main() {
  runApp(  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:'/' ,
    routes: {
      '/':(context) => Loading(),
       '/home':(context)=>Home(),
      // '/location':(context)=>ChooseLocation(),
    },
  ));
}



