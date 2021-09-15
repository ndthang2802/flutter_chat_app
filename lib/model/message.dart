class Message {
  Message({
    required this.text,
    required this.time,
    required this.sender,
  });
  String text;
  String time;
  String sender;

  factory Message.fromJson(dynamic json) {
    return Message(
        text: json['text'] as String,
        time: json['time'] as String,
        sender: json['sender'] as String);
  }

  Map<String, dynamic> toJson() =>
      {'text': text, 'time': time, 'sender': sender};
}
