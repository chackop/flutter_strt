import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        color: Colors.deepPurple,
        child: Center(
            child: Text(
          sayHello(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        )));
  }

  String sayHello() {
    String hello;

    DateTime now = new DateTime.now();
    int hour = now.hour;
    int mint = now.minute;
    if (hour < 12) {
      hello = "Good Morning";
    } else {
      hello = "Good Afternoon";
    }
    String minutes = (mint < 10) ? "0" + mint.toString() : mint.toString();
    return "Its now " + hour.toString() + ":" + minutes + ". \n" + hello;
  }
}
