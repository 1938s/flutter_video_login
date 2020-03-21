import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget{
  //重写build方法
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Welcome to Flutteraa',
      home:Scaffold(
        appBar:AppBar(
          title:Text('Welcome to Flutter'),
        ),
        body:Center(
          child:Text('Hello World'),
        ),
      ),
    );
  }
}
