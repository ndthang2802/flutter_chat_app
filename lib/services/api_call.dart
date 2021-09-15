import 'package:flutter_chat_app/model/userModel.dart';
import 'package:http/http.dart' as http;
import '../model/conversation.dart';

import 'dart:convert';

class ApiCall {
  // static late ApiCall _instance;

  // ApiCall._();

  // static ApiCall get instance {
  //   if (_instance == null) {
  //     return ApiCall._();
  //   }
  //   return _instance;
  // }

  static Future<User> login(String username, String password) async {
    final response = await http.post(Uri.parse('http://localhost:5000/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, String>{'email': username, 'password': password}));

    var userObjJson = jsonDecode(response.body);
    User _user = User.fromJson(userObjJson['user']);
    return _user;
  }

  static Future<List<Conversation>> getConservation() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/conversation'));

    var conservationObjJson = jsonDecode(response.body) as List;
    List<Conversation> _csv =
        conservationObjJson.map((e) => Conversation.fromJson(e)).toList();
    return _csv;
  }

  static Future<bool> sendMessage(data, String id) async {
    var json = new Map();
    var messages = [];
    for (final item in data) {
      messages
          .add({"text": item.text, "time": item.time, "sender": item.sender});
    }
    json['messages'] = messages;

    print(jsonEncode(json));

    final response = await http.patch(
        Uri.parse('http://localhost:5000/conversation/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(json));
    if (response.statusCode == 200) {
      return true;
    } else
      return false;
  }
}
