import 'package:code_test_chat_app/providers/message.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key key,
    @required this.isMe,
    @required this.data,
  }) : super(key: key);

  final bool isMe;
  final BHMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe.validate() ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (500 * 0.25).toDouble()) : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (500 * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: !isMe ? Colors.red.withOpacity(0.85) : appStore.backgroundColor.withOpacity(0.3),
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate()
                ? BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10), topRight: Radius.circular(10))
                : BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: isMe ? Theme.of(context).dividerColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(data.msg, style: primaryTextStyle(color: !isMe ? white : appStore.textPrimaryColor))),
              Text(data.time, style: secondaryTextStyle(color: !isMe ? white : appStore.textPrimaryColor, size: 9))
            ],
          ),
        ),
      ],
    );
  }
}