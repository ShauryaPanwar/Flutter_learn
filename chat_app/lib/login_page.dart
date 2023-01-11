import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);

final _formkey = GlobalKey<FormState>();

  void loginuser() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("LoggedIn!!!!");
      print(usernamecontroller.text);
      print(passwordcontroller.text);
    }
    else  print("Not Suncessfully loggedin");
  }

final usernamecontroller =TextEditingController();
  final passwordcontroller =TextEditingController();

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
              SizedBox(
                height: 15,
              ),
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
              SizedBox(
                height: 15,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                width: 400,
                height: 200,
              ),

              SizedBox(
                height: 18,
              ),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value!=null && value.isNotEmpty && value.length <5){
                          return "Invalid Username Input";
                        }
                        else if(value!=null && value.isEmpty){
                          return "Please type your Username";
                        }
                        return null;
                      },
                      controller: usernamecontroller,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:"Type your Username.",
                        hintStyle: TextStyle(color: Colors.amber)
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:"Type your Password.",
                          hintStyle: TextStyle(color: Colors.amber)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              ElevatedButton(
                  onPressed: loginuser,
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  )),
              SizedBox(
                height: 10,
              ),

              InkWell(
                splashColor: Colors.lime,
                onDoubleTap: (){
                  print("Double tapped");
                },
                onLongPress: (){
                  print("Long Pressed");
                },
                onTap: (){
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
