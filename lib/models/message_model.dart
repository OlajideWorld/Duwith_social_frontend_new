import "package:flutter/material.dart";

import "user_data.dart";

enum MessageType {
  text,
  image, /*…*/
}

class MessageModel {
  final String id;
  final String chatId;
  final User sender;
  final String content;
  final DateTime timestamp;
  final MessageType type;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.sender,
    required this.content,
    required this.timestamp,
    this.type = MessageType.text,
  });
}
