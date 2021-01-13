import 'package:code_test_chat_app/providers/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
  List<MessageModel> messageList;

  @override
  void initState() {
    super.initState();
    messageList = getMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                  color: appStore.textPrimaryColor.withOpacity(0.3), indent: 6),
              itemCount: messageList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    String img = messageList[index].img;
                    String name = messageList[index].name;
                    ChatScreen(img: img, name: name).launch(context);
                  },
                  child: Row(
                    children: [
                      messageList[index].img.validate().startsWith('http')
                          ? Image.network(messageList[index].img)
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage(messageList[index].img),
                              radius: 25),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              messageList[index].name,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: appStore.textPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          8.height,
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(messageList[index].message,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: appStore.textPrimaryColor
                                        .withOpacity(0.6))),
                          ),
                        ],
                      ).expand(),
                      Text(messageList[index].lastSeen,
                          style: TextStyle(
                              color: appStore.textPrimaryColor.withOpacity(0.6),
                              fontSize: 14)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
