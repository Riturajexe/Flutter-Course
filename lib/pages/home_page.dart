import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  
  //My variables are here
  
  //int stands for integer
  int day = 2;
  //int with a decimal is called double
  double days = 2.5;
  //String is a text
  String name = "Rituraj";
  //num can be used in place of double or int
  num dayss = 3.5;
  //var can be used as a common data type for all type of variables
  var bishu = 'tuesday';
  //const stand for constant means that once you write const you cant change the value of that variable
  const pi = 3.14;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Scaffold app'),),
        drawer: Drawer(),
        
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
