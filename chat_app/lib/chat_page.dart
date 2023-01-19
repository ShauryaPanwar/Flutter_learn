import 'dart:convert';

import 'package:chat_app/Widgets/ChatBubble.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: prefer_const_constructors
class ChatPage extends StatefulWidget {
  ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatmessagecontroller = TextEditingController();

  void onsendpressed() {
    print("Chat Message: ${chatmessagecontroller.text}");
    final newchatmessage = Chatmessageentity(text: chatmessagecontroller.text,
        id: '244',
        createat: DateTime.now().millisecondsSinceEpoch,
        author: Author(Username: bb ));
    onMessagesent(newchatmessage);
  }

  List<Chatmessageentity> _message = [];


  _loadinitialmessage() async {
    final response = await rootBundle.loadString('assets/mockdata.json');
    final List<dynamic> decodedlist = jsonDecode(response) as List;
    final List<Chatmessageentity> _chatmessages = decodedlist.map((listitem) {
      return Chatmessageentity.fromJson(listitem);
    }).toList();

    setState(() {
      _message = _chatmessages;
    });
  }

  onMessagesent(Chatmessageentity ent){
    _message.add(ent);
    setState(() {

    });
  }

  @override
  void initState() {
    _loadinitialmessage();
    super.initState();
  }

  String bb="";

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    bb=username;
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        elevation: 0,
        title: Center(child: Text("Hi $username!!!!")),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(
                Icons.logout,
                size: 25,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _message.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _message[index].author.Username == 'Shaurya'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      entity: _message[index]);
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
                Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      controller: chatmessagecontroller,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Type your message",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: InputBorder.none),
                    )),
                IconButton(
                  onPressed: () {
                    onsendpressed();
                  },
                  icon: Icon(Icons.send),
                  color: Colors.white,
                )
              ],
            ),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
