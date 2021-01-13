import 'package:code_test_chat_app/helper/constant.dart';
import 'package:code_test_chat_app/providers/message.dart';
import 'package:code_test_chat_app/widgets/chat_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class ChatScreen extends StatefulWidget {
  final String img;
  final String name;

  ChatScreen({this.img, this.name});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      hideKeyboard(context);
      var msgModel = BHMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = BHSender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = BHMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = BHReceiver_id;

      msgController.text = '';

      if (mounted) scrollController?.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController?.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: appStore.textPrimaryColor)),
        title: Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(widget.img), radius: 16),
            5.width,
            Text(widget.name,
                style: TextStyle(
                    fontSize: 16,
                    color: appStore.textPrimaryColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            decoration: BoxDecoration(color: appStore.appColorPrimaryLightColor),
            child: ListView.separated(
              separatorBuilder: (_, i) => Divider(color: Colors.transparent),
              shrinkWrap: true,
              reverse: true,
              controller: scrollController,
              itemCount: msgListing.length,
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
              itemBuilder: (_, index) {
                BHMessageModel data = msgListing[index];
                var isMe = data.senderId == BHSender_id;

                return ChatMessageWidget(isMe: isMe, data: data);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              decoration:
                  BoxDecoration(color: appStore.appBarColor, boxShadow: defaultBoxShadow()),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: msgController,
                    focusNode: msgFocusNode,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration.collapsed(
                      hintText: personName.isNotEmpty
                          ? 'Write to ${widget.name}'
                          : 'Type a message',
                      hintStyle: primaryTextStyle(color: appStore.textPrimaryColor.withOpacity(0.4)),
                    ),
                    style: primaryTextStyle(color: appStore.textPrimaryColor),
                    onSubmitted: (s) {
                      sendClick();
                    },
                  ).expand(),
                  IconButton(
                    color: appStore.backgroundSecondaryColor,
                    icon: Icon(Icons.send, size: 25),
                    onPressed: () async {
                      sendClick();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
