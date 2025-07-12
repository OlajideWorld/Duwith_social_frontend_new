import "package:duwith_social/models/user_data.dart";
import "package:flutter/material.dart";

class ChatModel {
  final User user;
  final String lastmessage;
  final String lastTime;
  final bool isOnline;

  ChatModel({
    required this.user,
    required this.lastmessage,
    required this.lastTime,
    required this.isOnline,
  });
}
