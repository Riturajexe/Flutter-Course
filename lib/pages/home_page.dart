import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override




  int day = 2;
  double days = 2.5;

  String name = "Rituraj";
  //num can be used in place of double or int
  num dayss = 3.5;
  //var can be used as a common data type for all type of variables
  var bishu = 'tuesday';

  //const pi = 3.14;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(title: Text('Scaffold app'),),
 
        body:Material(
        child: Center(
          child: Container(
            child: Text("Hello world! Day_$day by $name"),
          ),
        ),
      ),
   
      )
      );
  }
}