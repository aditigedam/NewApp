import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  //
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds:3),()
    {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SpinKitFadingCube(
        duration: Duration(seconds: 5),
        color: Colors.blueAccent,
      ),
    );
  }
  //
  // void function() {
  //   Navigator.push(context,MaterialPageRoute(builder: (BuildContext)=>Home()));
  // }
}
