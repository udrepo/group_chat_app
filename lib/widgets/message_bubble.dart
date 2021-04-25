import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String messageText;
  final Timestamp sentTime;
  final bool isMe;

  MessageBubble({this.sender, this.messageText, this.sentTime, this.isMe});

  @override
  Widget build(BuildContext context) {
    var date = sentTime.toDate();
    var formattedDate =
        DateFormat('kk:mm dd.MM.yyyy').format(date); // Apr 8, 2020

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 13, color: Colors.black38),
          ),
          SizedBox(
            height: 3,
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.circular(30) : Radius.circular(0),
                topRight: isMe ? Radius.circular(0) : Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: isMe ? Colors.lightBlueAccent : Colors.indigoAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageText,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            formattedDate,
            style: TextStyle(fontSize: 12, color: Colors.black26),
          ),
        ],
      ),
    );
  }
}
