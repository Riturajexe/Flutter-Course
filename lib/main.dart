import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home_page.dart';
import 'package:flutter_course/pages/login_page.dart';
import 'package:flutter_course/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),

      //For adjusting color of all widgets accordingly in light way **do not work with themeMode: ThemeMode.dark,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        
      ),

    //this line removes the debug banner
    debugShowCheckedModeBanner: false,

      //Giving routes

      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
      },

      //initial route gives the route which will open when app start for ex.=>""""initialRoute:"/home""""" this will open "/home" as default
      //initialRoute:"/home",

      //For dark theme
      //themeMode: ThemeMode.dark,
      //darkTheme: ThemeData(brightness: Brightness.dark),
    );
    //Calling my function bringvegetable
    bringVegetables(rupees: 50, thaila: true);
  }

//How to write a function

  bringVegetables({int rupees = 100, required bool thaila}) {
    //Take cycle

    //Go to market
  }
}
