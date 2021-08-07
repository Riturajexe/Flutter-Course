import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Rituraj";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Scaffold App",
          // style: TextStyle(
          //   color: Colors.black,
          // ),
        ),
        
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter by $name"),
        ),
      ),
    );
  }
}
