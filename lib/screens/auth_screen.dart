import 'package:code_test_chat_app/providers/auth.dart';
import 'package:code_test_chat_app/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'tabs_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLoading = false;

  Future _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        //login
        try {
          await Provider.of<Auth>(context, listen: false).authenticate(
            email,
            password,
          );

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TabsScreen()));
        } catch (e) {
          Scaffold.of(ctx).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: Theme.of(ctx).errorColor,
            ),
          );
        }
      } else {
        //register
        try {
          final d = await Provider.of<Auth>(context, listen: false).register(
            email.trim(),
            username.trim(),
            password.trim(),
          );

          if (d == true) {
            Scaffold.of(ctx).showSnackBar(
              SnackBar(
                content: Text("Registered Successfully..."),
                backgroundColor: Colors.green,
              ),
            );
          }
        } catch (e) {
          Scaffold.of(ctx).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
      setState(() {
        _isLoading = false;
      });
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
