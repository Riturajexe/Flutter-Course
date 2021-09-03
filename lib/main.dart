import 'package:flutter/material.dart';
import 'package:flutter_course/pages/cart_page.dart';
import 'package:flutter_course/pages/home_page.dart';
import 'package:flutter_course/pages/login_page.dart';
import 'package:flutter_course/utils/routes.dart';
import 'package:flutter_course/widgets/themes.dart';
// ignore: unused_import
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
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

    //this line removes the debug banner
      debugShowCheckedModeBanner: false,

      //Giving routes

      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      },

      //initial route gives the route which will open when app start for ex.=>""""initialRoute:"/home""""" this will open "/home" as default
      //initialRoute:"/home",

      //For dark theme
      //themeMode: ThemeMode.dark,
      //darkTheme: ThemeData(brightness: Brightness.dark),
    );
    //Calling my function bringvegetable
    // ignore: dead_code
    bringVegetables(rupees: 50, thaila: true);
  }

//How to write a function

  bringVegetables({int rupees = 100, required bool thaila}) {
    //Take cycle

    //Go to market
  }
}