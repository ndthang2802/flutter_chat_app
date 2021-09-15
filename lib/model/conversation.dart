import 'package:flutter_chat_app/model/userModel.dart';

import 'message.dart';

class Conversation {
  Conversation(
      {required this.id,
      required this.userAttends,
      required this.messages,
      required this.name});
  List<Message> messages;
  List<UserAttends> userAttends;
  String name;
  final id;

  factory Conversation.fromJson(dynamic json) {
    var useAttendsObjJson = json['usersAttends'] as List;
    List<UserAttends> _userAttends =
        useAttendsObjJson.map((e) => UserAttends.fromJson(e)).toList();
    if (json['messages'] != null) {
      var messagesObjJson = json['messages'] as List;
      List<Message> _messages =
          messagesObjJson.map((e) => Message.fromJson(e)).toList();

      return Conversation(
          id: json['id'] as String,
          userAttends: _userAttends,
          messages: _messages,
          name: json['name'] as String);
    } else {
      return Conversation(
          id: json['id'] as String,
          userAttends: _userAttends,
          messages: <Message>[],
          name: json['name'] as String);
    }
  }
}
