import 'package:flutter/material.dart';
import 'package:flutter_course/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';


//Stateful widget is used for making a widget which can be reloaded many times

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Scaffold app'),
            ),
            body: Material(
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Image.asset('assets/images/lo.png', fit: BoxFit.cover),
                  SizedBox(height: 20.0),
                  Text(
                    'Welcome $name',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 32.0),
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Username",
                                labelText: "Username"),
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                            ),
                          ),
                          SizedBox(height: 40.0),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                changeButton = true;
                              });

                              await Future.delayed(Duration(seconds:1));
                              Navigator.pushNamed(context, MyRoutes.homeRoute);
                            },
                            //below is a AnimatedContainer which is used for showing some animatinons in a Container
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 50, width: changeButton?50:140, 
                              alignment:Alignment.center,
                              decoration: BoxDecoration(
                                
                                //shape:changeButton?BoxShape.circle:BoxShape.rectangle,
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(changeButton ? 50 : 8)
                              ),
                              child: changeButton?Icon(Icons.done):Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      )),
                              // ElevatedButton(
                              //   child: Text("Login"),
                              //   onPressed: () {
                              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                              //   },
                              //   style: TextButton.styleFrom(
                              //     minimumSize: Size(150, 40),
                              //   ),
                              // ),
                            ),
                          )
                        ],
                      )),
                ],
              )),
            )));
  }
}