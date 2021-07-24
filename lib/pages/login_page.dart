import 'package:flutter/material.dart';
import 'package:flutter_course/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(

        appBar: AppBar(title: Text('Scaffold app'),),
        

        body:Material(
          color:Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children:[
              Image.asset('assets/images/lo.png',fit:BoxFit.cover),
              SizedBox(
                height:20.0
              ),
              Text('Welcome',style:GoogleFonts.pacifico(textStyle:TextStyle(
                fontSize:30,
                fontWeight:FontWeight.bold,
                
              ),
              ),
              ),
              SizedBox(
                height:20.0
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical:18.0,horizontal:32.0),
                child: Column(
                  children:[
                    TextFormField(
                  decoration:InputDecoration(
                    hintText:"Enter Username",
                    labelText:"Username"
                    ),),
        
                
        
                TextFormField(
                  obscureText: true,
                  decoration:InputDecoration(
                    hintText:"Enter Password",
                    labelText:"Password",
                  ),
                ),
                  SizedBox(
                height:40.0
                ),
                  ElevatedButton(
                        child:Text("Login"),
                        onPressed: (){
                        Navigator.pushNamed(context,MyRoutes.homeRoute);
                    },
                      style:TextButton.styleFrom(
                      minimumSize:Size(150,40),
                    ),
                  ),
                  ]
                ),
              )
            ],
          ),
        )
      ),
   
      )
    );
  }
}
