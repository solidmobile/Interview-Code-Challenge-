import 'dart:convert';
import 'dart:io';
import 'package:code_test_chat_app/helper/constant.dart';
import 'package:code_test_chat_app/helper/sp.dart';
import 'package:code_test_chat_app/widgets/select_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String userName = "";
  String userEmail = "";
  String userPwd = "";

  var _userEmail = '';
  var _userName = '';

  File _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    loadDetails();
    super.initState();
  }

  loadDetails() async {
    await getString(sharedPreferenceRegisteredKey).then((value) {
      final retrievedData = json.decode(value);
      print("regData $retrievedData");

      setState(() {
        userName = retrievedData["username"];
        userEmail = retrievedData["email"];
        userPwd = retrievedData["password"];
      });
    });
  }

  Future _getImage() async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('no permission！');
    }
  }

  _displayDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 6,
            backgroundColor: Colors.transparent,
            child: _dialogWithTextField(context),
          );
        });
  }

  _update() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();

      final regData = json.encode({
        'email': _userEmail,
        'username': _userName,
        'password': userPwd,
      });

      //save
      setString(sharedPreferenceRegisteredKey, regData);
      Navigator.of(context).pop(true);
    }
  }

  Widget _dialogWithTextField(BuildContext context) => Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: appStore.scaffoldBackground,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 24),
            Text(
              "Edit Profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              key: ValueKey('email'),
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              enableSuggestions: false,
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address.';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email address',
              ),
              onSaved: (value) {
                _userEmail = value;
                setState(() {
                  userEmail = value;
                });
              },
            ),
            TextFormField(
              key: ValueKey('username'),
              autocorrect: true,
              textCapitalization: TextCapitalization.words,
              enableSuggestions: false,
              validator: (value) {
                if (value.isEmpty || value.length < 4) {
                  return 'Please enter at least 4 characters';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Username'),
              onSaved: (value) {
                _userName = value;
                setState(() {
                  userName = value;
                });
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                  ),
                ),
                SizedBox(width: 8),
                RaisedButton(
                  color: Colors.white,
                  child: Text(
                    "Save".toUpperCase(),
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  onPressed: () {
                    _update();
                    // return Navigator.of(context).pop(true);
                  },
                )
              ],
            )
          ],
        ),
      ));

  Widget text(
    String text, {
    var fontSize = textSizeLargeMedium,
    Color textColor,
    var fontFamily,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5,
    bool textAllCaps = false,
    var isLongText = false,
    bool lineThrough = false,
  }) {
    return Text(
      textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: fontFamily ?? null,
        fontSize: fontSize,
        color: textColor, //?? appStore.textSecondaryColor,
        height: 1.5,
        letterSpacing: latterSpacing,
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }

  Widget counter(String counter, String counterName) {
    return Column(
      children: <Widget>[
        Text(counter,
            style: TextStyle(
                color: colorPrimary, fontSize: 18, fontFamily: 'Medium'),
            textAlign: TextAlign.center),
        text(counterName,
            textColor: appStore.textPrimaryColor,
            fontSize: textSizeMedium,
            fontFamily: fontMedium),
      ],
    );
  }

  Widget profileImg() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: FractionalOffset.center,
      child: SelectedImage(image: _imageFile, onTap: _getImage),
    );
  }

  Widget profileContent() {
    return Container(
      margin: EdgeInsets.only(top: 55.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            text(userName,
                textColor: appStore.textPrimaryColor,
                fontSize: textSizeNormal,
                fontFamily: fontMedium),
            text(userEmail,
                textColor: colorPrimary,
                fontSize: textSizeMedium,
                fontFamily: fontMedium),
            Padding(
              padding: EdgeInsets.all(16),
              child: Divider(color: Color(0XFFDADADA), height: 0.5),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 90, left: 2, right: 2),
        physics: ScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Stack(
                  children: <Widget>[profileContent(), profileImg()],
                ),
              ),
              OutlineButton(
                onPressed: () {
                  _displayDialog();
                },
                child: Text('Edit'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
