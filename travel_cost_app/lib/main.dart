import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hello Users Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HelloUser(),
    );
  }
}

class HelloUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HelloYouState();
    
}
  
class _HelloYouState extends State<HelloUser> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Please input text'
              ),
              onChanged: (String string) {
                setState(() {
                  name = string;            
                });
              },
            ),
            Text('Hello ' + name + ' !')
          ],
        ),
      )
    );
  }
}
