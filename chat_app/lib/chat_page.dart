import 'package:chat_app/Widgets/ChatBubble.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class ChatPage extends StatelessWidget {
   ChatPage({Key? key}) : super(key: key);
final chatmessagecontroller=TextEditingController();


void onsendpressed(){
  print("Chat Message: ${chatmessagecontroller.text}");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text("Hi Shaurya!!!!")),
        actions: [
          IconButton(
              onPressed: () {
                print("Icon Pressed");
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(

            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      message: "Hello Amigos !!!!");
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
                    border: InputBorder.none
                  ),
                )),
                IconButton(
                  onPressed: () {onsendpressed();},
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
