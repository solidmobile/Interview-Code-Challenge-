
import 'package:code_test_chat_app/helper/constant.dart';

class MessageModel {
  String img;
  String name;
  String message;
  String lastSeen;

  MessageModel({this.img, this.name, this.message, this.lastSeen});
}

List<MessageModel> getMessageList() {
  List<MessageModel> messageList = List<MessageModel>();
  messageList.add(MessageModel(img: "assets/images/bh_dashedBoardImg2.jpg", name: 'Eric', message: 'Hi Jackson..', lastSeen: 'Now'));
  messageList.add(MessageModel(img: "assets/images/bh_dashedBoardImg3.jpg", name: 'Ava', message: 'Thank you.', lastSeen: '8:30 AM'));
  messageList.add(MessageModel(img: "assets/images/bh_dashedBoardImg6.jpg", name: 'Rei', message: 'Hello', lastSeen: 'Yesterday'));
  return messageList;
}

class BHMessageModel {
  int senderId;
  int receiverId;
  String msg;
  String time;

  BHMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}

List<BHMessageModel> getChatMsgData() {
  List<BHMessageModel> list = List();

  BHMessageModel c1 = BHMessageModel();
  c1.senderId = BHSender_id;
  c1.receiverId = BHReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  BHMessageModel c2 = BHMessageModel();
  c2.senderId = BHSender_id;
  c2.receiverId = BHReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  BHMessageModel c3 = BHMessageModel();
  c3.senderId = BHReceiver_id;
  c3.receiverId = BHSender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  BHMessageModel c4 = BHMessageModel();
  c4.senderId = BHSender_id;
  c4.receiverId = BHReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  BHMessageModel c5 = BHMessageModel();
  c5.senderId = BHSender_id;
  c5.receiverId = BHReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  BHMessageModel c6 = BHMessageModel();
  c6.senderId = BHReceiver_id;
  c6.receiverId = BHSender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  BHMessageModel c7 = BHMessageModel();
  c7.senderId = BHSender_id;
  c7.receiverId = BHReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  BHMessageModel c8 = BHMessageModel();
  c8.senderId = BHReceiver_id;
  c8.receiverId = BHSender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  BHMessageModel c9 = BHMessageModel();
  c9.senderId = BHSender_id;
  c9.receiverId = BHReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  BHMessageModel c10 = BHMessageModel();
  c10.senderId = BHReceiver_id;
  c10.receiverId = BHSender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  BHMessageModel c11 = BHMessageModel();
  c11.senderId = BHReceiver_id;
  c11.receiverId = BHSender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  BHMessageModel c12 = BHMessageModel();
  c12.senderId = BHSender_id;
  c12.receiverId = BHReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  BHMessageModel c13 = BHMessageModel();
  c13.senderId = BHSender_id;
  c13.receiverId = BHReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  BHMessageModel c14 = BHMessageModel();
  c14.senderId = BHReceiver_id;
  c14.receiverId = BHSender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  BHMessageModel c15 = BHMessageModel();
  c15.senderId = BHSender_id;
  c15.receiverId = BHReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  BHMessageModel c16 = BHMessageModel();
  c16.senderId = BHReceiver_id;
  c16.receiverId = BHSender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  BHMessageModel c17 = BHMessageModel();
  c17.senderId = BHSender_id;
  c17.receiverId = BHReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  BHMessageModel c18 = BHMessageModel();
  c18.senderId = BHReceiver_id;
  c18.receiverId = BHSender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}