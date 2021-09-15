import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widget/conservationDetail.dart';

class ConversationItem extends StatefulWidget {
  ConversationItem({required this.conversation});
  final conversation;

  @override
  _ConversationItemState createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ConservationDetail(conservation: widget.conversation);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.grey[0],
                ),
                SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.conversation.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.online_prediction,
                            size: 20,
                            color: Colors.green[200],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(widget.conversation.messages.last.text),
                    ],
                  ),
                )
              ],
            )),
            Text(widget.conversation.messages.last.time)
          ],
        ),
      ),
    );
  }
}
