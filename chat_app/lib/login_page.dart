import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfieldstyle.dart';
import 'package:flutter/material.dart';

import 'Widgets/logintextfield.dart';
// ignore_for_file: prefer_const_constructors

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginuser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("LoggedIn!!!!");
      print(usernamecontroller.text);
      print(passwordcontroller.text);

      Navigator.pushReplacementNamed(
          context,'/chat',arguments: '${usernamecontroller.text}');
    } else
      print("Not Suncessfully loggedin");
  }

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Let's Sign in !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  )),
              verticalspacing(15),
              Text(
                "Welcome back \n You've been missed!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey,
                  letterSpacing: 0.5,
                ),
              ),
              verticalspacing(15),
              Image.asset(
                'assets/Loginpic.jpg',
                width: 400,
                height: 200,
              ),
              verticalspacing(18),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Logintextfield(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Invalid Username Input";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your Username";
                        }
                        return null;
                      },
                      hintText: "Type Your Username..",
                      controller: usernamecontroller,

                    ),

                    verticalspacing(18),

                    Logintextfield(
                      hasaster: true,
                      controller: passwordcontroller,
                      hintText: "Type your password..",
                    )
                  ],
                ),
              ),
              verticalspacing(18),
              ElevatedButton(
                  onPressed: () {
                    loginuser(context);
                  },

                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  )
              ),
              verticalspacing(10),
              InkWell(
                splashColor: Colors.lime,
                onDoubleTap: () {
                  print("Double tapped");
                },
                onLongPress: () {
                  print("Long Pressed");
                },
                onTap: () {
                  //Navigate to browser
                  print("Browser link clicked!!");
                },
                child: Column(
                  children: [
                    Text("Find us on...."),
                    Text("Website.."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
