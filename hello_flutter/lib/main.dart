import 'package:flutter/material.dart';
import './screens/home.dart';

void main() => runApp(new MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hello Flutter App",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Title in app bar"),
            ),
            body: Home()));
  }
}
