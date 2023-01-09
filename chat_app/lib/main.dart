import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Boobies",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: LoginPage(),
    );
  }
}





