import 'package:chat_app/Widgets/ChatBubble.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_stateful_demo.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Auth.init();
  runApp(ChangeNotifierProvider(create: (BuildContext context)=> Auth(),
    child: ChatApp(),
  )
  );
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Boobies",
      theme: ThemeData(
        canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.black)),
      home: FutureBuilder<bool>(
        future: context.read<Auth>().isloggedin(),
        builder: (context,AsyncSnapshot<bool> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData && snapshot.data!){
              return ChatPage();
            }
            else return LoginPage();
          }


          return CircularProgressIndicator();
        }),

      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
