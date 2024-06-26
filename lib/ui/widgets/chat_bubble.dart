import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget{
  const ChatBubble({Key? key, required this.message, required this.isCurrentUser}) : super(key: key);

  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(isCurrentUser? 64.0 : 16.0, 4 , isCurrentUser? 16.0 : 64.0, 4),
        child: Align(
                alignment: isCurrentUser? Alignment.centerRight : Alignment.centerLeft,
                child:DecoratedBox(
                  decoration: BoxDecoration(
                  color: isCurrentUser? Colors.deepPurple :  Color(0xff818181),
                  borderRadius: BorderRadius.circular(16),
            ),
                  child: Padding(
                  padding: const EdgeInsets.all(12),

                  child: Text(
                  message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
                ),
              ),
            ),
            )

    )
    );
  }

}