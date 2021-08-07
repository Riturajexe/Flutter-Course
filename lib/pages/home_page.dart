import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Rituraj";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Scaffold App",
          
           style: TextStyle(
             fontFamily: GoogleFonts.pacifico().fontFamily,
           ),
        ),
        
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text(context.runtimeType.toString()),
        ),
      ),
    );
  }
}
