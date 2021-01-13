import 'package:code_test_chat_app/helper/textstyle.dart';
import 'package:code_test_chat_app/providers/auth.dart';
import 'package:code_test_chat_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: primaryTextStyle(size: 18, color: appStore.textPrimaryColor),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            //color: appStore.backgroundColor,
            child: Center(
              child: Text(
                'Holmusk Chat',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          settingItem(
            context,
            "Dark Mode",
            onTap: () {
              appStore.toggleDarkMode();
            },
            leading: Icon(Icons.night_shelter),
            detail: Switch(
              value: appStore.isDarkModeOn,
              onChanged: (s) {
                appStore.toggleDarkMode(value: s);
              },
            ),
          ),
          Divider(height: 0),
          buildListTile('Logout', Icons.logout, () async {
            await Provider.of<Auth>(context, listen: false).logout();
            Navigator.of(context).pop();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AuthScreen()),
                (Route<dynamic> route) => false);
          }),
        ],
      ),
    );
  }
}

Widget settingItem(context, String text,
    {Function onTap,
    Widget detail,
    Widget leading,
    Color textColor,
    int textSize,
    double padding}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin:
          EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                    child: leading ?? SizedBox(),
                    width: 30,
                    alignment: Alignment.center),
                leading != null
                    ? SizedBox(
                        width: 14,
                      )
                    : SizedBox(),
                Expanded(
                  child: Text(text,
                      style: primaryTextStyle(
                          size: textSize ?? 18,
                          color: textColor ?? appStore.textPrimaryColor)),
                ),
              ],
            ),
          ),
          detail ??
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: appStore.textSecondaryColor),
        ],
      ),
    ),
  );
}
