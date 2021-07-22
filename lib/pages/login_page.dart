import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(

        appBar: AppBar(title: Text('Scaffold app'),),
        drawer: Drawer(),


        body:Material(
        child: Center(
          child: Container(
            child: Text("Login Page",style: TextStyle(
              fontSize: 40,
              color:Colors.blue,
              fontWeight:FontWeight.bold,
            ),),
          ),
        ),
      ),
   
      )
    );
  }
}