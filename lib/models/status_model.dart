import "package:flutter/material.dart";

import "user_data.dart";

class StatusModel {
  final String id;
  final User user;
  final String imageUrl;
  final DateTime postedAt;

  StatusModel({
    required this.id,
    required this.user,
    required this.imageUrl,
    required this.postedAt,
  });
}
