class Message {
  final String id;
  final String senderId;
  final String recipientId;
  final String content;
  final String? media;
  final bool read;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.content,
    this.media,
    required this.read,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      senderId: json['sender'],
      recipientId: json['recipient'],
      content: json['content'],
      media: json['media'],
      read: json['read'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'sender': senderId,
      'recipient': recipientId,
      'content': content,
      'media': media,
      'read': read,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
