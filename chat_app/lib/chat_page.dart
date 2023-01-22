import 'dart:convert';
import 'package:chat_app/Widgets/picker_body.dart';
import 'package:chat_app/models/image_from.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/Widgets/ChatBubble.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


// ignore_for_file: prefer_const_constructors
class ChatPage extends StatefulWidget {
  ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

final Imagerepo _rep = Imagerepo();

class _ChatPageState extends State<ChatPage> {
  final chatmessagecontroller = TextEditingController();
  String _selectedimageurl = "";

  void onsendpressed() async {
    String? Usernamefromcache = await context.read<Auth>().getusernamr();
    print("Chat Message: ${chatmessagecontroller.text}");
    final newchatmessage = Chatmessageentity(
        text: chatmessagecontroller.text,
        id: '244',
        createat: DateTime.now().millisecondsSinceEpoch,
        author:Author(Username:Usernamefromcache!
        )
    );
    onMessagesent(newchatmessage);

    if (_selectedimageurl.isNotEmpty) {
      newchatmessage.imageurl = _selectedimageurl;
    }

    chatmessagecontroller.clear();
    _selectedimageurl = '';
    setState(() {});
  }

  List<Chatmessageentity> _message = [];

  _loadinitialmessage() async {
    rootBundle.loadString('assets/mockdata.json').then((response) {
      final List<dynamic> decodedlist = jsonDecode(response) as List;
      final List<Chatmessageentity> _chatmessages = decodedlist.map((listitem) {
        return Chatmessageentity.fromJson(listitem);
      }).toList();

      setState(() {
        _message = _chatmessages;
      });
    });

    print("Mojua");
  }

  onMessagesent(Chatmessageentity ent) {
    _message.add(ent);
    setState(() {});
  }

  @override
  void initState() {
    _loadinitialmessage();
    super.initState();
  }

  String bb = "";

  void onimgpicked(String newimurl) {
    setState(() {
      _selectedimageurl = newimurl;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<Auth>().getusernamr();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        elevation: 0,
        title: Center(child: Text("Hi $username!!!!")),
        actions: [
          IconButton(
              onPressed: () {
                context.read<Auth>().updateusername("New Name");
              },
              icon: Icon(
                Icons.logout,
                size: 25,
              )),

          IconButton(
              onPressed: () {
                context.read<Auth>().logoutuser();
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
                      alignment: _message[index].author.Username ==
                              context.read<Auth>().getusernamr()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _message[index]);
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return NetworkImagePicker(
                            imgrep: _rep,
                            onimgselected: onimgpicked,
                          );
                        });
                  },
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
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
                    ),
                    if (_selectedimageurl.isNotEmpty)
                      Center(
                          child: Image.network(
                        _selectedimageurl,
                        width: 150,
                        height: 80,
                      )),
                  ],
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
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
