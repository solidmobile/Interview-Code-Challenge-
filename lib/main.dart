import 'package:code_test_chat_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'helper/constant.dart';
import 'helper/sp.dart';
import 'helper/theme.dart';
import 'providers/auth.dart';
import 'screens/auth_screen.dart';
import 'screens/tabs_screen.dart';
import 'store/AppStore.dart';

AppStore appStore = AppStore();

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();

  appStore.toggleDarkMode(value: true);

  runApp(MyApp());
  //endregion
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: Observer(
        builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mock Chat',
            theme: !appStore.isDarkModeOn
                ? AppThemeData.lightTheme
                : AppThemeData.darkTheme,
            home: FutureBuilder(
                future: getBool(sharedPreferenceUserLoggedInKey),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  } else if (snapshot.data == true) {
                    return TabsScreen();
                  } else {
                    return SplashScreen(
                        seconds: 4,
                        navigateAfterSeconds: AuthScreen(),
                        title: new Text('Welcome'),
                        image: new Image.asset('assets/images/logo.png'),
                        backgroundColor: appBackgroundColorDark,
                        styleTextUnderTheLoader: new TextStyle(),
                        photoSize: 60.0,
                        loaderColor: Colors.red);
                  }
                })),
      ),
    );
  }
}
