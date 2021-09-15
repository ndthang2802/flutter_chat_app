import 'package:flutter/material.dart';
import 'package:flutter_chat_app/provider.dart';
import 'package:provider/provider.dart';
import '../widget/searchbar.dart';
import '../widget/conversationItem.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.person),
                          backgroundColor: Colors.grey[100],
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Chat',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange[100]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.deepOrange,
                          size: 20,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'New',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
            createSearchBar(),
            chatProvider.fetchCsvStatus == FetchCsvStatus.loading
                ? Center(child: CircularProgressIndicator())
                : chatProvider.fetchCsvStatus == FetchCsvStatus.fail
                    ? Center(child: Text('fail'))
                    : Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: chatProvider.conversation.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ConversationItem(
                                      conversation:
                                          chatProvider.conversation[index]);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
