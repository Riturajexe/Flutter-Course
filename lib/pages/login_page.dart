import 'package:flutter/material.dart';
import 'package:flutter_course/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

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
                      child: Form(
                        key: _formKey,
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username cannot be empty";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value.length < 6) {
                                  return 'Password length should be greater than 6';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 40.0),
                            Material(
                              color: Colors.deepPurple,
                              
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 8),
                              child: InkWell(
                                onTap: () => MoveToHome(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  height: 50, width: changeButton ? 50 : 140,
                                  alignment: Alignment.center,
                                  // decoration: BoxDecoration(

                                  //   //shape:changeButton?BoxShape.circle:BoxShape.rectangle,
                                  //   color: Colors.deepPurple,

                                  // ),
                                  child: changeButton
                                      ? Icon(Icons.done)
                                      : Text("Login",
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
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              )),
            )));
  }
}
