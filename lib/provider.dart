import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/message.dart';
import 'package:flutter_chat_app/services/api_call.dart';
import 'package:flutter_chat_app/services/auth.dart';
//import 'package:flutter_chat_app/services/socket_connect.dart';
import 'package:socket_io_client/socket_io_client.dart';
import './model/userModel.dart';
import './model/conversation.dart';

enum LoginStatus { initial, loading, success, fail }
enum FetchCsvStatus { initial, loading, success, fail }

class ChatProvider extends ChangeNotifier {
  List<Conversation> conversation = [];

  late User user;

  late Socket socket;

  LoginStatus _loginStatus = LoginStatus.initial;
  FetchCsvStatus _fetchCsvStatus = FetchCsvStatus.initial;

  LoginStatus get loginStatus => _loginStatus;
  FetchCsvStatus get fetchCsvStatus => _fetchCsvStatus;

  Future<void> register(String email, String password) async {
    try {
      final x = await AutheMethods().registerWithEmail(email, password);
      print(x);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sendMessage(String message, String conversationId) async {
    try {
      Conversation newdata =
          conversation.firstWhere((element) => element.id == conversationId);

      newdata.messages
          .add(Message(text: message, time: '100', sender: user.id));
      final sendStatus =
          await ApiCall.sendMessage(newdata.messages, conversationId);
      print(sendStatus);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
