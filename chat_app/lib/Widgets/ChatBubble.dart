import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Chatmessageentity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.Username=='Shaurya';

    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,

        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${entity.text}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (entity.imageurl != null)
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(entity.imageurl!)),
                    borderRadius: BorderRadius.circular(24)),

              )
          ],
        ),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isAuthor?Theme.of(context).primaryColor:Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
    ;
  }
}
