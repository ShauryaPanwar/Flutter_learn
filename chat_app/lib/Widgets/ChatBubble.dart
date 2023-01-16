import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Chatmessageentity entity;
  final Alignment alignment;
  const ChatBubble({Key? key, required this.alignment, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${entity.text}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (entity.imageurl!=null)
              Image.network(
              '${entity.imageurl}',
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
    );;
  }
}
