import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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

            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hola Amigos!!!!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                          width: 150,
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hola Amigos!!!!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                          width: 150,
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(

                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Hola Amigos!!!!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                          width: 150,
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12))),
                  ),
                ),

              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.add), color: Colors.white,),
                IconButton(onPressed: (){}, icon:Icon(Icons.send), color: Colors.white,)

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
