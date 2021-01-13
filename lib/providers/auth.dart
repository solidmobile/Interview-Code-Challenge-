import 'dart:convert';

import 'package:code_test_chat_app/helper/constant.dart';
import 'package:code_test_chat_app/helper/sp.dart';
import 'package:flutter/widgets.dart';
//import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;

  String get token => _token;
  bool get isAuth => token != null;

  Future<bool> authenticate(String email, String password) async {
    //final url = 'https://com.simple.chat:433/login';

    try {
      await getString(sharedPreferenceRegisteredKey).then((value) {
        final retrievedData = json.decode(value);
        print("regData $retrievedData");

        if (email == retrievedData["email"] &&
            password == retrievedData["password"]) {
          var now = new DateTime.now();
          _token = now.millisecondsSinceEpoch.toString();
          notifyListeners();

          setBool(sharedPreferenceUserLoggedInKey, true);
        } else {
          throw "Please enter correct credential";
        }
      });
      return isAuth;
    } catch (e) {
      throw "Please register an account first.";
    }
  }

  Future<bool> register(String email, String username, String password) async {
    //final url = 'https://com.simple.chat:433/create';

    var retrievedData;
    final regData = json.encode({
      'email': email,
      'username': username,
      'password': password,
    });

    //save registered data as real data for login use
    setString(sharedPreferenceRegisteredKey, regData);

    await getString(sharedPreferenceRegisteredKey).then((value) {
      retrievedData = json.decode(value);
      print("regData $retrievedData");
    });

    if (retrievedData != null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<void> logout() async {
    setBool(sharedPreferenceUserLoggedInKey, false);
    _token = null;
    notifyListeners();
  }
}
