import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider.dart';
import 'package:provider/provider.dart';

class ConservationDetail extends StatefulWidget {
  ConservationDetail({
    required this.conservation,
  });

  final conservation;

  @override
  _ConservationDetailState createState() => _ConservationDetailState();
}

class _ConservationDetailState extends State<ConservationDetail> {
  TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.white10,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Someone',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Online',
                      style: TextStyle(fontSize: 12, color: Colors.green[200]),
                    )
                  ],
                )),
                Icon(Icons.settings)
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: widget.conservation.messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Align(
                      alignment: chatProvider.user.id ==
                              widget.conservation.messages[index].sender
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: chatProvider.user.id ==
                                              widget.conservation
                                                  .messages[index].sender
                                          ? Colors.grey.shade100
                                          : Colors.blue[200]),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                      widget.conservation.messages[index].text,
                                      style: TextStyle(fontSize: 15))),
                            ]),
                      )),
                );
              }),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(children: [
                Icon(Icons.toys_outlined),
                SizedBox(width: 15),
                Expanded(
                    child: TextField(
                  controller: _message,
                  decoration: InputDecoration(
                    hintText: 'Type message',
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                )),
                SizedBox(width: 15),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    chatProvider.sendMessage(
                        _message.text, widget.conservation.id);
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                  backgroundColor: Colors.blue,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
