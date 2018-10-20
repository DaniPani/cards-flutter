import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';
import 'screens/home/index.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/Auth': (BuildContext context) => _AuthPage(),
    '/Home': (BuildContext context) => _HomePage()
  };

  Routes() {
    runApp(MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(primaryColor: Colors.white),
      home: _AuthPage(),
    ));
  }
}
